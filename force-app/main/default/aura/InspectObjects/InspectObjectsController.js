({
    init : function(cmp, event, helper) {
        helper.getListObjects(cmp);
    },

    getFieldList : function(cmp, event, helper) {
        cmp.get('v.fields').clear;
        let objectChosen = event.getParam('value');
        cmp.set('v.objectName', objectChosen);
        let action = cmp.get('c.getAviableFields');
        action.setParams({objectName : objectChosen});
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