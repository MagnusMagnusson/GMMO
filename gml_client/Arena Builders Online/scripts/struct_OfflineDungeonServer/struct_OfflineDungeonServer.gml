function OfflineDungeonServer() constructor {
    static request_action = function(_action) {
        ctrl_DungeonServer.receive_actions([_action]);
    }
}
