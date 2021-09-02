public with sharing class BuilderApex {
    @AuraEnabled 
    public static String getAviableObjects() {
        List<Tables> listObject = new List<Tables>();
        for (Schema.SObjectType item : GlobalClass.gd.values()) {
            Schema.DescribeSObjectResult objectInfo = item.getDescribe();
            if (objectInfo.isAccessible() && objectInfo.isQueryable()) {
                listObject.add(new Tables(objectInfo.getLabel(), objectInfo.getName()));
            }
        }
        return JSON.serialize(listObject);
    }
   
    class Tables {
        String label = '';
        String value = '';
        Schema.DisplayType type;
        String typeForWeb;
        
        Tables(String label, String name) {
            this.label = label;
            this.value = name;
        }

        Tables(String label, String name, Schema.DisplayType type) {
            this.label = label;
            this.value = name;
            this.type = type;

            if (type == Schema.DisplayType.DATE || type == Schema.DisplayType.DATETIME) {
                this.typeForWeb = 'date';
            } else if (type == Schema.DisplayType.INTEGER || type == Schema.DisplayType.DOUBLE) {
                this.typeForWeb = 'number';
            } else {
                this.typeForWeb = 'text';
            }
        }

    }

   @AuraEnabled
    public static String getAviableFields(String objectName) {
        List<Tables> listObject = new List<Tables>();
        List<Schema.SObjectField> fields = GlobalClass.gd.get(objectName).getDescribe().fields.getMap().values();
        for (Schema.SObjectField itemField : fields) {
            Schema.DescribeFieldResult fieldInfo = itemField.getDescribe();
            if(fieldInfo.isAccessible()) {
                listObject.add(new Tables(fieldInfo.getLabel(), fieldInfo.getLocalName(), fieldInfo.getType() ));
            }
        }
        return JSON.serialize(listObject);
    }

    @AuraEnabled
    public static String retriveContactsApex(String recordId) {
        return JSON.serialize([SELECT FirstName, LastName FROM Contact WHERE AccountId =: recordId]);
    }

    @AuraEnabled
    public static String retriveContactForAccountApex(String recordId) {
        String accountId = [SELECT AccountId FROM Contact WHERE Id =: recordId LIMIT 1][0].AccountId;
        return retriveContactsApex(accountId);
    }

    @AuraEnabled
    public static String getDataFromString(String query) {
        return JSON.serialize(Database.query(query));
    }
}  

