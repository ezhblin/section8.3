({
    init : function(cmp, event, helper) {
        cmp.set('v.myColumns', [
            {label : 'Name', fieldName : 'label', type : 'text'},
            {label : 'Type', fieldName : 'type', type : 'text'}
        ])
    },

    getFields : function(cmp, event, helper) {
        cmp.set('v.loaded', false);
        let action = cmp.get('c.getAviableFields');
        action.setParams({objectName : event.getParam('objectName')});
        helper.fillFields(cmp, action);
    },
})