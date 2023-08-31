function DungeonTerrain() constructor {
    sprite = undefined;
    image = 0;
    
    static is_walkable_by = function(_creature) {
        throw $"{instanceof(self)}.is_walkable_by(creature) is not implemented.";
    }
    
    static end_step = function() {
        image = (image + 1) mod sprite_get_number(sprite);
    }
    
    static draw = function(_x, _y) {
        draw_sprite(sprite, image, _x, _y);
    }
}
