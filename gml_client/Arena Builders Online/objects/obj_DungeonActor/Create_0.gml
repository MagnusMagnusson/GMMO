visible = false;

ongoing_animation = undefined;

begin_animation = function(_animation) {
    ongoing_animation = _animation;
}

process_animation = function() {
    if (is_undefined(ongoing_animation))
        return;
    
    ongoing_animation.process();
    if (ongoing_animation.is_completed)
        ongoing_animation = undefined;
}
