trigger AccountTrigger on Account (after update, after delete) {
    if (Trigger.isDelete && Trigger.isAfter) {
        AccountTriggerHandler.closeCase(Trigger.old);
    } else if (Trigger.isUpdate && Trigger.isAfter){
        AccountTriggerHandler.makeMark(Trigger.new);
        AccountTriggerHandler.makeCase(Trigger.new);
    }
}