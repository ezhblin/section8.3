public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getSearchDataBack(String objectName, String pathName) {
        Schema.SObjectType myObject = GlobalClass.getObject(objectName);
        List<Schema.SObjectField> updatableFeilds = GlobalClass.getTextEditadbleField(objectName);
        if (myObject == null) {
            return null;
        }
       
        String stringField = '';
        for (Schema.SObjectField itemField : updatableFeilds) {
            stringField += (itemField + ', ');
        }

        String nameLike = '\'%'+ pathName +'%\'';
        
        return Database.query('SELECT '+ stringField.removeEnd(', ') +' FROM '+ myObject +' WHERE Name LIKE ' + nameLike);
    }
    
    @AuraEnabled 
    public static void updateSearchDataBack(String objectName, String objectJSON) {
        Schema.SObjectType myObject = GlobalClass.getObject(objectName);        
        if (myObject != null) {
            List<SObject> fromJSON = (List<SObject>) System.JSON.deserialize(objectJSON, Type.forName('List<'+myObject+'>'));
            List<Schema.SObjectField> updatableFeilds = GlobalClass.getTextEditadbleField(objectName);
            
            if (updatableFeilds.size()>1) {
               
                for (SObject item : fromJSON) {
                    item.put(updatableFeilds[0], item.get(updatableFeilds[0])+'test');
                }
                update fromJSON;
            }
        }
    }
}
