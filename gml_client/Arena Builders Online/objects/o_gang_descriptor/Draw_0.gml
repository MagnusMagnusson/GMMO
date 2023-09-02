
draw_set_color(c_white);
if(!selected){
	draw_text(x,y, "Select a faction to join.");
} else {
	draw_set_alpha(0.33);
	draw_set_color(c_black);
	var desc = selected.descriptions[selected.index];
	draw_rectangle(
		x - 2,
		y - 2 + string_height("2"), 
		x + (room_width / 2) + 2,
		y + 2 + string_height("2") + string_height_ext(desc, string_height("a"), room_width / 2), 
		false
	);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(x,y, selected.gangs[selected.index]);
	draw_text_ext(x,y + string_height("2"), desc, string_height("a"), room_width / 2);
}