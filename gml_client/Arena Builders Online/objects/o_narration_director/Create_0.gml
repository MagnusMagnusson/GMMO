audio_play_sound(music_serpentine_trek, 1, true);

config = json_load("config.json");
if(config){
	if(config.skip_narration){
		room_goto(rm_connect);
		exit;
	}
}

timeline_index = tl_opening_narration;
timeline_running = true;
timer = room_speed * 3;