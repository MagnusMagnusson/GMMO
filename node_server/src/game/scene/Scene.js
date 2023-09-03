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

    removePlayer(player){
        if(this.players.findIndex(player)){
            this.players = this.players.filter(p => p !== player);
            this.broadcast('player-left-scene', {
                id : p.id
            });
        }
    }

    addPlayer(player){
        if(player.scene && player.scene !== this){
            player.scene.removePlayer(player);
        }
        player.scene = this;
        player.emit('change-scene', {scene : this.type, state : this.getState()});
        this.broadcast('player-joined-scene', {
            player : player.getState()
        });
        this.players.push(player);
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
}