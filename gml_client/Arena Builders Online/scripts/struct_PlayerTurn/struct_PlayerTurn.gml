function PlayerTurn(_actors) : GameplayTurn(_actors) constructor {

    static process = function() {
        if (!is_undefined(obj_DungeonActor.ongoing_animation))
            return;
        
        if (keyboard_check_pressed(vk_left))
            MoveAction.request(obj_DungeonActor.actor_struct, -1, 0);
        
        if (keyboard_check_pressed(vk_right))
            MoveAction.request(obj_DungeonActor.actor_struct, 1, 0);
        
        if (keyboard_check_pressed(vk_up))
            MoveAction.request(obj_DungeonActor.actor_struct, 0, -1);
        
        if (keyboard_check_pressed(vk_down))
            MoveAction.request(obj_DungeonActor.actor_struct, 0, 1);
    }
}