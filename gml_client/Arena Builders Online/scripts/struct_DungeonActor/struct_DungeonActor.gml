function DungeonActor(_data, _cell) : DungeonEntity(_cell) constructor {
    if (is_undefined(_cell))
        return;
    
    var _this = self;
    instance = instance_create_layer(0, 0, "Instances", obj_DungeonActor, { actor_struct: _this });
    
    name = OwnBinding.create(_data.name);
    
    vitality = OwnBinding.create(_data.vitality); // red
    stamina = OwnBinding.create(_data.stamina); // yellow
    harmony = OwnBinding.create(_data.harmony); // blue
    brawn = OwnBinding.create(_data.brawn); // green
    dexterity = OwnBinding.create(_data.dexterity); // purple
    
    var _health_max = GameMath.vitality_to_max_health(vitality);
    health_max = OwnBinding.create(_health_max);
    health_current = OwnBinding.create(_health_max);
    
    var _action_max = GameMath.stamina_to_max_action(stamina);
    action_max = OwnBinding.create(_action_max);
    action_current = OwnBinding.create(_action_max);
    
    var _mana_max = GameMath.harmony_to_max_mana(harmony);
    mana_max = OwnBinding.create(_mana_max);
    mana_current = OwnBinding.create(_mana_max);
    
    #region Basic status
    
    // Health-related methods
    
    static get_health = function() {
        return health_current.get_value();
    }
    
    static can_spend_health = function(_amount) {
        return health_current.get_value() >= 1 + _amount;
    }
    
    static lose_health = function(_amount) {
        var _new_health = max(health_current.get_value() - _amount, 0);
        health_current.set_value(_new_health);
    }
    
    static restore_health = function(_amount) {
        var _new_health = min(health_current.get_value() + _amount, health_max.get_value());
        health_current.set_value(_new_health);
    }
    
    // Action-related methods
    
    static get_action = function() {
        return action_current.get_value();
    }
    
    static can_spend_action = function(_amount) {
        return action_current.get_value() >= _amount;
    }
    
    static spend_action = function(_amount) {
        var _new_action = max(action_current.get_value() - _amount, 0);
        action_current.set_value(_new_action);
    }
    
    static restore_action = function(_amount) {
        var _new_action = min(action_current.get_value() + _amount, action_max.get_value());
        action_current.set_value(_new_action);
    }
    
    // Mana-related methods
    
    static get_mana = function() {
        return mana_current.get_value();
    }
    
    static can_spend_mana = function(_amount) {
        return mana_current.get_value() >= _amount;
    }
    
    static spend_mana = function(_amount) {
        var _new_mana = max(mana_current.get_value() - _amount, 0);
        mana_current.set_value(_new_mana);
    }
    
    static restore_mana = function(_amount) {
        var _new_mana = min(mana_current.get_value() + _amount, mana_max.get_value());
        mana_current.set_value(_new_mana);
    }
    
    #endregion
    
    #region Advanced status
    
    // regen
    health_regen = OwnBinding.create(0);
    action_regen = OwnBinding.create(2);
    mana_regen = OwnBinding.create(0);
    
    // vision
    vision_range = OwnBinding.create(6);
    detection_range = OwnBinding.create(0);
    seethrough_range = OwnBinding.create(0);
    
    // mobility
    run_range = OwnBinding.create(2);
    is_floating = OwnBinding.create(false);
    step_cost = OwnBinding.create(1);
    run_cost = OwnBinding.create(2);
    
    #endregion
    
    #region Movement
    
    static can_move_towards = function(_xoffset, _yoffset) {
        var _target_cell = current_cell.get_towards(_xoffset, _yoffset);
        if (is_undefined(_target_cell))
            return false;
        
        return _target_cell.is_walkable_by(self);
    }
    
    static can_move_str = function(_path) {
        var _dir = string_char_at(_path, 1);
        switch (_dir) {
            case "X":
                return true;
            case "R":
                return can_move_towards(1, 0);
            case "U":
                return can_move_towards(0, -1);
            case "L":
                return can_move_towards(-1, 0);
            case "D":
                return can_move_towards(0, 1);
            default:
                throw $"Unknown direction letter '{_dir}'.";
        }
    }
    
    #endregion
}
