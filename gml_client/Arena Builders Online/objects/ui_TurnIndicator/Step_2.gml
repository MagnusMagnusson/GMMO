if (is_instanceof(ctrl_DungeonFlow.current_turn, PlayerTurn))
    target_angle = player_angle;
else if (is_instanceof(ctrl_DungeonFlow.current_turn, AllyTurn))
    target_angle = ally_angle;
else if (is_instanceof(ctrl_DungeonFlow.current_turn, EnemyTurn))
    target_angle = enemy_angle;

image_angle = approach_angle(image_angle, target_angle, 5);
