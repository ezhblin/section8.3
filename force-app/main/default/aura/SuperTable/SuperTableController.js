({
    init : function(component, event, helper) {
        helper.fillData(component);
    },

    showHideDetails : function(component, event, helper) {
        let recordId = event.getSource().get('v.value');

        helper.showRecordDetails(component, recordId);
    },

    updateTable : function(component, event, helper) {
        helper.updateRecords(component, event.getParam('arguments'));
    },

    deteteFromTable : function(component, event, helper) {
        helper.deleteRecord(component, event.getParam('arguments'));
    },
})