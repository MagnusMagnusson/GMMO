function PlayerTurn(_actors, _id) : GameplayTurn(_actors, _id) constructor {
	if(array_length(struct_get_names(remaining_actors)) == 0){
		return;
	}
    var _player_id = struct_get_names(remaining_actors)[0];
    player_entity = ctrl_DungeonEntities.resolve_entity(_player_id);
    
    static init = function() {
        instance_create_layer(0, 0, "Instances", ctrl_PlayerControl);
    }
    
    static process = function() {
        if (!waits_for_actor(player_entity))
            return;
        
        with (ctrl_PlayerControl) event_user(0);
        /*
        if (keyboard_check_pressed(vk_left) && player_entity.can_move_towards(-1, 0))
            MoveAction.request(player_entity, -1, 0);
        
        if (keyboard_check_pressed(vk_right) && player_entity.can_move_towards(1, 0))
            MoveAction.request(player_entity, 1, 0);
        
        if (keyboard_check_pressed(vk_up) && player_entity.can_move_towards(0, -1))
            MoveAction.request(player_entity, 0, -1);
        
        if (keyboard_check_pressed(vk_down) && player_entity.can_move_towards(0, 1))
            MoveAction.request(player_entity, 0, 1);
        */
    }
    
    static make_next_turn = function() {
        instance_destroy(ctrl_PlayerControl);
        
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