public with sharing class AccountTriggerHandler {
    public static void makeMark(List<Account> accounts) {
        update [SELECT Id FROM Contact WHERE AccountId IN: accounts];
    }
}
