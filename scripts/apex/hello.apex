// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


List<Contact> contacts = [SELECT Name, AccountId FROM Contact];
for (Contact contact : contacts) {
    System.debug(contact);
    if (contact.AccountId != null) {
        contact.AccountLastName__c = contact.Account + '\n' + contact.AccountId;
    }
}
