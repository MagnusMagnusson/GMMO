export class Scene {
    name = "Unnamed Scene";
    type
    players = [];
    server_entities = [];
    last_status_update = 0;
    permanent = false;
    width = 1366;
    height = 768;

    constructor({name, type, players}){
        this.name = name;
        this.players = players;
        this.type = type;
    }

    addEntity(entity){
        entity.scene = this;
        this.server_entities.push(entity);
    }

    removePlayer(player, message){
        if(this.players.findIndex(player)){
            this.players = this.players.filter(p => p !== player);
            this.broadcast('player-disconnected', {
                id : p.id,
                message
            });
        }
    }

    addPlayer(player){
        console.log("Adding player to scene");
        if(player.scene && player.scene !== this){
            player.scene.removePlayer(player, " went to " + this.name);
        }
        if(player.scene === this){
            console.log("He is already there!");
            return;
        }
        player.scene = this;
        this.players.push(player);
        player.emit('change-scene', {scene : this.type, state : this.getFullState()});
        this.broadcast('player-connected', {
            player : player.getFullState()
        });
    }

    broadcast(event, data){
        for(const p of this.players){
            p.emit(event, data);
        }
    }

    getState(){
        return {
            players : this.players.map(p => p.getState()),
            entities : this.server_entities.map(e => e.getState())
        };
    }
    getFullState(){
        return {
            players : this.players.map(p => p.getFullState()),
            entities : this.server_entities.map(e => e.getFullState())
        };
    }
}