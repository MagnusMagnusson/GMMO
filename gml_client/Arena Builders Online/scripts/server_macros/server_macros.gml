#macro use_prod_server false
#macro server_url (use_prod_server ? "server.arenabuildersonline.com" : "127.0.0.1")
#macro server_port (use_prod_server ? "80" : "8080")