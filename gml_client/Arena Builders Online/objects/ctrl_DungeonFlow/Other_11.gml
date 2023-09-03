/// @desc Process incoming actions

while (array_length(received_actions) > 0) {
    var _next_action = received_actions[0];
    array_delete(received_actions, 0, 1);
    process_received_action(_next_action);
}

while (array_length(pending_actions) > 0) {
    var _next_action = pending_actions[0];
    if (_next_action.turn_id > current_turn.turn_id)
        break;
    
    if (array_length(ongoing_actions) > 0 && (_next_action.is_standalone || ongoing_actions[0].is_standalone))
        break;
    
    array_delete(pending_actions, 0, 1);
    process_pending_action(_next_action);
}

array_foreach(ongoing_actions, function(_action) { _action.process(); });
var _remaining_count = array_filter_ext(ongoing_actions, function(_action) { return !_action.is_completed });
array_resize(ongoing_actions, _remaining_count);

if (!current_turn.has_pending_actors() && array_length(ongoing_actions) == 0) {
    current_turn = current_turn.make_next_turn();
    current_turn.init();
}
