function DungeonFloor() : DungeonTerrain() constructor {
    sprite = spr_DungeonFloor;
    
    static is_walkable_by = function(_creature) {
        return true;
    }
}
