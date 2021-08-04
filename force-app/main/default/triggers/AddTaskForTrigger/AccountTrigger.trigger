trigger AccountTrigger on Account (after update) {
    AccountTriggerHandler.makeMark(trigger.new);
}