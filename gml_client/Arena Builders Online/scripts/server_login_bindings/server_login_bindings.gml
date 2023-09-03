
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

	global.io.on("gamedata", function(data){
		//The server has sent over game data - there are four datatypes: Dungeons, Items, skills, and entities (aka, enemies)
		var dataType = data.type;
		var struct;
		switch(dataType){
			case "items": {
				struct = ItemData;
				break;
			}
			case "skills": {
				struct = SkillData;
				break;
			}
			case "entities":{
				struct = EntityData;
				break;
			}
			case "dungeon" : {
				struct = DungeonData;
				break;
			}
			default : {
				show_debug_message("Unknown gamdatatype " + dataType);
				return;
			}
		}
		
		for(var i = 0; i < array_length(data.data); i++){
			var obj = data.data[i];
			global.GameData[dataType][obj.id] = new struct(obj);
		}
	});
}