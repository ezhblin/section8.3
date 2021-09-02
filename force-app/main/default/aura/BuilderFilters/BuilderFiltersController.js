({
    init : function(cmp, event, helper) {
        let pickList = [{label : 'equals', value : '='},
                        {label : 'not equals', value : '!='},
                        {label : 'more', value : '>'},
                        {label : 'less', value : '<'},
                        {label : 'contains', value : 'LIKE'}];
        cmp.set('v.pickListForCompare', pickList);    
    },
    
    addFilter : function(cmp) {
        cmp.get('v.myFilter').push({});
        cmp.set('v.myFilter', cmp.get('v.myFilter'));
    },

    filterChange: function (cmp, event) {
        let appEvent = $A.get('e.c:ChangeWHERE');
        appEvent.setParams({'filters' : cmp.get('v.myFilter')});
        appEvent.fire();
    },

})