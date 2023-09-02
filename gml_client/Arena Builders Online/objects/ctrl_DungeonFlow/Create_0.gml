received_actions = [];
pending_actions = [];
ongoing_actions = [];

current_turn = new PlayerTurn(ctrl_DungeonEntities.all_players, 1);
predicted_turn = new PlayerTurn(ctrl_DungeonEntities.all_players, 1);

request_action = function(_action) {
    current_turn.mark_requested(_action.actor);
    ctrl_DungeonServer.request_action(_action);
}

ctrl_DungeonServer.when_actions_received.subscribe(self, function(_actions) {
    array_foreach(_actions, method(self, queue_action));
});

queue_action = function(_action) {
    array_push(received_actions, _action);
}

process_received_action = function(_action) {
    var _actor = _action.actor;
    if (!predicted_turn.waits_for_actor(_actor))
        return;
    
    var _is_executed = _action.predict();
    if (!_is_executed && _action.turn_id == current_turn.turn_id) {
        current_turn.unmark_requested(_actor);
        return;
    }
    
    predicted_turn.complete_action_of(_actor);
    if (!predicted_turn.has_pending_actors())
        predicted_turn = predicted_turn.make_next_turn();
    
    array_push(pending_actions, _action);
}

process_pending_action = function(_action) {
    var _actor = _action.actor;
    if (!current_turn.waits_for_actor(_actor))
        throw $"Received an action for {_actor.name.get_value} in turn #{current_turn.turn_id} after the action was already executed.";
    
    current_turn.complete_action_of(_actor);
    array_push(ongoing_actions, _action);
    _action.init();
}
