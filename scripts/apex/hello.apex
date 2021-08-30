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
Case closeCase = [SELECT Status FROM Case WHERE CaseNumber = '00001026' LIMIT 1];
List<Case> cases = [SELECT Id, Status, Description, IsClosed FROM Case WHERE IsClosed != true];
closeCase.Status = 'Closed';
update closeCase;
Case closeCase = new Case(Status = 'Closed');
System.debug('=====>>>> ' + [SELECT Status , IsClosed FROM Case WHERE CaseNumber = '00001027'].IsClosed);

Account account = [SELECT id FROM Account WHERE Name = 'PROBLEM' LIMIT 1];
delete account ;


List<Case> cases = [SELECT Id, Status, Description, IsClosed FROM Case WHERE IsClosed != true];
for (Case caseItem : cases) {
    System.debug('=====>>>> ' + caseItem.Description.contains('|'));
}

String str = 'This is my delimetr |';
System.debug('=====>>>> ' + 'ABCDEFGHIKLMNOPQRSTVXYZ'.toLowerCase());

'ABCDEFGHIKLMNOPQRSTVXYZ'


CarNumberController.generateCarNumber();
CarNumberController.saveCarNumber();


static User currentUser = [SELECT CarNumber__c, City FROM User WHERE Id =: UserInfo.getUserId() LIMIT 1][0];
System.debug('=====>>>> ' + CharCodes__c.getInstance(UserInfo.getUserId()).TextCode__c);

@isTest
list<User> users = [SELECT Id, Name, CarNumber__c, City FROM User WHERE CarNumber__c = '' AND ProfileId != null LIMIT 50000];
for (User user : users) {
    System.debug('=====>>>>' + user);
}

user.CarNumber__c = ''; 
update user ;

List<Schema.SObjectField> updatableFeilds = GlobalClass.getEditadbleField('User');
String stringForFields = '';
for (Schema.SObjectField itemField : updatableFeilds) {
    stringForFields += (itemField + ', ');
}
stringForFields = stringForFields.removeEnd(', ');

List<User> users = Database.query('SELECT '+stringForFields+ ' FROM User');
System.debug('THIS====>> ' + users);


List<String> listObject = new List<String>();
for (Schema.SObjectType item : GlobalClass.gd.values()) {
    Schema.DescribeSObjectResult objectInfo = item.getDescribe();
    if (objectInfo.isAccessible()&&objectInfo.isQueryable()) {
        listObject.add(objectInfo.getLabel());
    }
}



Schema.DescribeSObjectResult objectInfo = GlobalClass.gd.get('EntitlementProcess').getDescribe();
System.debug('THIS====>> ' + BuilderApex.getAviableFields('Contact'));

