import {Server} from 'socket.io';
import express from 'express';
import http from 'http';
import { Game } from '../game/Game.js';
import database from '../database/database.js';

const started = new Date();

export class GameServer {
    io = undefined;
    allConnections = [];
    game = new Game();
    constructor(port){
        const app = express();
        
        app.get("/", (req, res) => {
            res.send(`
                <html>
                    <head>
                        <title>Arena Builders Online</title>
                    </head>
                    <body>
                        <b>Arena Builders Online, Socket server</b>
                        <p>There are currently ${this.allConnections.length} active connections</p>
                        <p>Server has been active since ${started.toISOString()}</p>
                        <p>Using prod database : ${database.USE_PROD}</p>
                    </body>
                </html>
            `);
        })
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