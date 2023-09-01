if waiting exit;

if(mouse_check_button_pressed(mb_left)){
	selected = 0;
	if(mouse_x >= xOrigin - box_width/2 && mouse_x <= xOrigin + box_width/2){
		if(mouse_y >= yOrigin + 1*string_height("A") && mouse_y <= yOrigin + 2*string_height("A")){
			keyboard_string = username;
			selected = 1;
		} 
		if(mouse_y >= yOrigin + 4*string_height("A") && mouse_y <= yOrigin + 5*string_height("A")){
			selected = 2;
			keyboard_string = password;
		} 
		if(mouse_y >= yOrigin + 6*string_height("A") && mouse_y <= yOrigin + 7*string_height("A")){
			waiting = true;
			error = "";
			if(global.connected){
				global.io.emit("login",{
					username: username,
					password: password
				});
			}
		} 
		if(mouse_y >= yOrigin + 8*string_height("A") && mouse_y <= yOrigin + 9*string_height("A")){
			selected = 2;
			keyboard_string = password;
		} 
	}
}

if(selected == 1){
	keyboard_string = string_copy(keyboard_string,0, 25);
	username = keyboard_string;
}


if(selected == 2){
	keyboard_string = string_copy(keyboard_string,0, 25);
	password = keyboard_string;
}