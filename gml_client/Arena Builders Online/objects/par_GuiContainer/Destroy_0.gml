array_foreach(children, function(_child) {
    if (instance_exists(_child))
        instance_destroy(_child);
});
