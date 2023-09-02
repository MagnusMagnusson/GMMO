unspent_points = OwnBinding.create(15);

createSkill = function(_name, _description, _unspent_points) constructor {
	name = _name;
	description = _description;
	value = OwnBinding.create(1);
	unspent = _unspent_points;
	
	increase = function(){
		var unspent_val = binding_resolve(unspent);
		if(unspent_val > 0){
			value.set_value(value.get_value() + 1);
			unspent.set_value(unspent_val - 1);
		}
	}
	
	decrease = function(){		
		var unspent_val = binding_resolve(unspent);
		if(value.get_value() > 1){
			value.set_value(value.get_value() - 1);
			unspent.set_value(unspent_val + 1);
		}
	}
}

skills = [
	new createSkill("Vitality", "Your overall health, determining your ability to take damage without dying. More vitality, better odds of survival", unspent_points),	
	new createSkill("Stamina", "Your physical energy, determining your ability to take actions. More stamina, the stronger actions you can take before having to rest", unspent_points),	
	new createSkill("Harmony", "Your mental and spiritual skill, determining your effectiveness at casting spells. More Harmony, the more spells you can cast before having to rest", unspent_points),	
	new createSkill("Brawn", "Your physical strenght. Determines how effectively you can wield heavy weapons and accomplish feats of strength", unspent_points),	
	new createSkill("Dexterity", "Your physical agility. Determines how effectively you can wield fast and ranged weapons, and accomplish feats of speed.", unspent_points),
]

array_foreach(skills, function(skill, index){
	instance_create_layer(x, y + 128 + 64*(index), layer, o_att_label,{
		"index" : index,
		"dad" : id,
		"skill" : skill
	})
});

hover = -1;