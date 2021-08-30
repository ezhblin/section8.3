({
    fillData : function(cmp, action) {
        action.setParams({recordId : cmp.get('v.recordId')});
        action.setCallback(this, $A.getCallback(response => {
            if (response.getState() === 'SUCCESS') {
                cmp.set('v.myData', JSON.parse(response.getReturnValue()));
            } else {
                console.log('ERROR');
            }
        }));
        $A.enqueueAction(action);
    },
})