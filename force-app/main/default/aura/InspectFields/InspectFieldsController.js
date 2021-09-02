({
    getFields : function(cmp, event, helper) {
        cmp.set('v.loaded', false);
        let action = cmp.get('c.getAviableFields');
        action.setParams({objectName : event.getParam('objectName')});
        helper.fillFields(cmp, action);
    },

    getFieldsForFilter: function (cmp, event) {
        let appEvent = $A.get('e.c:pickFields');
        appEvent.setParams({'data' : event.getParam('selectedRows')});
        appEvent.fire();
    },
})