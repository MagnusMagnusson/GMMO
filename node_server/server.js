import GameServer from './src/server/server.js';

const server = new GameServer(parseInt(process.env.SERVER_PORT || 8080));