import { Player } from "./entity/Player.js";
import { Scene } from "./scene/Scene.js";

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
        const p = new Player("Test player", 100, 100, socket);
        this.addBindings(p);
        p.scene = this.defaultScene;
        this.defaultScene.players.push(p);
        p.send("you", {
            id: p.id,
            x : p.x,
            y: p.y,
            scene : this.defaultScene.name,
        });
        p.send("scene-state", {
            ...p.scene.getState()
        });
        p.scene.broadcast('player-connected', {
            id : p.id,
            name : p.name,
            x: p.x,
            y : p.y,
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
        //Add bindings here if needed
    }
}