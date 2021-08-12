public with sharing class CarNumberController {
    public static String carNumber{get; set;}
    static Set<String> carNumbers = new Set<String>();   
    static User currentUser = [SELECT CarNumber__c, City FROM User WHERE Id =: UserInfo.getUserId() LIMIT 1][0];
    
    public CarNumberController() {
        carNumber = currentUser.CarNumber__c;
    }

    
    public static void generateCarNumber(User user) {
        if (carNumbers.isEmpty()) {
            for (User item : [SELECT CarNumber__c FROM User WHERE CarNumber__c != '' LIMIT 50000]) {
                carNumbers.add(item.CarNumber__c);
            } 
        }

        String regionCode = getRegionCode(user.City);
        if (regionCode != '') {
            carNumber = getNumCode() + ' ' + getCharCode(user) + '-' + regionCode;
            if (carNumbers.contains(carNumber)) {
                generateCarNumber(user);
            } else {
                carNumbers.add(carNumber);
                user.CarNumber__c = carNumber;
            }
        }
        

    }

    static String getRegionCode(String city) {
        try {
            return [SELECT Region_code__r.Code__c FROM City__mdt WHERE Label =: city LIMIT 1][0].Region_code__r.Code__c;
        } catch (ListException e) {
            return '';
        }
    }   

    static String getCharCode(User user) {
        if (CharCodes__c.getInstance(user.id).TextCode__c != '') {
            return CharCodes__c.getInstance(user.id).TextCode__c;
        } else {
            return (GlobalClass.alphabet[(Integer)(Math.random()*10)] + GlobalClass.alphabet[(Integer)(Math.random()*10)]).toUpperCase();
        } 
    }

    static String getNumCode() {
        return ('' + (Integer)(Math.random()*10) + 
                     (Integer)(Math.random()*10) + 
                     (Integer)(Math.random()*10) + 
                     (Integer)(Math.random()*10)).mid(0,5);
    }

    public static void saveCarNumber() {
        currentUser.CarNumber__c = carNumber;
        update currentUser;
    }

    public static void generateCarNumberForAll() {
        List<User> allWannaCar = [SELECT Id, CarNumber__c, City FROM User WHERE CarNumber__c = '' LIMIT 50000];
        for (User userItem : allWannaCar) {
            generateCarNumber(userItem);
        }
        Database.update(allWannaCar, false);
    }

    public static void generateCarNumberForMe() {
        generateCarNumber(currentUser);
    }
}

