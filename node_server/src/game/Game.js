import { Player } from "./entity/Player.js";
import { Scene } from "./scene/Scene.js";
import Database from '../database/database.js';
import database from "../database/database.js";

export class Game {
    scenes = [];
    defaultScene;
    allPlayers = [];
    lastTick = 0;

    constructor(){
        this.defaultScene = new Scene({name : "Default", type : "village", players : []});
        this.defaultScene.permanent = true;

        this.scenes.push(this.defaultScene);
    }

    addPlayer(socket){
        const p = new Player("Unknown Player", 100, 100, socket);
        this.addBindings(p);
        p.emit("connected", {
            success:true
        });
        database.Gamedata.Items(socket);
        database.Gamedata.Entities(socket);
        database.Gamedata.Dungeons(socket);
        database.Gamedata.Skills(socket);
        this.allPlayers.push(p);
        return p;
    }

    disconnectPlayer(player){
        const scene = player.scene;
        if(scene){
            scene.broadcast('player-disconnected', {
                id: player.id
            });
            scene.players = scene.players.filter(p => p != player);
            if(scene.players.length === 0 && !scene.permanent){
                this.scenes = this.scenes.filter(s => s != scene);
            }
        }
        this.allPlayers = this.allPlayers.filter(p => p !== player);

    }

    addBindings(player){
        const socket = player.socket;
        socket.on('login', ({username, password}) => {
            if(player.isLoggedIn){
                socket.emit('login-result', {
                    success : false,
                    reason: "Already Logged In"
                });
            } else {
                Database.Login(username, password).then(({success, character, reason}) => {
                    if(!success){
                        socket.emit('login-result', {success : false, reason : reason ||"unknown error"});
                    } else {
                        player.isLoggedIn = true;
                        player.character = character;
                        player.name = character.name;
                        socket.emit('login-result', {success,
                            character: {
                                ...character,
                                id: player.id
                        }});
                        this.defaultScene.addPlayer(player);
                    }
                });
            }
        });

        socket.on('create-account', ({username, password, character}) => {
            Database.NewUser(username, password, character).then(({success, character, reason}) => {
                if(success){
                    socket.emit('login-result', {
                        success : true,
                        character: {
                            ...character,
                            id: player.id
                        }
                    });
                    player.character = character;
                    this.defaultScene.addPlayer(player);
                    player.name = character.name;
                    player.isLoggedIn = true;
                } else {
                    socket.emit('login-result', {
                        success : false,
                        reason: reason
                    });
                }

            });
        });

        socket.on('chat', ({message}) => {
            if(player && player.scene){
                console.log("exists");
                player.scene.broadcast("chat", {
                    player : player.character.name,
                    message : message,
                    gang: player.character.gang,
                })
            }
        });
        //Add on-connection bindings here
    }
}