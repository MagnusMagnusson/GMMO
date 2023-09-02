var yoff =  300 * sin(0*2*pi / 5);
var xoff =  300 * cos(0*2*pi / 5)

instance_create_layer((room_width / 2) + xoff , (room_height / 2) + yoff, o_billboard.layer, o_glow, {
	color : crimson_red
});