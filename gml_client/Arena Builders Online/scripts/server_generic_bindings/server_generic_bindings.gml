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
		//The server is telling you to move to a new scene, f.i from the village to a dungeon.
		throw "not implemented"
	});	
	
	global.io.on("chat-message", function(data){
		//Someone in our scene is using the in-game chat function. 
		throw "not implemented"
	});
}