draw_set_alpha(selected ? 0.75 : 0.5);
draw_set_color(c_black);
draw_rectangle(chat_x0, chat_y0, chat_x1, chat_y1, false);
draw_set_alpha(selected ? 0.85 : 0.65);
draw_rectangle(input_x0, input_y0, input_x1, input_y1, false);

draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(input_x0 + 16, input_y0, input);

var total_size = 0;
var max_height = chat_y1 - chat_y0;
var chat_width = chat_x1 - chat_x0;
var offset = 16;
for(var i = ds_list_size(log) - 1; i >= 0; i--){
	var mess = log[|i];
	var trueMessage = mess[0] + ": " + mess[1];
	total_size += string_height_ext(trueMessage, string_height("a"), chat_width - 8*offset);
	if(total_size >= max_height){
		break;
	}
	draw_set_color(c_white);
	draw_text_ext(chat_x0 + offset, chat_y1 - total_size, string_repeat(" ", string_length(mess[0]+": ")) + mess[1], string_height("a"), chat_width - 8*offset);
	draw_set_color(get_gang_chat_color(mess[2]));
	draw_text(chat_x0 + offset, chat_y1 - total_size, mess[0] + ": ");
}