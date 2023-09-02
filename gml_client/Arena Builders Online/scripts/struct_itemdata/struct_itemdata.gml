function ItemData(data) constructor{
	id = data.id; //integer
	name = data.name; //string
	description = data.description; //string
	slot = data.slot; //string
	cost = data.cost; //integer
	skills = data.skills; //integer[]
	consumable = data.consumable; //consumable
	restrictions = data.restrictions; // [key, value][]
}