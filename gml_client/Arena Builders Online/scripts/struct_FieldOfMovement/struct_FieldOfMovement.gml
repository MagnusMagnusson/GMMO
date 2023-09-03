function FieldOfMovement(_grid, _xfrom, _yfrom, _range, _cellmap) constructor {
    if (is_undefined(_grid))
        return;
    
    grid = _grid;
    xfrom = _xfrom;
    yfrom = _yfrom;
    cellfrom = grid.get_at(xfrom, yfrom);
    range = _range;
    cellmap = _cellmap;
    
    found_cells = [];
    found_paths = {};
    
    /// feather ignore GM2043
    floodfill();
    
    static explore = function(_grid, _xfrom, _yfrom, _range, _cellmap) {
        return new FieldOfMovement(_grid, _xfrom, _yfrom, _range, _cellmap);
    }
    
    static floodfill = function() {
        var _cells_to_check = array_create(grid.width * grid.height, undefined);
        _cells_to_check[0] = { cell: cellfrom, path: "" };
        var _last_idx = 0;
        
        while (last_idx >= 0) {
            var _current_cell = _cells_to_check[last_idx];
            last_idx--;
            
            var _existing_path = found_paths[$ _current_cell.cell.cell_id];
            if (is_undefined(_existing_path) || string_length(_current_cell.path) < string_length(_existing_path))
                found_paths[$ _current_cell.cell.cell_id] = _current_cell.path;
            else
                continue;
            
            if (string_length(_current_cell.path) == range)
                continue;
            
            var _cx = _current_cell.cell.x;
            var _cy = _current_cell.cell.y;
            if (cellmap[grid.width * _cy + (_cx + 1)]) {
                _last_idx++;
                _cells_to_check[_last_idx] = { cell: grid.get_at(_cx + 1, _cy), path: _current_cell.path + "R" };
            }
            if (cellmap[grid.width * (_cy - 1) + _cx]) {
                _last_idx++;
                _cells_to_check[_last_idx] = { cell: grid.get_at(_cx, _cy - 1), path: _current_cell.path + "U" };
            }
            if (cellmap[grid.width * _cy + (_cx - 1)]) {
                _last_idx++;
                _cells_to_check[_last_idx] = { cell: grid.get_at(_cx - 1, _cy), path: _current_cell.path + "L" };
            }
            if (cellmap[grid.width * (_cy + 1) + _cx]) {
                _last_idx++;
                _cells_to_check[_last_idx] = { cell: grid.get_at(_cx, _cy + 1), path: _current_cell.path + "D" };
            }
        }
    }
}