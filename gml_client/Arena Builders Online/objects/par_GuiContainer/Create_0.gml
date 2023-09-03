event_inherited();

children = [];

component_create = function(_x, _y, _object, _data = undefined) {
    _data ??= {};
    _data.parent = self;
    var _component = instance_create_layer(x + _x, y + _y, layer, _object, _data);
    array_push(children, _component);
    return _component;
}
