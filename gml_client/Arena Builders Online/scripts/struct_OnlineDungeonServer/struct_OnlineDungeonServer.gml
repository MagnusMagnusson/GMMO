function OnlineDungeonServer() : DungeonServer() constructor {
    // we might want to add some plumbing here to receive responses from the server properly
    static request_action = function(_serialized_action) {
		//Send a request action event to the server. 
		//See server responses in 'server_dungeon_bindings'
       global.io.emit("request-action", _serialized_action);
    }
}