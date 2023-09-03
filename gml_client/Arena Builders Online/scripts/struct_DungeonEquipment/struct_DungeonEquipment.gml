function DungeonEquipment(_data) constructor {
    // stats
    vitality_bonus = OwnBinding.create(_data[$ "vitality_bonus"] ?? 0);
    stamina_bonus = OwnBinding.create(_data[$ "stamina_bonus"] ?? 0);
    harmony_bonus = OwnBinding.create(_data[$ "harmony_bonus"] ?? 0);
    brawn_bonus = OwnBinding.create(_data[$ "brawn_bonus"] ?? 0);
    dexterity_bonus = OwnBinding.create(_data[$ "dexterity_bonus"]);
    
    // regen
    health_regen_bonus = OwnBinding.create(_data[$ "health_regen_bonus"] ?? 0);
    action_regen_bonus = OwnBinding.create(_data[$ "action_regen_bonus"] ?? 0);
    mana_regen_bonus = OwnBinding.create(_data[$ "mana_regen_bonus"] ?? 0);
    
    // vision
    vision_bonus = OwnBinding.create(_data[$ "vision_bonus"] ?? 0);
    detection_bonus = OwnBinding.create(_data[$ "detection_bonus"] ?? 0);
    seethrough_bonus = OwnBinding.create(_data[$ "seethrough_bonus"] ?? 0);
    
    // mobility
    run_range_bonus = OwnBinding.create(_data[$ "run_range_bonus"] ?? 0);
    float_effect = OwnBinding.create(_data[$ "float_effect"]);
    step_cost_reduction = OwnBinding.create(_data[$ "step_cost_reduction"]);
    run_cost_reduction = OwnBinding.create(_data[$ "run_cost_reduction"]);
    
    ability = _data.ability;
}
