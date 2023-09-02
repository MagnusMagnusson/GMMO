if(waiting){
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(xOrigin, yOrigin +  3 * string_height("A"), "Please wait");
	exit;
}
draw_set_color(c_black);
draw_set_alpha(selected == 1 ? 0.7 : 0.4);
draw_rectangle(xOrigin - box_width / 2, yOrigin + 1*string_height("A"), xOrigin +  box_width/2, yOrigin +2*string_height("A"), false);
draw_set_alpha(selected == 2 ? 0.7 : 0.4);
draw_rectangle(xOrigin -  box_width / 2, yOrigin + 4*string_height("A"), xOrigin +  box_width/2, yOrigin +5*string_height("A"), false);
draw_set_alpha(selected == 3 ? 0.7 : 0.4);
draw_rectangle(xOrigin -  box_width / 2, yOrigin + 7*string_height("A"), xOrigin +  box_width/2, yOrigin +8*string_height("A"), false);

draw_set_alpha(1);
draw_set_color(c_maroon);
draw_rectangle(xOrigin -  box_width / 2, yOrigin + 9*string_height("A"), xOrigin +  box_width/2, yOrigin + 10*string_height("A"), false);
draw_set_color(c_white);
draw_rectangle(xOrigin -  box_width / 2, yOrigin + 9*string_height("A"), xOrigin +  box_width/2, yOrigin + 10*string_height("A"), true);


draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(xOrigin, yOrigin, "Desired Username (preferrably your gmc username)");
draw_text(xOrigin, yOrigin + string_height("A"), username);
draw_text(xOrigin, yOrigin +  3 * string_height("A"), "Password");
draw_text(xOrigin, yOrigin + 4 * string_height("A"), string_repeat("*", string_length(password)));
draw_text(xOrigin, yOrigin +  6 * string_height("A"), "Repeat Password");
draw_text(xOrigin, yOrigin + 7 * string_height("A"), string_repeat("*", string_length(repeat_password)));
draw_text(xOrigin, yOrigin + 9 * string_height("A"), "Create Character!");

draw_set_color(c_white);
draw_text(xOrigin, yOrigin + 11 * string_height("A"), error);


draw_set_halign(fa_left);
draw_set_color(c_black);