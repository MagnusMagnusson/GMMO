
function bindServerLoginEvents(){
	global.io.on("connected", function(){
		//The server has responded to our connection, socket communication is established. 
		global.connected = true;
		room_goto_next();
		alarm[0] = -1;
	});


	global.io.on("login-result", function(data){
		//The server is attempting to log us in, and has gotten a result
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
}