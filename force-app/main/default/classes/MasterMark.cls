public with sharing class MasterMark {
  
    public static void makeMark(List<Contact> contacts) {      
        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                contact.AccountLastName__c = contact.Account.Name + '\n' + contact.AccountId;
            }
        }
    }
}