#macro crimson_red #B30416
#macro blu_blue #045182
#macro emerald_green #45801D
#macro yellowship_yellow #DBA348
#macro cult_purple #5F3C99

#macro crimson_chat_red #f03629
#macro blu_chat_blue #4db9e8
#macro emerald_chat_green #5cdb21
#macro yellowship_chat_yellow #ede434
#macro cult_chat_purple #cb36eb
#macro server_chat_gray #d3d3d3

function get_gang_chat_color(gang){
	switch(gang){
		case "Crimson Guild": return crimson_chat_red;
		case "Blu Cru": return blu_chat_blue;
		case "Fellowship of Yellow": return yellowship_chat_yellow;
		case "Emerald Enclave": return emerald_chat_green;
		case "Purple Cult" : return cult_chat_purple;
		default : return server_chat_gray;
	}
}
