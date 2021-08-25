({
    clearCard : function(component, event, helper) {
        let params = event.getParam('arguments');

        if (params) helper.cleanDataInCard(component, params.oReally);
    },

    updateRecordParrent : function(component, event, helper) {
        component.set('v.loaded', !component.get('v.loaded'));
        component.recordForUpdate(component.get('v.record'));
        component.set('v.loaded', !component.get('v.loaded'));
    },

    deleteRecordParrent : function(component, event, helper) {
        component.recordForDelete(component.get('v.record'));
    },
})