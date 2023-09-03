perform_walk = function(_cell) {
    var _context = { actor: self.actor, xfrom: self.xfrom, yfrom: self.yfrom, target_cell: _cell };
    return method(_context, function() {
        MoveAction.request(actor, target_cell.x - xfrom, target_cell.y - yfrom);
    });
}

get_walk_cellmap = function(_actor) {
    return ctrl_DungeonView.grid.create_cellmap(method({ actor: _actor }, function(_cell) {
        return _cell.is_walkable_by(actor);
    }));
}

create_commands = function(_actor, _xfrom, _yfrom, _range, _cellmap, _selector) {
    instance_destroy(obj_CellCommand);
    
    var _field = FieldOfSight.explore(ctrl_DungeonView.grid, _xfrom, _yfrom, _range, _cellmap);
    var _selector_context = { actor: _actor, xfrom: _xfrom, yfrom: _yfrom };
    var _context = { selector: method(_selector_context, _selector) };
    array_foreach(_field.found_cells, method(_context, function(_cell) {
        var _command = selector(_cell);
        if (!is_undefined(_command))
            instance_create_layer(0, 0, "Instances", obj_CellCommand, { command: _command, cell: _cell, image_blend: c_orange });
    }));
}

var _player_id = struct_get_names(ctrl_DungeonEntities.all_players)[0];
var _player_entity = ctrl_DungeonEntities.resolve_entity(_player_id);

var _timer = get_timer();
var _cellmap = get_walk_cellmap(_player_entity);
create_commands(_player_entity, _player_entity.current_cell.x, _player_entity.current_cell.y, 5, _cellmap, perform_walk);
show_debug_message(string(get_timer() - _timer) + "ms");