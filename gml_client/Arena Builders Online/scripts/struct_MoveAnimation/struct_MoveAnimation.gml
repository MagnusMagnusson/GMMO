function MoveAnimation(_instance, _xoffset, _yoffset) : EntityAnimation(_instance) constructor {
    if (is_undefined(_instance))
        return;
    
    xoffset = _xoffset;
    yoffset = _yoffset;
    time = 0;
    max_time = 12;
    
    static perform = function(_instance, _xoffset, _yoffset) {
        var _animation = new MoveAnimation(_instance, _xoffset, _yoffset);
        _instance.begin_animation(_animation);
    }
    
    static process = function() {
        time++;
        if (time == max_time)
            is_completed = true;
    }
    
    static draw = function() {
        var _factor = time / max_time;
        var _current_xoffset = xoffset * _factor * ctrl_DungeonView.cell_width;
        var _current_yoffset = yoffset * _factor * ctrl_DungeonView.cell_height;
        
        with (instance) {
            draw_sprite_ext(sprite_index, image_index, x + _current_xoffset, y + _current_yoffset, ctrl_DungeonView.cell_width / DUNGEON_CELL_SIZE, ctrl_DungeonView.cell_height / DUNGEON_CELL_SIZE, image_angle, image_blend, image_alpha);
        }
    }
}

// initialise the statics
var _base_dummy = new EntityAnimation(undefined);
var _dummy = new MoveAnimation(undefined, 0, 0);
