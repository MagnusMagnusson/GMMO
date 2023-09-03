function LineOfSight(_target_cell, _path) constructor {
    if (is_undefined(_target_cell))
        return;
    
    target_cell = _target_cell;
    path = _path;
    
    static max_explored_range = 0;
    static explored_paths = {};
    
    static explore_up_to_range = function(_range) {
        for (var i = LineOfSight.max_explored_range + 1; i <= _range; i++) {
            LineOfSight.explore_range(i);
            LineOfSight.max_explored_range = i;
        }
    }
    
    static explore_range = function(_range) {
        explore_line(_range, 0, "R");
        explore_line(0, -_range, "U");
        explore_line(-_range, 0, "L");
        explore_line(0, _range, "D");
        
        for (var i = 1; i < _range; i++) {
            explore_diagonal(i, -(_range - i), "r");
        }
        for (var i = 1; i < _range; i++) {
            explore_diagonal(-i, -(_range - i), "u");
        }
        for (var i = 1; i < _range; i++) {
            explore_diagonal(-i, _range - i, "l");
        }
        for (var i = 1; i < _range; i++) {
            explore_diagonal(i, _range - i, "d");
        }
    }
    
    static explore_line = function(_xdiff, _ydiff, _dir) {
        var _length = max(abs(_xdiff), abs(_ydiff));
        var _xstep = sign(_xdiff);
        var _ystep = sign(_ydiff);
        
        var _node = NodeOfSight.root;
        repeat (_length) {
            _node = _node.make_by_dir(_dir, _xstep, _ystep);
        }
        _node.is_end = true;
        LineOfSight.explored_paths[$ $"x{_xdiff}y{_ydiff}"] = _node.path;
        // show_debug_message($"Found line: {_node.path}");
    }
    
    static explore_diagonal = function(_xdiff, _ydiff, _ddir) {
        var _xdir = _xdiff < 0 ? "L" : "R";
        var _ydir = _ydiff < 0 ? "U" : "D";
        
        var _length = max(abs(_xdiff), abs(_ydiff));
        var _xstep = sign(_xdiff);
        var _ystep = sign(_ydiff);
        
        var _xcurrent = 0;
        var _ycurrent = 0;
        var _xprogress = (_xcurrent + 0.5 * _xstep) / _xdiff;
        var _yprogress = (_ycurrent + 0.5 * _ystep) / _ydiff;
        
        var _node = NodeOfSight.root;
        while (_xcurrent != _xdiff || _ycurrent != _ydiff) {
            if (_xprogress < _yprogress) {
                _node = _node.make_by_dir(_xdir, _xstep, 0);
                _xcurrent += _xstep;
                _xprogress = (_xcurrent + 0.5 * _xstep) / _xdiff;
            } else if (_yprogress < _xprogress) {
                _node = _node.make_by_dir(_ydir, 0, _ystep);
                _ycurrent += _ystep;
                _yprogress = (_ycurrent + 0.5 * _ystep) / _ydiff;
            } else {
                _node = _node.make_by_dir(_ddir, _xstep, _ystep);
                _xcurrent += _xstep;
                _xprogress = (_xcurrent + 0.5 * _xstep) / _xdiff;
                _ycurrent += _ystep;
                _yprogress = (_ycurrent + 0.5 * _ystep) / _ydiff;
            }
        }
        _node.is_end = true;
        LineOfSight.explored_paths[$ $"x{_xdiff}y{_ydiff}"] = _node.path;
        // show_debug_message($"Found line {_xdiff},{_ydiff}: {_node.path}");
    }
    
    /*
    static trace = function(_grid, _xfrom, _yfrom, _xto, _yto, _cellmap) {
        if (!_cellmap[_grid.width * _yto + _xto])
            return undefined;
        
        var _xdiff = _xto - _xfrom;
        var _ydiff = _yto - _yfrom;
        var _key = $"x{_xdiff}y{_ydiff}";
        
        if (struct_exists(paths_cache, _key))
            return LineOfSight.trace_cached(_grid, _xfrom, _yfrom, _xto, _yto, _cellmap, paths_cache[$ _key])
        
        if (_xfrom == _xto || _yfrom == _yto)
            return LineOfSight.trace_straight(_grid, _xfrom, _yfrom, _xto, _yto, _cellmap);
        else
            return LineOfSight.trace_diagonal(_grid, _xfrom, _yfrom, _xto, _yto, _cellmap);
    }
    
    static trace_cached = function() {
        
    }
    
    static trace_straight = function(_grid, _xfrom, _yfrom, _xto, _yto, _cellmap) {
        var _xdiff = sign(_xto - _xfrom);
        var _ydiff = sign(_yto - _yfrom);
        var _length = max(abs(_xto - _xfrom), abs(_yto - _yfrom));
        for (var i = 1; i <= _length; i++) {
            var _xx = _xfrom + _xdiff * i;
            var _yy = _yfrom + _ydiff * i;
            if (!_cellmap[_grid.width * _yy + _xx])
                return undefined;
        }
        
        var _c = "X";
        if (_xdiff > 0)
            _c = "R";
        else if (_ydiff < 0)
            _c = "U";
        else if (_xdiff < 0)
            _c = "L";
        else if (_ydiff > 0)
            _c = "D";
        
        var _target_cell = _grid.get_at(_xto, _yto);
        var _path = string_repeat(_c, _length);
        return new LineOfSight(_target_cell, _path);
    }
    
    static trace_diagonal = function(_grid, _xfrom, _yfrom, _xto, _yto, _cellmap) {
        var _xdiff = _xto - _xfrom;
        var _ydiff = _yto - _yfrom;
        var _xstep = sign(_xdiff);
        var _ystep = sign(_ydiff);
        var _path = "";
        var _xchar = _xstep < 0 ? "L" : "R";
        var _ychar = _ystep < 0 ? "U" : "D";
        
        var _xcurrent = _xfrom;
        var _ycurrent = _yfrom;
        var _xprogress = (_xcurrent + 0.5 * _xstep - _xfrom) / _xdiff;
        var _yprogress = (_ycurrent + 0.5 * _ystep - _yfrom) / _ydiff;
        while (_xcurrent != _xto || _ycurrent != _yto) {
            if ((_xcurrent != _xfrom || _ycurrent != _yfrom) && !_cellmap[_grid.width * _ycurrent + _xcurrent])
                return undefined;
            
            if (_xprogress < _yprogress) {
                _path += _xchar;
                _xcurrent += _xstep;
                _xprogress = (_xcurrent + 0.5 * _xstep - _xfrom) / _xdiff;
            } else if (_yprogress < _xprogress) {
                _path += _ychar;
                _ycurrent += _ystep;
                _yprogress = (_ycurrent + 0.5 * _xstep - _yfrom) / _ydiff;
            } else if (_cellmap[_grid.width * _ycurrent + (_xcurrent + _xstep)]) {
                _path += _xchar;
                _xcurrent += _xstep;
                _xprogress = (_xcurrent + 0.5 * _xstep - _xfrom) / _xdiff;
            } else if (_cellmap[_grid.width * (_ycurrent + _ystep) + _xcurrent]) {
                _path += _ychar;
                _ycurrent += _ystep;
                _yprogress = (_ycurrent + 0.5 * _xstep - _yfrom) / _ydiff;
            } else {
                return undefined;
            }
        }
        
        var _target_cell = _grid.get_at(_xto, _yto);
        return new LineOfSight(_target_cell, _path);
    }
    */
}

// initialise the statics
var _dummy = new LineOfSight(undefined, undefined);
