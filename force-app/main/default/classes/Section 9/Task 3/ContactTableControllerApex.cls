public with sharing class ContactTableControllerApex {
    @AuraEnabled
    public static list<Contact> getRecordApex() {
        return [SELECT FirstName, LastName, Name, Phone, Email FROM Contact LIMIT 2000];
    }

    @AuraEnabled
    public static void updateRecordApex(String objectJSON) {
        Contact contact = (Contact) JSON.deserialize(objectJSON, Contact.class);
        update contact;
    }

    @AuraEnabled
    public static void deleteRecordApex(String objectJSON) {
        Contact contact = (Contact) JSON.deserialize(objectJSON, Contact.class);
        delete contact;
    }
}
