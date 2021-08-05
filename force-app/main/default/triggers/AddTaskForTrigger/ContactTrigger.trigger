trigger ContactTrigger on Contact (before insert, before update, after delete) {
    if (Trigger.isDelete) {
        ContactTriggerHandler.closeCase(Trigger.old);
    } else {
        ContactTriggerHandler.makeMark(Trigger.new);
    }
}