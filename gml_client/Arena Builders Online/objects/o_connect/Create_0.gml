global.io = new socket_io(server_url, server_port);
global.connected = false;
alarm[0] = room_speed * 10;

stage = 0;
stages = [
	"Connecting to server.",
	"Loading item data",
	"Loading skill data",
	"Loading entity data",
	"Loading dungeon data",
	"Starting game"
];

bindServerGenericEvents();
bindServerLoginEvents();
bindServerVillageEvents();
bindServerDungeonEvents();