if(keyboard_check(vk_space)){
	timer--;
	if(timer <= 0){
		audio_stop_sound(snd_opening_narration);
		room_goto(rm_connect);
	}
} else {
	timer = room_speed * 3;
}