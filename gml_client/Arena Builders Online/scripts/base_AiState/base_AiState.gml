function AiState(_actor) constructor {
    actor = _actor;
    
    static decide_action = function() {
        throw $"{instanceof(self)}.decide_action() is not implemented.";
    }
}
