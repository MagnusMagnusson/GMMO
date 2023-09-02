if waiting exit;

if(!alarm[1] && mouse_check_button_pressed(mb_left)){
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
		if(mouse_y >= yOrigin + 7*string_height("A") && mouse_y <= yOrigin + 8*string_height("A")){
			selected = 3;
			keyboard_string = repeat_password;
		} 
		
		if(mouse_y >= yOrigin + 9*string_height("A") && mouse_y <= yOrigin + 10*string_height("A")){
			if(string_length(string_trim(username)) < 2){
				error = "Username must be at least two characters";
			} else if (string_length(string_trim(password)) < 3){
				error = "Password needs to be at least three characters";
			}  else if (password != repeat_password){
				error = "Passwords don't match";
			}  else if (o_attribute_selector.unspent_points.get_value() != 0){
				error = "Please use all your attribute points";
			} else if (o_gang_descriptor.selected < 0){
				error = "Please select a faction to join";
			} else {
				waiting = true;
				error = "";
				global.io.emit("create-account",{
						username: username,
						password: password,
						character: {
							gang: o_gang_selector.gangs[o_gang_descriptor.selected.index],
							vitality : o_attribute_selector.skills[array_find_index(o_attribute_selector.skills, function(skill){
								return skill.name = "Vitality"
							})].value.get_value(),
							stamina : o_attribute_selector.skills[array_find_index(o_attribute_selector.skills, function(skill){
								return skill.name = "Stamina"
							})].value.get_value(),
							brawn : o_attribute_selector.skills[array_find_index(o_attribute_selector.skills, function(skill){
								return skill.name = "Brawn"
							})].value.get_value(),
							dexterity : o_attribute_selector.skills[array_find_index(o_attribute_selector.skills, function(skill){
								return skill.name = "Dexterity"
							})].value.get_value(),
							harmony : o_attribute_selector.skills[array_find_index(o_attribute_selector.skills, function(skill){
								return skill.name = "Harmony"
							})].value.get_value(),
						}
				});
			}
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

if(selected == 3){
	keyboard_string = string_copy(keyboard_string,0, 25);
	repeat_password = keyboard_string;
}

var bg = layer_background_get_id(layer_get_id("Background"));
if(layer_background_get_blend(bg) != background_col){
	var newcol = merge_color(layer_background_get_blend(bg), background_col, 0.025);
	layer_background_blend(bg, newcol);
}