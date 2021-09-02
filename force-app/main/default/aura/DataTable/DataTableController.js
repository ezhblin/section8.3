({
    requestForData : function(cmp, evt, helper) {
        let action = cmp.get('c.getDataFromString');
        action.setParams({'query' : cmp.get('v.mySOQL')});
        helper.retriveData(cmp, action);
    },
})