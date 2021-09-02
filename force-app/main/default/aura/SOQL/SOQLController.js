({
    toggleShow : function(cmp) {
        cmp.set('v.show', !cmp.get('v.show'));
    },

    requestForData: function(cmp) {
        console.log('do request');
    },

    buildSOQL : function(cmp, event, helper) {
        helper.buildStringForSOQL(cmp, event.getParam('dataForSOQL'), cmp.get('v.objectName'));
    },

    getObjectName : function(cmp, event) {
        cmp.set('v.objectName', event.getParam('objectName'));
    },
})