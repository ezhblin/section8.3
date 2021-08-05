public class AccountTriggerHandler {
    public static void makeMark(List<Account> accounts) {
        update [SELECT Id FROM Contact WHERE AccountId IN: accounts];
    }

    public static void makeCase(List<Account> accounts) {
        Set<Id> contactsForAccount = new Set<Id>();
        List<Case> startCase = new List<Case>();
        for (Contact contact : [SELECT AccountId FROM Contact WHERE AccountId IN: accounts]) {
            contactsForAccount.add(contact.AccountId);
        }
        for(Account account : accounts) {
            if (contactsForAccount.contains(account.Id)) {
                startCase.add(new Case(Description = 'Account was changed:'+ account.Name + ';' +account.Id, Priority = 'High', OwnerId = UserInfo.getUserId() ));
            }
        }
        insert startCase;
    }

    public static void closeCase(List<Account> accounts) {
        GlobalClass.closeCase(accounts);
    }

}
