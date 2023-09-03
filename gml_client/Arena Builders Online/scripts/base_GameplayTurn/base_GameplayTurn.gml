function GameplayTurn(_actors, _id) constructor {
    turn_id = _id;
    
    remaining_actors = struct_map(_actors, function() { return false; });
    
    static init = function() {
        // do nothing
    }
    
    static process = function() {
        throw $"{instanceof(self)}.process() is not implemented.";
    }
    
    static waits_for_actor = function(_actor) {
        return struct_exists(remaining_actors, _actor.key);
    }
    
    static mark_requested = function(_actor) {
        remaining_actors[$ _actor.key] = true;
    }
    
    static unmark_requested = function(_actor) {
        remaining_actors[$ _actor.key] = false;
    }
    
    static has_pending_requests = function() {
        var _names = struct_get_names(remaining_actors);
        for (var i = 0; i < struct_names_count(remaining_actors); i++) {
            if (remaining_actors[$ _names[i]])
                return true;
        }
        return false;
    }
    
    static complete_action_of = function(_actor) {
        if (!waits_for_actor(_actor))
            throw $"The actor {_actor.name} already made their action in this turn.";
        
        struct_remove(remaining_actors, _actor.key);
    }
    
    static has_pending_actors = function() {
        return struct_names_count(remaining_actors) > 0;
    }
    
    static check_completed = function() {
        if (array_length(ctrl_DungeonActions.ongoing_actions) > 0 || array_length(ctrl_DungeonActions.pending_actions) > 0)
            return false;
        
        return !has_pending_actors();
    }
    
    static make_next_turn = function() {
        throw $"{instanceof(self)}.make_next_turn() is not implemented.";
    }
}
