function SkipAction(_actor, _turnid) : GameAction(_actor, _turnid) constructor {
    if (is_undefined(_actor))
        return;
    
    is_standalone = false;
    
    actor = ctrl_DungeonEntities.resolve_entity(_actor);
    
    static prepare = function(_actor) {
        return new SkipAction(_actor, ctrl_DungeonFlow.current_turn.turn_id);
    }
    
    static request = function(_actor) {
        var _action = prepare(_actor);
        ctrl_DungeonFlow.request_action(_action);
    }
    
    static predict = function() {
        return true;
    }
    
    static init = function() {
        // do nothing
    }
    
    static complete = function() {
        // do nothing still
    }
    
    static serialize = function() {
        return { type: "skip", actor: actor.key, turn_id: turn_id };
    }
    
    static deserialize = function(_data) {
        return new SkipAction(_data.actor, _data.turn_id);
    }
}

// creating the statics
var _base_dummy = new GameAction(undefined, 0);
var _dummy = new SkipAction(undefined, 0);
