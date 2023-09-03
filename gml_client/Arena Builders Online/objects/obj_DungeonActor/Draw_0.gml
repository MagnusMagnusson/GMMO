if (!is_undefined(ongoing_animation))
    ongoing_animation.draw();
else
    draw_sprite_ext(sprite_index, 0, x, y, 
	ctrl_DungeonView.cell_width / DUNGEON_CELL_SIZE, 
	ctrl_DungeonView.cell_height / DUNGEON_CELL_SIZE,
	image_angle,
	image_blend,
	image_alpha
);
