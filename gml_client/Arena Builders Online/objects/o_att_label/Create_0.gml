instance_create_layer(x + 32 + 64, y - 20, layer, o_att_button, {
	index : index,
	image_index : 1,
	dad : id,
	onPressed : skill.decrease
})

instance_create_layer(x + 90 + 64+32, y - 20, layer, o_att_button, {	
	index : index,
	image_index : 0,
	dad : id,
	onPressed : skill.increase
});