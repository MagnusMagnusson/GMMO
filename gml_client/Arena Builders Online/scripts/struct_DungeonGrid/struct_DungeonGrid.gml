function DungeonGrid(_width, _height) constructor {
    width = _width;
    height = _height;
    
    cells = array_create_ext(_width * _height, method(self, function(i) {
        return new DungeonCell(self, i mod width, i div width);
    }));
    
    static get_at = function(_x, _y) {
        return cells[_y * width + _x];
    }
}
