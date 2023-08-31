export class Scene {
    name = "Unnamed Scene";
    players = [];
    server_entities = [];
    last_status_update = 0;
    permanent = false;
    width = 1366;
    height = 768;

    constructor({name, players}){
        this.name = name;
        this.players = players;
    }

    addEntity(entity){
        entity.scene = this;
        this.server_entities.push(entity);
    }

    broadcast(event, data){
        for(const p of this.players){
            p.emit(event, data);
        }
    }

    getState(){
        return {
            players : this.players.map(p => p.state()),
            entities : this.server_entities.map(e => e.state())
        };
    }
}