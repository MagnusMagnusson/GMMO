// handle walls

with (probj_Wall) {
    var _cx = x div 90;
    var _cy = y div 90;
    terrain_grid[_cx, _cy] = "#";
}

// handle players

with (probj_Player) {
    var _player_count = array_length(player_data);
    var _cx = x div 90;
    var _cy = y div 90;
    
    switch (_player_count) {
        case 1:
            add_player(_cx, _cy, player_data[0]);
            break;
        
        case 2: 
            add_player(_cx + 1, _cy, player_data[0]);
            add_player(_cx - 1, _cy, player_data[1]);
            break;
        
        case 3:
            add_player(_cx, _cy - 1, player_data[0]);
            add_player(_cx - 1, _cy + 1, player_data[1]);
            add_player(_cx + 1, _cy + 1, player_data[2]);
            break;
        
        case 4:
            add_player(_cx + 1, _cy - 1, player_data[0]);
            add_player(_cx - 1, _cy - 1, player_data[1]);
            add_player(_cx - 1, _cy + 1, player_data[2]);
            add_player(_cx + 1, _cy + 1, player_data[3]);
            break;
    }
}

// handle enemies

with (probj_Enemy) {
    
}
