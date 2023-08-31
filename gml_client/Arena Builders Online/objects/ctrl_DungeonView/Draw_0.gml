var _xstart = 0;
var _ystart = 0;
var _xend = grid.width;
var _yend = grid.height;
var _xoffset = 0;
var _yoffset = 0;

for (var i = _xstart; i < _xend; i++)
for (var j = _ystart; j < _yend; j++) {
    var _cell = grid.get_at(i, j);
    _cell.terrain.draw(left_x + cell_width * i, left_y + cell_height * j);
}