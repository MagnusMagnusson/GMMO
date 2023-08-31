/*
	Socket_io.gml
	
	Quick start usage:
	1 ) create the client by calling the socket_io constructor, with the url and port
	2 ) Call "io.emit(event, data)" to send the specified data to the server.
	3 ) Call "io.on(event, f) to have the function f trigger when the server emits the specified event. f is called with a single argument, data, which is whatever data the server sent
	Multiple functions can be bound to a single event. There is currently no way to unbind a function from an event.
	
	The constructor creates an instance of type o_socketio_client. This instance is persistent and is responsible for actually listening to server communication, parsing data, and triggering the right functions. 
	I strongly recommend that this instance is not destroyed, intentionally or not. Doing so turns this into one way communication, we can send data but not recieve it.
*/

enum _SIO_PACKAGETYPE  {
	CONNECT = 0,
	DISCONNECT = 1,
	EVENT = 2,
	ACK = 3,
	CONNECT_ERROR = 4,
	BINARY_EVENT = 5,
	BINARY_ACK = 6,
}

function socket_io(url,	port = 8080, query = "") constructor {
	sock = network_create_socket(network_socket_ws);
	connection = network_connect_raw_async(sock, url + "/socket.io/?"+query+"&EIO=4&transport=websocket", port);
	obj = instance_create_depth(0,0,0,o_socketio_client);
	obj.sock = self;
	events = {};
	socketInfo = {};
	connected = false;
	
	static on = function(event, f){
		if(!events[$ event]){
			events[$ event] = [];
		}
		array_push(events[$ event],f);
	}
	
	static disconnect = function(){
		self._sendRaw(_SIO_PACKAGETYPE.DISCONNECT);
	}

	static emit = function(event, data){
		self._sendRaw(_SIO_PACKAGETYPE.EVENT, [event, data]);
	}
	
	static send = function(data){
		self.emit("message", data);
	}
	
	static _sendRaw = function(type, data = undefined){
		var buff = buffer_create(1,buffer_grow,1);
		if(!is_undefined(data)){		
			var d = json_stringify(data);
			if(d == "\"\""){
				d = "";
			}
		} else {
			d = "";
		}
		var str = "4"+string(type)+d
		buffer_write(buff,buffer_text,str);
		show_debug_message("Sending data "+str);
		show_debug_message("buffer size " + string(buffer_get_size(buff)));
		network_send_raw(sock, buff, string_length(str), network_send_text);
		buffer_delete(buff);
	}
	
	static ping = function(){
		var buff = buffer_create(1,buffer_grow,1);
		buffer_write(buff,buffer_text,"3");
		network_send_raw(sock, buff, 1, network_send_text);
		buffer_delete(buff);
	}
	
	static _parse = function(datastring){
		show_debug_message("parsing data "+datastring);
		var offByOne = string_copy(datastring,1,2) == "0{" ? 0 : 1;
		var type = string_char_at(datastring, 1 + offByOne);
		var data = string_copy(datastring, 2 + offByOne, string_length(datastring) - 1);
		show_debug_message("Type is "+string(type));
		show_debug_message("Data is "+string(data))
		if(string_length(data) > 0){
			data = json_parse(data);
		}
		switch(type){
			case _SIO_PACKAGETYPE.CONNECT: {
				socketInfo = data;
				connected = true;
				break;
			};
			case _SIO_PACKAGETYPE.DISCONNECT: {
				socketInfo = undefined;
				connected = false;
				break;
			}
			case _SIO_PACKAGETYPE.EVENT: {
				var handlers = events[$ data[0]];
				if(!is_undefined(handlers)){
					for(var i = 0; i < array_length(handlers); i++){
						var f = handlers[i];
						f(array_length(data) > 1 ? data[1] : undefined);
					}
				}
				break;
			}
			default : {
				throw "NOT IMPLEMENTED PACKAGE TYPE";
			}
		}
	}
}

