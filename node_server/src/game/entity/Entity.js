const abc = "qwertyuiopasdfghjklzxcvbnm1234567890";
const randid = (n) => {
    let r = "";
    for(let i = 0; i < n; i++){
        r += abc[Math.floor(Math.random() * abc.length)];
    }
    return r;
}

export class Entity {
    x = 0;
    y = 0;
    name = undefined;
    id = undefined;
    scene = undefined;

    constructor(name, x, y){
        this.name = name;
        this.x = x;
        this.y = y;
        this.id = randid(7);
    }

    tick(delta){
    }

    getState(){
        return {
            id: this.id,
            name: this.id,
            x : this.x,
            y : this.y,
        }
    }
}

