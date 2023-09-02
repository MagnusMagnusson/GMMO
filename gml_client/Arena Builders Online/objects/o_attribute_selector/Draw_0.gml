draw_set_color(c_white);
draw_text(x,y,"Select your attributes");
draw_text(x,y + string_height("s"),"Points left to assign: " + string(unspent_points.get_value()));
draw_text(x,y + 2*string_height("s"),@"Pick your preferred playstyle: 
it is hard to be a generalist.");

if(hover >= 0){
	var h = array_length(skills);
	draw_text(x, y + 128 + 64*( h), skills[hover].name);
	draw_text_ext(x, y + 128 + 64*( h) + string_height("A"), skills[hover].description, string_height("a"),  1.5 * (90 + 64+96));
}