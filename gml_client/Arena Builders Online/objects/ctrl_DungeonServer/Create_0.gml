when_actions_received = new EventSubject();

server = new OfflineDungeonServer();

request_action = function(_action) {
    var _serialized_action = _action.serialize();
    show_debug_message($"SENDING {_serialized_action}");
    server.request_action(_serialized_action);
};

receive_actions = function(_actions) {
    show_debug_message($"RECEIVING {_actions}");
    var _deserialized_actions = array_map(_actions, GameAction.deserialize);
    when_actions_received.send(_deserialized_actions);
}
