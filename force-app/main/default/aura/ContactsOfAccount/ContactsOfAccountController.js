({
    init : function(cmp, event, helper) {
        let action = cmp.get('c.retriveContactsApex');
        helper.fillData(cmp, action);
    },

    checkContacts : function(cmp, event, helper) {
        let action = cmp.get('c.retriveContactForAccountApex');
        helper.fillData(cmp, action);
    },
})