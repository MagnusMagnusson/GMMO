draw_set_color(color);
draw_set_alpha(image_alpha * 0.1);

for(var i = 0; i < 50; i++){
	draw_circle(x,y, i, false);
}

draw_set_alpha(1);