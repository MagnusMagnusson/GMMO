draw_sprite_stretched_ext(sprite_index, image_index, x, y, width, height, image_blend, image_alpha);

array_foreach(children, function(_child) {
    with (_child) {
        event_perform(ev_draw, ev_gui);
    }
});
