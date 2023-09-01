global.io = new socket_io(server_url, server_port);
global.connected = false;
alarm[0] = room_speed * 10;

global.io.on("connected", function(){
	global.connected = true;
	room_goto_next();
	alarm[0] = -1;
});


global.io.on("login-response", function(data){
	if(data.success){
		global.player = data.character;
		room_goto_next();
	} else {
		error = data.error;
		waiting = false;
	}
});