public with sharing class ContactTriggerHandler {
  
    public static void makeMark(List<Contact> contacts) {       
        List<Id> idAccounts = new  List<Id>();
        for (Contact contact : contacts) {
            idAccounts.add(contact.AccountId);
        }
        Map<Id, Account> accountNameForContact = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN: idAccounts LIMIT 50000]);

        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                contact.AccountLastName__c = accountNameForContact.get(contact.AccountId).Name + ';' + contact.AccountId;
            }
        }
    }

    public static void closeCase(List<Contact> contacts) {
        List<Id> accountsId = new List<Id>(); 
        for (Contact contactItem : contacts) {
            if (contactItem.AccountId != null) {
                accountsId.add(contactItem.AccountId);
            }
        }
        GlobalClass.closeCase([SELECT Id FROM Account WHERE Id IN: accountsId]);
    }
}