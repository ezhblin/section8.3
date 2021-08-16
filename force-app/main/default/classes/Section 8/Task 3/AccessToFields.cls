public with sharing class AccessToFields {
    public static List<DataAccess> flc {get; set;}  
    public static String objectName {get; set;}
    public static Boolean canDelete {get; set;}
    public static Boolean canUpdate {get; set;}
    public static Boolean canCreate {get; set;}
    
    public static void getAccessInfo() {
        
        List<DataAccess> accessInfo = new List<DataAccess>();
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        if (gd.containsKey(objectName)) {
            Schema.DescribeSObjectResult objectInfo = gd.get(objectName).getDescribe();
            List<Schema.SObjectField> fields = objectInfo.fields.getMap().values();
            for (Schema.SObjectField field : fields) {
                Schema.DescribeFieldResult fieldInfo = field.getDescribe();
                accessInfo.add(new DataAccess(field, fieldInfo.isAccessible(), fieldInfo.isUpdateable()));
            }
            displayAccess(objectInfo, accessInfo);   
        }
    }
    
    private static void displayAccess(Schema.DescribeSObjectResult objectInfo, List<DataAccess> dataForDispaly) {
        canDelete = objectInfo.isDeletable();
        canUpdate = objectInfo.isUpdateable();
        canCreate = objectInfo.isCreateable();
        flc = dataForDispaly;
    }

    public AccessToFields() {

    }
}