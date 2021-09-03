({
    refreshSOQL : function(cmp) {
        let select = cmp.get('v.blockSELECT');
        let where = cmp.get('v.blockWHERE');
        let order = cmp.get('v.blockORDER');
        if (select) cmp.set('v.stringSOQL', select+where+order);
    },
})