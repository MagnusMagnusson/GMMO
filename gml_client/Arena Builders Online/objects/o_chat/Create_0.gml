log = ds_list_create();
selected = false;
input = "";

chat_x0 = window_get_width() - 400;
chat_x1 = window_get_width();
chat_y0 = window_get_height() - 300;
chat_y1 = window_get_height()  - string_height("A");

input_x0 = window_get_width() - 400;
input_x1 = window_get_width();
input_y0 = window_get_height() - string_height("A");
input_y1 = window_get_height();