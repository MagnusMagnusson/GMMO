if(!variable_instance_exists(id, "width")){
	width = 10;
	height = 10;
}
if(!variable_instance_exists(id, "players")){
	players = [{
		name : "Default player",
		vitality : 1,
		stamina : 1,
		brawn : 1,
		dexterity : 1,
		harmony : 1,
		_x : 1,
		_y : 2,
	}]
}
if(!variable_instance_exists(id, "allies")){
	allies = []
}
if(!variable_instance_exists(id, "enemies")){
	enemies = [{
		name : "Default Enemy",
		vitality : 1,
		stamina : 1,
		brawn : 1,
		dexterity : 1,
		harmony : 1,
		_x : 8,
		_y : 8,
	}]
}

instance_create_layer(0, 0, "Instances", ctrl_DungeonServer);

grid = new DungeonGrid(width, height);
instance_create_layer(0, 0, "Instances", ctrl_DungeonEntities);

for(var i = 0; i < array_length(players); i++){
	var p = players[i]
	DungeonPlayer.create_at(p, p._x, p._y);
}

for(var i = 0; i < array_length(allies); i++){
	var p = allies[i]
	DungeonAlly.create_at(p, p._x, p._y);
}

for(var i = 0; i < array_length(enemies); i++){
	var p = enemies[i]
	DungeonEnemy.create_at(p, p._x, p._y);
}

instance_create_layer(0, 0, "Instances", ctrl_DungeonView);

instance_create_layer(0, 0, "Instances", ctrl_DungeonFlow);

instance_create_layer(0, 0, "Instances", ui_DungeonParty);
