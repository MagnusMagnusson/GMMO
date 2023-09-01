import { Player } from "./entity/Player.js";
import { Scene } from "./scene/Scene.js";
import Database from '../database/database.js';

export class Game {
    scenes = [];
    defaultScene;
    allPlayers = [];
    lastTick = 0;

    constructor(){
        this.defaultScene = new Scene({name : "Default", players : []});
        this.defaultScene.permanent = true;

        this.scenes.push(this.defaultScene);
    }

    addPlayer(socket){
        const p = new Player("Unknown Player", 100, 100, socket);
        this.addBindings(p);
        p.scene = this.defaultScene;
        this.defaultScene.players.push(p);
        p.emit("connected", {
            success:true
        });
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
                        socket.emit('login-result', { success, reason});
                    } else {
                        player.isLoggedIn = true;
                        player.character = character;
                        socket.emit({success, character});
                    }
                })
            }
        });
        //Add on-connection bindings here
    }
}