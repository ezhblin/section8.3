({
    doSOQL : function(cmp) {
        let appEvent = $A.get('e.c:AcceptBuilder');
        appEvent.setParams({'dataForSOQL' : cmp.get('v.myData')});
        appEvent.fire();
    },
})