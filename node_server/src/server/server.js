import {Server} from 'socket.io';
import express from 'express';
import http from 'http';
import { Game } from '../game/Game.js';
import config from '../game/config.json' assert { type: 'json' };;

export class GameServer {
    io = undefined;
    allConnections = [];
    game = new Game();
    constructor(port){
        const app = express();
        app.use(express.static('static'));
        const server = http.createServer(app);
        this.io = new Server(server);
        server.listen(port, () => {
            console.log("MMO server started on port " + port);
        });

        this.io.on('connection', (socket) => {
            console.log("Player connected");
            const player = this.game.addPlayer(socket);
            this.allConnections.push(player);

            socket.on('disconnect', () => {
                console.log("Player disconnected");
                this.allConnections = this.allConnections.filter(p => player != p);
                this.game.disconnectPlayer(player);
            })
        });
        
    }
}

export default GameServer;