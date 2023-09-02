global.io = new socket_io(server_url, server_port);
global.connected = false;
alarm[0] = room_speed * 10;

global.io.on("connected", function(){
	global.connected = true;
	room_goto_next();
	alarm[0] = -1;
});


global.io.on("login-result", function(data){
	with(o_login){	
		if(data.success){
			json_save("login",{
				username : username,
				password: password
			});
			global.player = data.character;
			room_goto(rm_Dungeon);
		} else {
			error = data.reason;
			waiting = false;
			alarm[1] = room_speed;
		}
	}	
	
	with(o_new_account){	
		if(data.success){
			global.player = data.character;
			json_save("login",{
				username : username,
				password: password
			})
			room_goto(rm_Dungeon);
		} else {
			error = data.reason;
			waiting = false;
			alarm[1] = room_speed;
		}
	}
});