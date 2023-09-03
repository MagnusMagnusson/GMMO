function LoiterState(_actor) : AiState(_actor) constructor {
    static decide_action = function() {
        var _paths = ["R", "U", "L", "D"];
        array_shuffle_ext(_paths);
        
        while (array_length(_paths) > 0) {
            var _next_path = _paths[0];
            if (actor.can_move_str(_next_path))
                return new AiAction(MoveAction.prepare_str(actor, _next_path), -1);
            
            array_delete(_paths, 0, 1);
        }
        return new AiAction(SkipAction.prepare(actor), 0);
    }
}
