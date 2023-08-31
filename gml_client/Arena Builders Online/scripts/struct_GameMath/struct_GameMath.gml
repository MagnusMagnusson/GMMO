function GameMath() constructor {
    vitality_to_max_health = function(_vitality) {
        return 3 * binding_resolve(_vitality);
    }
    
    stamina_to_max_action = function(_stamina) {
        return binding_resolve(_stamina);
    }
    
    harmony_to_max_mana = function(_harmony) {
        return binding_resolve(_harmony);
    }
}

var _dummy = new GameMath();

