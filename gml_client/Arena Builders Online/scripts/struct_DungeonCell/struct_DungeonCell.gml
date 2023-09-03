function DungeonCell(_grid, _x, _y) constructor {
    grid = _grid;
    x = _x;
    y = _y;
    cell_id = $"x{x}y{y}";
    
    terrain = new DungeonFloor();
    entity = undefined;
    predicted_entity = undefined;
    
    static get_towards = function(_xoffset, _yoffset) {
        return grid.get_at(x + _xoffset, y + _yoffset);
    }
    
    static is_walkable_by = function(_creature) {
        return is_undefined(predicted_entity) && terrain.is_walkable_by(_creature);
    }
    
    static predict_entity = function(_entity) {
        predicted_entity = _entity;
    }
    
    static distance_from = function(_cell) {
        return abs(x - _cell.x) + abs(y - _cell.y);
    }
}
