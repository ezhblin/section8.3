({
    addFilter : function(cmp) {
        cmp.get('v.myFilter').push({});
        cmp.set('v.myFilter', cmp.get('v.myFilter'));
    },

})