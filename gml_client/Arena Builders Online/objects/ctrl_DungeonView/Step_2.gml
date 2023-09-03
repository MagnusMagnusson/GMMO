array_foreach(grid.cells, function (_cell) {
    _cell.terrain.end_step();
});

/*
var _cellmap = array_map(grid.cells, function(_cell) {
    return is_undefined(_cell.entity);
});
if (mouse_check_button_pressed(mb_left)) {
    var _cx = (mouse_x - left_x) div cell_width;
    var _cy = (mouse_y - top_y) div cell_height;
    var _player_id = struct_get_names(ctrl_DungeonEntities.all_players)[0];
    var _player = ctrl_DungeonEntities.resolve_entity(_player_id);
    var _xfrom = _player.current_cell.x;
    var _yfrom = _player.current_cell.y;
    
    var _timer = get_timer();
    var _line = LineOfSight.trace(grid, _xfrom, _yfrom, _cx, _cy, _cellmap);
    show_debug_message(get_timer() - _timer);
    if (!is_undefined(_line))
        show_debug_message(_line.path);
    else
        show_debug_message("xxx");
}
*/
