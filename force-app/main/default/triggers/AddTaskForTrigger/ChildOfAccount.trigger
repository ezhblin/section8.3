trigger ChildOfAccount on Account (after update) {
    ChildMarkHandler.makeMark(trigger.new);
}