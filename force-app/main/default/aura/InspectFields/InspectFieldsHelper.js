({
    fillFields : function(cmp, action) {
        action.setCallback(this, $A.getCallback(response => {
            if (response.getState() === 'SUCCESS') {
                cmp.set('v.myData', JSON.parse(response.getReturnValue()));
            } else {
                console.log('ERROR');
            }
            cmp.set('v.loaded', true);
        }));
        $A.enqueueAction(action);
    },
})