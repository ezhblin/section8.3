public with sharing class MasterMarkHandler {
  
    public static void makeMark(List<Contact> contacts) {       
        Map<Id, Account> accountNameForContact = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 50000]);

        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                contact.AccountLastName__c = accountNameForContact.get(contact.AccountId).Name + '\n' + contact.AccountId;
            }
        }
    }
}
