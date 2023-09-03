function bindServerGenericEvents(){
	global.io.on("player-connected", function(data){
		//A player has been connected to the same scene as we are in. 
		throw "not implemented"
	});	
	
	global.io.on("player-disconnected", function(data){
		//A player we are aware of has left.
		throw "not implemented"
	});
	
	global.io.on("change-scene", function(data){
		switch(data.scene){
			case "dungeon" : {
				room_goto(rm_Dungeon);
				break;
			}
			
			case "village" :
			default : {
				room_goto(rm_village);
				break;
			}
		}
	});	
	
	global.io.on("chat", function(data){
		with(o_chat){
			ds_list_add(log, [data.player, data.message]);
		}
	});
}