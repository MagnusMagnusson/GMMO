draw_set_alpha(image_alpha);
if(sprite_index){
	draw_self();
}
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(room_width / 2, room_height / 2, text);
draw_set_alpha(1);
draw_set_halign(fa_left);