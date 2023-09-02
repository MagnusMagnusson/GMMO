function bindServerDungeonEvents(){

	global.io.on("recieve-actions", function(data){
		//The server is sending over a series of actions.
		with(ctrl_DungeonServer){
			receive_actions(data.actions);
		}
	});
	
	global.io.on("syncronize-state", function(data){
		//The server has sent over the complete state of the dungeon. 
		throw "Not implemented";
	});
}