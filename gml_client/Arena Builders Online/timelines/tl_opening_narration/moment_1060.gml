var yoff =  300 * sin(2*2*pi / 5);
var xoff =  300 * cos(2*2*pi / 5)

instance_create_layer((room_width / 2) + xoff , (room_height / 2) + yoff, o_billboard.layer, o_glow, {
	color : blu_blue
});