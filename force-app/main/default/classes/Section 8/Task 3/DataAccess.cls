public with sharing class DataAccess {
    public String fieldName;
    private Boolean canRead;
    private Boolean canEdit; 

    public DataAccess(String fieldName, Boolean canRead, Boolean canEdit) {
        this.fieldName = fieldName;
        this.canRead = canRead;
        this.canEdit = canEdit;
    }
}
