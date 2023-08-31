function DungeonPlayer(_data, _cell) : DungeonActor(_data, _cell) constructor {
    if (is_undefined(_cell))
        return;
    
    instance.sprite_index = spr_DungeonPlayer;
    
    static create_at = function(_data, _x, _y) {
        var _player = new DungeonAlly(_data, ctrl_DungeonGameplay.grid.get_at(_x, _y));
    }
}

// initialising the statics
var _root_dummy = new DungeonEntity(undefined);
var _base_dummy = new DungeonActor(undefined, undefined);
var _dummy = new DungeonPlayer(undefined, undefined);
