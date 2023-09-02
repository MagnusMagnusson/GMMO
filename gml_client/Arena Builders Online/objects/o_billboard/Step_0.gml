if(target_alpha != image_alpha){
	image_alpha += sign(target_alpha - image_alpha) * (0.5 / room_speed);
	image_alpha = clamp(image_alpha,0,1);
}