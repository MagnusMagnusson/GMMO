function bindServerGenericEvents(){
	global.io.on("player-connected", function(data){
		//A player has been connected to the same scene as we are in. 
	});	
	
	global.io.on("player-disconnected", function(data){
		throw "not implemented";
	});
	
	global.io.on("change-scene", function(data){
		o_socket_director.initState = data.state;
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
			ds_list_add(log, [data.player, data.message, data.gang]);
		}
	});
}