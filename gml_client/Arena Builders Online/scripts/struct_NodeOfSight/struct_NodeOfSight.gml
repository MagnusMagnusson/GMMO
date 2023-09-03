function NodeOfSight(_parent, _xoffset, _yoffset, _path) constructor {
    static root = undefined;
    
    parent = _parent;
    xoffset = _xoffset;
    yoffset = _yoffset;
    path = _path;
    distance = abs(xoffset) + abs(yoffset);
    is_end = xoffset == 0 && yoffset == 0;
    
    last_segment = path == "" ? "" : string_char_at(path, string_length(path));
    is_diagonal = last_segment == "r" || last_segment == "u" || last_segment == "l" || last_segment == "d";
    
    if (xoffset == 0 && yoffset == 0)
        root = self;
    
    next_nodes = [];
    next_nodes_by_dir = {};
    
    static make_by_dir = function(_dir, _xstep, _ystep) {
        if (!struct_exists(next_nodes_by_dir, _dir)) {
            var _node = new NodeOfSight(self, xoffset + _xstep, yoffset + _ystep, path + _dir);
            next_nodes_by_dir[$ _dir] = _node;
            array_push(next_nodes, _node);
        }
        
        return next_nodes_by_dir[$ _dir];
    }
}

var _root = new NodeOfSight(undefined, 0, 0, "");
