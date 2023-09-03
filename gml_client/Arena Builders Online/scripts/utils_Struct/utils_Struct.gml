function struct_get_values(_struct) {
    var _context = { result: [] };
    struct_foreach(_struct, method(_context, function(_key, _value) {
        array_push(result, _value);
    }));
    return _context;
}

function struct_map(_struct, _mapping) {
    var _context = { result: {}, mapping: _mapping };
    struct_foreach(_struct, method(_context, function(_key, _value) {
        result[$ _key] = mapping(_value);
    }));
    return _context.result;
}
