initState = undefined;

init_village = function(state) {
	show_debug_message("init village")
	var players = state.players;
	var player = players[array_find_index(players,function(p) {
		return p.id == global.player.id
	})];
	var c = player.character;
	c._x = 11
	c._y = 11
	
	show_message(player);
	var dungeon = instance_create_layer(0,0, layer, ctrl_DungeonGameplay, {
		width: 21,
		height: 21,
		enemies : [],
		players : [c]
	});
}