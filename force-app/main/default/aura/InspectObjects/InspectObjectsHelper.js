({
    getListObjects : function(cmp) {
        let action = cmp.get('c.getAviableObjects');
        this.fillData(cmp, action);
    },

    fillData : function(cmp, action) {
        action.setCallback(this, $A.getCallback(response => {
            if (response.getState() === 'SUCCESS') {
                cmp.set('v.objectList', JSON.parse(response.getReturnValue()));
            } else {
                console.log('ERROR');
            }
        }));
        $A.enqueueAction(action);
    }
})