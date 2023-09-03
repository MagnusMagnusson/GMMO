function PlayerAbility(_player) constructor {
    player = _player;
    
    static on_select = function() {
        throw $"{instanceof(self)}.on_select() is not implemented.";
    }
}