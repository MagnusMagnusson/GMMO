all_entities = {};

all_players = {};
all_allies = {};
all_enemies = {};

next_id = 1;

register_entity = function(_entity) {
    var _id = "e" + string(next_id++);
    _entity.key = _id;
    all_entities[$ _id] = _entity;
}

register_actor = function(_entity) {
    var _id = _entity.key;
    if (is_instanceof(_entity, DungeonPlayer))
        all_players[$ _id] = _entity;
    
    if (is_instanceof(_entity, DungeonAlly))
        all_allies[$ _id] = _entity;
    
    if (is_instanceof(_entity, DungeonEnemy))
        all_enemies[$ _id] = _entity;
}

resolve_entity = function(_entity) {
    if (is_string(_entity))
        return all_entities[$ _entity];
    else if (is_instanceof(_entity, DungeonEntity))
        return _entity;
    else
        throw $"Can't resolve the entity '{_entity}' that's neither a string key or entity itself.";
}

unregister_entity = function(_entity) {
    struct_remove(all_entities, _entity.key);
    
    if (is_instanceof(_entity, DungeonPlayer))
        struct_remove(all_players, _entity.key);
    
    if (is_instanceof(_entity, DungeonAlly))
        struct_remove(all_allies, _entity.key);
    
    if (is_instanceof(_entity, DungeonEnemy))
        struct_remove(all_enemies, _entity.key);
}

has_actors = function() {
    return struct_names_count(all_players) > 0
        || struct_names_count(all_allies) > 0
        || struct_names_count(all_enemies) > 0;
}
