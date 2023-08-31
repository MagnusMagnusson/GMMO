/// @desc Process incoming actions

while (array_length(pending_actions) > 0) {
    var _next_action = pending_actions[0];
    
    if (array_length(ongoing_actions) > 0 && (_next_action.is_standalone || ongoing_actions[0].is_standalone))
        break;
    
    array_delete(pending_actions, 0, 1);
    array_push(ongoing_actions, _next_action);
    _next_action.init();
}

array_foreach(ongoing_actions, function(_action) { _action.process(); });

var _remaining_count = array_filter_ext(ongoing_actions, function(_action) { return !_action.is_completed });
array_resize(ongoing_actions, _remaining_count);
