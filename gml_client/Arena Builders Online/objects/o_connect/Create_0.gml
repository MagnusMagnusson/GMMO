global.io = new socket_io(server_url, server_port);
global.connected = false;
alarm[0] = room_speed * 10;

bindServerGenericEvents();
bindServerLoginEvents();
bindServerVillageEvents();
bindServerDungeonEvents();