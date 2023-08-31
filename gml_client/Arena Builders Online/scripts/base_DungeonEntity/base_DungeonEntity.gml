function DungeonEntity(_cell) constructor {
    if (is_undefined(_cell))
        return;
    
    current_cell = _cell;
    current_cell.entity = self;
    
    key = "";
    ctrl_DungeonEntities.register_entity(self);
    
    instance = noone;
    
    static move_to = function(_cx, _cy) {
        var _grid = current_cell.grid;
        var _target_cell = _grid.get_at(_cx, _cy);
        if (!is_undefined(_target_cell.entity))
            throw $"Cannot move {instanceof(self)} from cell ({current_cell.x},{current_cell.y}) to occupied cell ({_cx},{_cy}).";
        
        current_cell.entity = undefined;
        current_cell = _target_cell;
        _target_cell.entity = self;
    }
    
    static swap_with = function(_cx, _cy) {
        var _grid = current_cell.grid;
        var _target_cell = _grid.get_at(_cx, _cy);
        var _target_entity = _target_cell.entity;
        
        current_cell.entity = _target_entity;
        if (!is_undefined(_target_entity))
            _target_entity.current_cell = current_cell;
        
        current_cell = _target_cell;
        _target_cell.entity = self;
    }
    
    static remove = function() {
        current_cell.entity = undefined;
        ctrl_DungeonEntities.unregister_entity(self);
    }
}
