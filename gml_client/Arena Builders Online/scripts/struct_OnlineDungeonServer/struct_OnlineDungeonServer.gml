function OnlineDungeonServer() : DungeonServer() constructor {
    // we might want to add some plumbing here to receive responses from the server properly
    
    static request_action = function() {
        throw "I don't know what API to use to send a request, or how to receive server response with the socket API, sorry.";
    }
}
