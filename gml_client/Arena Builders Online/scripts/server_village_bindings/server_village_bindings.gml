function bindServerVillageEvents(){
	global.io.on("party-invite", function(data){
		//Someone invited you to their party
		throw "not implemented"
	});
	
	global.io.on("party-reponse", function(data){
		//The person you invited to the party responded
		throw "not implemented"
	});
	
	global.io.on("party-changed", function(data){
		//Someone joined or left your party
		throw "not implemented"
	});
	
	global.io.on("dungeon-joined", function(data){
		//You, or someone in your party, is joining a dungeon queue
		throw "not implemented"
	});
	
	global.io.on("merits-status", function(data){
		//Get the current standings of the gang warfare
		throw "not implemented"
	});
	
	global.io.on("store-response", function(data){
		//You tried to buy something, and the server is telling you how that went. 
		throw "not implemented"
	});
}