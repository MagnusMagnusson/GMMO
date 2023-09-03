function GameAction(_actor, _turnid) constructor {
    if (is_undefined(_actor))
        return;
    
    is_standalone = true;
    
    actor = _actor;
    turn_id = _turnid;
    
    is_completed = false;
    
    static predict = function() {
        throw $"{instanceof(self)}.predict() is not implemented.";
    }
    
    static init = function() {
        throw $"{instanceof(self)}.init() is not implemented.";
    }
    
    static process = function() {
        actor.instance.process_animation();
        if (!is_undefined(actor.instance.ongoing_animation))
            return;
        
        complete();
        is_completed = true;
    }
    
    static complete = function() {
        throw $"{instanceof(self)}.complete() is not implemented.";
    }
    
    static serialize = function() {
        throw $"{instanceof(self)}.serialize() is not implemented.";
    }
    
    static deserialize = function(_action) {
        static type_mappings = {
            move: MoveAction,
            skip: SkipAction,
        };
        
        var _ctor = type_mappings[$ _action.type];
        if (is_undefined(_ctor))
            throw $"Unknown action type '{_action.type}'.";
        
        var _statics = static_get(_ctor);
        return _statics.deserialize(_action);
    }
}

// creating the statics
var _dummy = new GameAction(undefined, 0);
