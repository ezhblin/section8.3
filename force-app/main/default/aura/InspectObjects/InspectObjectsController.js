({
    init : function(cmp, event, helper) {
        helper.getListObjects(cmp);
    },

    getFieldList : function(cmp, event, helper) {
        let action = cmp.get('c.getAviableFields');
        action.setParams({objectName : event.getParam('value')});
        action.setCallback(this, $A.getCallback(response => {
            if (response.getState() === 'SUCCESS') {
                cmp.set('v.fields', JSON.parse(response.getReturnValue()));
            } else {
                console.log('ERROR');
            }
        }));
        $A.enqueueAction(action);
    },
})