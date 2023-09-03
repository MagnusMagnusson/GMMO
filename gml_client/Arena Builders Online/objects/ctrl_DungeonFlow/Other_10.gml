/// @description Process current turn

if (current_turn.turn_id == predicted_turn.turn_id && !current_turn.has_pending_requests())
    current_turn.process();
