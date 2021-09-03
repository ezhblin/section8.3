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

    filterChange: function (cmp) {
        let appEvent = $A.get('e.c:ChangeWHERE');
        appEvent.setParams({'filters' : cmp.get('v.myFilter')});
        appEvent.fire();
    },

    filterChangePlusType: function (cmp) {
        let filter = cmp.get('v.myFilter');
        let types = cmp.get('v.myData');
        filter.map(x => types.map(y => {
            if(x.value==y.value) x.type = y.typeForWeb
        }));
        let appEvent = $A.get('e.c:ChangeWHERE');
        cmp.set('v.myFilter', filter);
        appEvent.setParams({'filters' : filter});
        appEvent.fire();
    },


})