ongoing_actions = [];
pending_actions = [];

queue_action = function(_action) {
    array_push(pending_actions, _action);
}

ctrl_DungeonServer.when_actions_received.subscribe(self, function(_actions) {
    array_foreach(_actions, method(self, queue_action));
});

