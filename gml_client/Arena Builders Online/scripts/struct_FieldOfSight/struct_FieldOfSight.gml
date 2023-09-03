function FieldOfSight(_grid, _xfrom, _yfrom, _range, _cellmap) constructor {
    if (is_undefined(_grid))
        return;
    
    grid = _grid;
    xfrom = _xfrom;
    yfrom = _yfrom;
    range = _range;
    cellmap = _cellmap;
    
    found_cells = [];
    border_cells = [];
    border_cells_by_id = {};
    
    /// feather ignore GM2043
    raycast();
    
    static explore = function(_grid, _xfrom, _yfrom, _range, _cellmap) {
        LineOfSight.explore_up_to_range(_range);
        return new FieldOfSight(_grid, _xfrom, _yfrom, _range, _cellmap);
    }
    
    static raycast = function() {
        nodes_to_check = array_create(grid.width * grid.height, undefined);
        nodes_to_check[0] = NodeOfSight.root;
        last_idx = 0;
    
        while (last_idx >= 0) {
            var _current_node = nodes_to_check[last_idx];
            last_idx--;
        
            if (_current_node.distance == range)
                continue;
        
            array_foreach(_current_node.next_nodes, method(self, self.handle_next_node));
        }
    }
    
    static can_add_node = function(_node) {
        var _xx = xfrom + _node.xoffset;
        if (_xx < 0 || _xx >= grid.width)
            return false;
        
        var _yy = yfrom + _node.yoffset;
        if (_yy < 0 || _yy >= grid.height)
            return false;
        
        if (!cellmap[grid.width * _yy + _xx])
            return false;
        
        switch (_node.last_segment) {
            case "r":
                return cellmap[grid.width * (_yy + 1) + _xx] || cellmap[grid.width * _yy + (_xx - 1)];
            case "u":
                return cellmap[grid.width * (_yy + 1) + _xx] || cellmap[grid.width * _yy + (_xx + 1)];
            case "l":
                return cellmap[grid.width * (_yy - 1) + _xx] || cellmap[grid.width * _yy + (_xx + 1)];
            case "d":
                return cellmap[grid.width * (_yy - 1) + _xx] || cellmap[grid.width * _yy + (_xx - 1)];
            default:
                return true;
        }
    }
    
    static handle_next_node = function(_node) {
        if (can_add_node(_node)) {
            last_idx++;
            nodes_to_check[last_idx] = _node;
            
            if (_node.is_end) {
                var _found_cell = grid.get_at(xfrom + _node.xoffset, yfrom + _node.yoffset);
                array_push(found_cells, _found_cell);
            }
        } else {
            if (_node.is_diagonal)
                return;
            
            var _border_cell = grid.get_at(xfrom + _node.xoffset, yfrom + _node.yoffset);
            if (is_undefined(_border_cell) || struct_exists(border_cells_by_id, _border_cell.cell_id))
                return;
            
            array_push(border_cells, _border_cell);
        }
    }
}

var _dummy = new FieldOfSight(undefined, 0, 0, 0, undefined);
