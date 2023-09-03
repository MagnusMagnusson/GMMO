function AiAction(_action, _priority) constructor {
    if (is_undefined(_action))
        return;
    
    action = _action;
    priority = _priority;
    
    static create = function(_action, _priority) {
        return new AiAction(_action, _priority);
    }
}

// initialising the statics
var _dummy = new AiAction(undefined, 0);
