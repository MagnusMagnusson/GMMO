function DungeonCell(_grid, _x, _y) constructor {
    grid = _grid;
    x = _x;
    y = _y;
    
    terrain = new DungeonFloor();
    entity = undefined;
    
    static is_walkable_by = function(_creature) {
        return is_undefined(entity) && terrain.is_walkable_by(_creature);
    }
}
