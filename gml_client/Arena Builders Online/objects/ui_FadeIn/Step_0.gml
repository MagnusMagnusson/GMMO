/// feather ignore all

timer++;

if (timer >= duration) {
    with (sys_Transition) {
        leave_fade_in();
    }
}
