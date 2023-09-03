function PlayerTurn(_actors, _id) : GameplayTurn(_actors, _id) constructor {

    static process = function() {
        if (!is_undefined(obj_DungeonActor.ongoing_animation))
            return;
        
        if (keyboard_check_pressed(vk_left) && obj_DungeonActor.actor_struct.can_move_towards(-1, 0))
            MoveAction.request(obj_DungeonActor.actor_struct, -1, 0);
        
        if (keyboard_check_pressed(vk_right) && obj_DungeonActor.actor_struct.can_move_towards(1, 0))
            MoveAction.request(obj_DungeonActor.actor_struct, 1, 0);
        
        if (keyboard_check_pressed(vk_up) && obj_DungeonActor.actor_struct.can_move_towards(0, -1))
            MoveAction.request(obj_DungeonActor.actor_struct, 0, -1);
        
        if (keyboard_check_pressed(vk_down) && obj_DungeonActor.actor_struct.can_move_towards(0, 1))
            MoveAction.request(obj_DungeonActor.actor_struct, 0, 1);
    }
    
    static make_next_turn = function() {
        if (struct_names_count(ctrl_DungeonEntities.all_allies) > 0)
            return new AllyTurn(ctrl_DungeonEntities.all_allies, turn_id + 1);
        else if (struct_names_count(ctrl_DungeonEntities.all_enemies) > 0)
            return new EnemyTurn(ctrl_DungeonEntities.all_enemies, turn_id + 1);
        else if (struct_names_count(ctrl_DungeonEntities.all_players) > 0)
            return new PlayerTurn(ctrl_DungeonEntities.all_players, turn_id + 1);
        else
            return new NeitherTurn({}, turn_id + 1);
    }
}