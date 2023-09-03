var xx = window_mouse_get_x();
var yy = window_mouse_get_y();

var mouse_on_input = (xx > chat_x0 && xx < chat_x1 && yy > chat_y0 && yy < chat_y1);

if(!selected){
	if((mouse_check_button_pressed(mb_left) && mouse_on_input)
	 || keyboard_check_pressed(ord("T"))
	){
		selected = true;
		keyboard_string = input;
	}
}
else {
	input = string_copy(keyboard_string, 0, 40);
	if((mouse_check_button_pressed(mb_left) && !mouse_on_input)){
		selected = false;
	}
	if(keyboard_check_pressed(vk_escape)){
		selected = false;
	}
	if(keyboard_check_pressed(vk_enter)){
		global.io.emit("chat",{
			"message" : input
		});
		input = "";
		keyboard_string = "";
	}
}