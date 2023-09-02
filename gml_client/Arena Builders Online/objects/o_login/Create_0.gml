username = "";
password = "";

selected = 0;
waiting = false;
error = "";

xOrigin = room_width / 2;
yOrigin = room_height / 3
box_width = 256;

login =	json_load("login");
if(login){
	username = login.username;
	password = login.password;
}