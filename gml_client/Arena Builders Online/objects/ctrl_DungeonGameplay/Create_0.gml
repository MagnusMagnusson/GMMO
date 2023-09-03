instance_create_layer(0, 0, "Instances", ctrl_DungeonServer);

grid = new DungeonGrid(10, 10);
instance_create_layer(0, 0, "Instances", ctrl_DungeonEntities);
DungeonPlayer.create_at({
    name: "zzz", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 2, 2);
DungeonEnemy.create_at({
    name: "yyy", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 7, 7);
DungeonEnemy.create_at({
    name: "aaa", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 7, 6);
DungeonEnemy.create_at({
    name: "sss", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 6, 7);
DungeonEnemy.create_at({
    name: "ddd", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 6, 6);
DungeonEnemy.create_at({
    name: "ddd", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 6, 8);
DungeonEnemy.create_at({
    name: "ddd", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 7, 8);
DungeonEnemy.create_at({
    name: "ddd", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 8, 8);
DungeonEnemy.create_at({
    name: "ddd", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 8, 7);
DungeonEnemy.create_at({
    name: "ddd", vitality: 1, harmony: 1, dexterity: 1, brawn: 1, stamina: 1,
}, 8, 6);

instance_create_layer(0, 0, "Instances", ctrl_DungeonView);

instance_create_layer(0, 0, "Instances", ctrl_DungeonFlow);

instance_create_layer(0, 0, "Instances", ui_DungeonParty);
