
if(initState){
	show_debug_message("2")
	if(room == rm_village){
	show_debug_message("3")
		init_village(initState);
	} else{
	show_debug_message("4")
		init_dungeon(initState);
	}
	initState = undefined;
}