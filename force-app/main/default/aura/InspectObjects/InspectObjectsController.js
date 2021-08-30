({
    init : function(cmp, event, helper) {
        helper.getListObjects(cmp);
    },

    eventFire : function(cmp, event, helper) {
        let customEvent = cmp.getEvent('changeObject');
        customEvent.setParams({'objectName' : event.getParam('value')});
        customEvent.fire();
    },
})