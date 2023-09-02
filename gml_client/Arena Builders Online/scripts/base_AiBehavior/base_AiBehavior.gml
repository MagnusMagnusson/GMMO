function AiBehavior(_actor) constructor {
    actor = _actor;
    state = new LoiterState(actor);
    
    static decide_action = function() {
        return state.decide_action();
    }
}
