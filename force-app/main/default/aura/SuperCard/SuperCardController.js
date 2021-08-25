({
    clearCard : function(component, event, helper) {
        let params = event.getParam('arguments');

        if (params) helper.cleanDataInCard(component, params.oReally);
    },

    updateRecordParrent : function(component, event, helper) {
        component.set('v.loaded', false);
        component.recordForUpdate(component.get('v.record'));
    },

    deleteRecordParrent : function(component, event, helper) {
        component.set('v.loaded', false);
        component.recordForDelete(component.get('v.record'));
    },
})