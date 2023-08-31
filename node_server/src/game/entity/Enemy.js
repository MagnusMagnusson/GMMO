import { Entity } from "./Entity.js";

export class Enemy extends Entity{
    constructor(name, x, y, type){
        super(name, x, y);
        this.isHuman = false;
        this.type = type;
        this.scene = undefined;
    }
};