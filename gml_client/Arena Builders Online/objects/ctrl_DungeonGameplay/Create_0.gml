instance_create_layer(0, 0, "Instances", ctrl_DungeonServer);

grid = new DungeonGrid(5, 5);
instance_create_layer(0, 0, "Instances", ctrl_DungeonEntities);
DungeonPlayer.create_at({
    name: "zzz", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 2, 2);

instance_create_layer(0, 0, "Instances", ctrl_DungeonActions);

instance_create_layer(0, 0, "Instances", ctrl_DungeonView);

current_turn = new PlayerTurn(ctrl_DungeonEntities.all_players);
