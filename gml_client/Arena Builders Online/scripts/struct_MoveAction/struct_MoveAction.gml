function MoveAction(_actor, _turnid, _xoffset, _yoffset) : GameAction(_actor, _turnid) constructor {
    if (is_undefined(_actor))
        return;
    
    is_standalone = false;
    
    actor = ctrl_DungeonEntities.resolve_entity(_actor);
    xoffset = _xoffset;
    yoffset = _yoffset;
    
    static prepare = function(_actor, _xoffset, _yoffset) {
        return new MoveAction(_actor, ctrl_DungeonFlow.current_turn.turn_id, _xoffset, _yoffset);
    }
    
    static request = function(_actor, _xoffset, _yoffset) {
        var _action = prepare(_actor, _xoffset, _yoffset);
        ctrl_DungeonFlow.request_action(_action);
    }
    
    static prepare_str = function(_actor, _path) {
        var _dir = string_char_at(_path, 1);
        var _turn_id = ctrl_DungeonFlow.current_turn.turn_id;
        switch (_dir) {
            case "X":
                return new SkipAction(_actor, _turn_id);
            case "R":
                return new MoveAction(_actor, _turn_id, 1, 0)
            case "U":
                return new MoveAction(_actor, _turn_id, 0, -1);
            case "L":
                return new MoveAction(_actor, _turn_id, -1, 0);
            case "D":
                return new MoveAction(_actor, _turn_id, 0, 1);
            default:
                throw $"Unknown direction letter '{_dir}'.";
        }
    }
    
    static request_str = function(_actor, _path) {
        var _action = prepare_str(_actor, _path);
        ctrl_DungeonFlow.request_action(_action);
    }
    
    static predict = function() {
        var _target_x = actor.predicted_cell.x + xoffset;
        var _target_y = actor.predicted_cell.y + yoffset;
        return actor.predict_move_to(_target_x, _target_y);
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
        return { type: "move", actor: actor.key, turn_id: turn_id, xoffset: xoffset, yoffset: yoffset };
    }
    
    static deserialize = function(_data) {
        return new MoveAction(_data.actor, _data.turn_id, _data.xoffset, _data.yoffset);
    }
}

// creating the statics
var _base_dummy = new GameAction(undefined, 0);
var _dummy = new MoveAction(undefined, 0, 0, 0);
