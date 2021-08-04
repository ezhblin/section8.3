trigger ContactTrigger on Contact (before insert, before update) {
    ContactTriggerkHandler.makeMark(trigger.new);
}