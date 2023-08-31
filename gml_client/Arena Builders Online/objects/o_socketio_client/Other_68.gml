/// @description Insert description here
// You can write your code in this editor

show_debug_message("Got message");
if(async_load[?"id"] != sock.sock){
	show_debug_message("Wrong sock");
	exit;
}

if(async_load[?"type"] == network_type_non_blocking_connect){
	show_debug_message("Connected");
	sock._sendRaw(_SIO_PACKAGETYPE.CONNECT);
} else {
	show_debug_message(json_encode(async_load));
	var data = buffer_read(async_load[?"buffer"], buffer_string);
	if(data == "2"){
		sock.ping();
		return;
	}
	if(sock){
		sock._parse(data);
	}
}