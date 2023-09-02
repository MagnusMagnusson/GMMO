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
}