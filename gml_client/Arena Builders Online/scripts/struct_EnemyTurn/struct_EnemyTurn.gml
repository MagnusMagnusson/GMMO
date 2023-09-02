function EnemyTurn(_actors, _id) : GameplayTurn(_actors, _id) constructor {

    static process = function() {
        var _actions = [];
        struct_foreach(remaining_actors, method({ actions: _actions }, function(_key, _value) {
            var _actor = ctrl_DungeonEntities.resolve_entity(_key);
            array_push(actions, _actor.behavior.decide_action());
        }));
        
        var _top_priority = 0;
        var _current_action = undefined;
        var _length = array_length(_actions);
        for (var i = 0; i < _length; i++) {
            var _action = _actions[i];
            if (_action.priority < 0) {
                _top_priority = 999999999;
                _current_action = undefined;
                ctrl_DungeonServer.request_action(_action.action);
            } else if (_action.priority >= _top_priority) {
                _top_priority = _action.priority;
                _current_action = _action.action;
            }
        }
        
        if (!is_undefined(_current_action))
            ctrl_DungeonServer.request_action(_current_action);
    }
    
    static make_next_turn = function() {
        if (struct_names_count(ctrl_DungeonEntities.all_players) > 0)
            return new PlayerTurn(ctrl_DungeonEntities.all_players, turn_id + 1);
        else if (struct_names_count(ctrl_DungeonEntities.all_allies) > 0)
            return new AllyTurn(ctrl_DungeonEntities.all_allies, turn_id + 1);
        else if (struct_names_count(ctrl_DungeonEntities.all_enemies) > 0)
            return new EnemyTurn(ctrl_DungeonEntities.all_enemies, turn_id + 1);
        else
            return new NeitherTurn({}, turn_id + 1);
    }
}