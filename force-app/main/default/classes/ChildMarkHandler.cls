public with sharing class ChildMarkHandler {
    public static void makeMark(List<Account> accounts) {
        update [SELECT Id FROM Contact WHERE AccountId IN: accounts];
    }
}