function DungeonFloor() : DungeonTerrain() constructor {
    static is_walkable_by = function(_creature) {
        return true;
    }
}
