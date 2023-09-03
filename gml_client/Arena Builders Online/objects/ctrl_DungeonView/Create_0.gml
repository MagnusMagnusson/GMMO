grid = ctrl_DungeonGameplay.grid;

left_x = 180;
top_y = 0;
cell_width = 45;
cell_height = 45;

var _timer = get_timer();
LineOfSight.explore_up_to_range(5);
show_debug_message(get_timer() - _timer);
