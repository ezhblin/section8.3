public with sharing class GlobalClass {
    public static Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
    
    public static Map<String, List<String>> getCompareForType() {
        Map<String, List<String>> compare = new Map<String, List<String>>();
        compare.put('data', new List<String>{'>=', '>', '<=', '<', '=', '!='});
        compare.put('number', new List<String>{'>=', '>', '<=', '<', '=', '!='});
        compare.put('text', new List<String>{'=', '!=', 'contains', 'not contains'});
        return compare;
    }
        
    
    public static Schema.SObjectType getObject(String objectName) {
        if (gd.containsKey(objectName)) {
            return gd.get(objectName);
        } else {
            return null;
        }
    }
    
    public static List<Schema.SObjectField> getTextEditadbleField(String objectName) {
        Schema.SObjectType myObject = getObject(objectName);
        if (myObject != null) {
            Schema.DescribeSObjectResult objectInfo = myObject.getDescribe();
            List<Schema.SObjectField> fields = objectInfo.fields.getMap().values();
            List<Schema.SObjectField> canUpdeteFields = new List<Schema.SObjectField>();
            for (Schema.SObjectField itemField : fields) {
                Schema.DescribeFieldResult fieldInfo = itemField.getDescribe();
                if (fieldInfo.isAccessible() && fieldInfo.isUpdateable() && fieldInfo.getType() == Schema.DisplayType.STRING) {
                    canUpdeteFields.add(itemField);
                }
            }
            return canUpdeteFields;
        }
        return null;
    }
    
    public static Map<String, String> getPickList(String objectName, String fieldName) {   
        Map<String, String> pickListValues = new Map<String, String>();
        if (gd.containsKey(objectName)) {
            Schema.DescribeSObjectResult r = gd.get(objectName).getDescribe() ;
            Map<String,Schema.SObjectField> fields =  r.fields.getMap();
	        if (fields.containsKey(fieldName)) {
                for (Schema.PicklistEntry p : fields.get(fieldName).getDescribe().getPicklistValues()) {
                    pickListValues.put(p.getLabel(), p.getValue());
                }
                return pickListValues;
            }
        }
        return null;
    }
    
    public static List<String> alphabet= new List<String>('abcdefghiklmnopqrstvxyz'.split(''));
    public static void closeCase(List<Account> accounts) {
        List<Case> cases = [SELECT Id, Status, Description, IsClosed FROM Case WHERE IsClosed != true];
        List<Case> casesForClose = new List<Case>();
        Map<String, List<Case>> mapCase = new  Map<String, List<Case>>();
        for (Case caseItem : cases) {  
            if (caseItem.Description != null) { 
                List<String> sPlitDescription = caseItem.Description.split(';');
                try {
                    if (mapCase.containsKey(sPlitDescription[sPlitDescription.size()-1])) {
                        mapCase.get(sPlitDescription[sPlitDescription.size()-1]).add(caseItem);
                    } else {
                        mapCase.put(sPlitDescription[sPlitDescription.size()-1], new List<Case>{caseItem});
                    }
                } catch (Exception e) {
                    System.debug(e.getMessage());
                }
            }    
        }
        if (!mapCase.isEmpty()) {
            for (Account account : accounts) {
                if (mapCase.containsKey(account.Id)){
                    for (Case caseItem : mapCase.get(account.Id)) {
                        caseItem.Status = 'Closed';
                        casesForClose.add(caseItem);
                    }
                }
            }
            update casesForClose;
        }
    }
}