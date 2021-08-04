trigger MasterOfContact on Contact (before insert, before update) {
    MasterMarkHandler.makeMark(trigger.new);
}