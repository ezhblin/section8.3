public with sharing class AccountTableControllerApex {
    @AuraEnabled
    public static list<Account> getRecordApex() {
        return [SELECT Name, Phone, BillingAddress, AnnualRevenue, ShippingAddress, Website FROM Account LIMIT 2000];
    }

    @AuraEnabled
    public static void updateRecordApex(String objectJSON) {
        Account account = (Account) JSON.deserialize(objectJSON, Account.class);
        update account;
    }

    @AuraEnabled
    public static void deleteRecordApex(String objectJSON) {
        Account account = (Account) JSON.deserialize(objectJSON, Account.class);
        delete account;
    }
}
