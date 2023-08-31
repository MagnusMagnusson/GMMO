import { Entity } from "./Entity.js";

export class Player extends Entity{
    socket;
    isHuman;
    constructor(name, x, y, socket){
        super(name, x, y);
        this.isHuman = true;
        this.socket = socket;
        this.scene = undefined;
        this.isLoggedIn = false;
    }

    emit(event, data){
        if(this.socket){
            this.socket.emit(event, data);
        }
    }
};