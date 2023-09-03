x = ctrl_DungeonView.left_x + ctrl_DungeonView.cell_width * cell.x;
y = ctrl_DungeonView.top_y + ctrl_DungeonView.cell_height * cell.y;

is_hovered = mouse_x >= x && mouse_y >= y && mouse_x < x + ctrl_DungeonView.cell_width && mouse_y < y + ctrl_DungeonView.cell_height;

if (is_hovered && mouse_check_button_pressed(mb_left)) {
    command();
    instance_destroy(obj_CellCommand);
}
