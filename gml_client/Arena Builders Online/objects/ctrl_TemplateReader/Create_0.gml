width = room_width div 90;
height = room_height div 90;

terrain_grid = array_create(width * height, ".");
players = [];
allies = [];
enemies = [];

update_terrain = function(_cx, _cy, _value) {
    terrain_grid[_cy * width + _cx] = _value;
}

add_player = function(_cx, _cy, _data) {
    array_push(players, { x: _cx, y: _cy, data: _data });
}

add_ally = function(_cx, _cy, _data) {
    array_push(allies, { x: _cx, y: _cy, data: _data });
}

add_enemy = function(_cx, _cy, _data) {
    array_push(enemies, { x: _cx, y: _cy, data: _data });
}

alarm[0] = 1;
