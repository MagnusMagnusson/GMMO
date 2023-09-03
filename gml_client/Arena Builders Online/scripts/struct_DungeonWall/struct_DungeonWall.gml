function DungeonWall(_cell) : DungeonEntity(_cell) constructor {
    var _this = self;
    instance = instance_create_layer(0, 0, "Instances", obj_DungeonStatic, { entity_struct: _this, sprite_index: spr_DungeonWall });
    is_static = true;
    fills_cell = true;
}
