({
    init : function(cmp) {
        let mySort = {typeSort : 'ASC', nulls : 'NULLS FIRST'};
        cmp.set('v.sort', mySort);
    },

    sortChange : function(cmp) {
        let appEvent = $A.get('e.c:ChangeORDER');
        appEvent.setParams({'mySort' : cmp.get('v.sort')});
        appEvent.fire();
    },
})