function NeitherTurn(_actors, _id) : GameplayTurn(_actors, _id) constructor {
    static process = function() {
        // nothing
    }
    
    static make_next_turn = function() {
        throw "With no actors remaining, there should be no reason to make another turn.";
    }
}
