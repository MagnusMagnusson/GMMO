function bindServerDungeonEvents(){

	global.io.on("recieve-actions", function(data){
		//The server is sending over a series of actions.
		with(ctrl_DungeonServer){
			receive_actions(data.actions);
		}
	});
	
	global.io.on("syncronize-state", function(data){
		//The server has sent over the complete state of the dungeon. 
		//Useful for f.i the beginning of the run to make sure everyone starts off with the complete picture
		throw "Not implemented";
	});
	
	global.io.on("dungeon-started", function(data){
		//Everything is ready. The server is starting the dungeon. 
		throw "Not implemented";
	});	
	
	global.io.on("dungeon-ended", function(data){
		//The dungeon is finished, either with a win or loss. The server is telling you the final results. 
		throw "Not implemented";
	});
}