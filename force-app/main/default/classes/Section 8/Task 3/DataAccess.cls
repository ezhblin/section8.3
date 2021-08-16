public with sharing class DataAccess {
    public Schema.SObjectField fieldName {get; set;}
    public Boolean canRead {get; set;}
    public Boolean canEdit {get; set;}

    public DataAccess(Schema.SObjectField fieldName, Boolean canRead, Boolean canEdit) {
        this.fieldName = fieldName;
        this.canRead = canRead;
        this.canEdit = canEdit;
    }
}