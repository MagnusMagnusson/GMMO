function EntityAnimation(_instance) constructor {
    if (is_undefined(_instance))
        return;
    
    instance = _instance;
    
    is_completed = false;
    
    static draw = function() {
        throw $"{instanceof(self)}.draw() is not implemented.";
    }
}
