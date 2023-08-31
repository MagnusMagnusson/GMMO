function MoveAction(_actor, _xoffset, _yoffset) : GameAction(_actor) constructor {
    if (is_undefined(_actor))
        return;
    
    is_standalone = false;
    
    actor = ctrl_DungeonEntities.resolve_entity(_actor);
    xoffset = _xoffset;
    yoffset = _yoffset;
    
    static request = function(_actor, _xoffset, _yoffset) {
        var _action = new MoveAction(_actor, _xoffset, _yoffset);
        ctrl_DungeonServer.request_action(_action);
    }
    
    static init = function() {
        MoveAnimation.perform(actor.instance, xoffset, yoffset);
    }
    
    static complete = function() {
        var _target_x = actor.current_cell.x + xoffset;
        var _target_y = actor.current_cell.y + yoffset;
        actor.move_to(_target_x, _target_y);
    }
    
    static serialize = function() {
        return { type: "move", actor: actor.key, xoffset: xoffset, yoffset: yoffset };
    }
    
    static deserialize = function(_data) {
        return new MoveAction(_data.actor, _data.xoffset, _data.yoffset);
    }
}

// creating the statics
var _base_dummy = new GameAction(undefined);
var _dummy = new MoveAction(undefined, 0, 0);
