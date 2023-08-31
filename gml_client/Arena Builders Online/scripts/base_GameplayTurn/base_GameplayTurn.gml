function GameplayTurn(_actors) constructor {
    remaining_actors = struct_get_values(_actors);
    
    static process = function() {
        throw $"{instanceof(self)}.process() is not implemented.";
    }
}
