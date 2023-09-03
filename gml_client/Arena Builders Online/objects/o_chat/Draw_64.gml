draw_set_alpha(selected ? 0.75 : 0.5);
draw_set_color(c_black);
draw_rectangle(chat_x0, chat_y0, chat_x1, chat_y1, false);
draw_rectangle(input_x0, input_y0, input_x1, input_y1, false);

draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(input_x0 + 16, input_y0, input);
