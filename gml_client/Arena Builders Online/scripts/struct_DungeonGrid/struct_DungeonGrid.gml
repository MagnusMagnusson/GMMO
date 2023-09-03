function DungeonGrid(_width, _height) constructor {
    width = _width;
    height = _height;
    
    cells = array_create_ext(_width * _height, method(self, function(i) {
        return new DungeonCell(self, i mod width, i div width);
    }));
    
    static get_at = function(_x, _y) {
        if (_x < 0 || _y < 0 || _x >= width || _y >= height)
            return undefined;
        
        return cells[_y * width + _x];
    }
    
    static create_cellmap = function(_predicate) {
        return array_map(cells, _predicate);
    }
}
