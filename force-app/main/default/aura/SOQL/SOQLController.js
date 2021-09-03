({
    buildSelectBlock : function(cmp, evt, helper) { 
        let fields = evt.getParam('fields');
        let blockSelect = 'SELECT ' + fields.replaceAll(';', ', ') + ' FROM ' + cmp.get('v.objectName');
        cmp.set('v.blockSELECT', blockSelect);
        helper.refreshSOQL(cmp);
    },

    buildWhereBlock : function(cmp, evt, helper) { 
        let blockWhere = ' WHERE'; 
        let filters = evt.getParam('filters');
        
        filters.map((filter, i) => {
            if (filter.value && filter.compare && filter.filter) {
                if (i != 0) blockWhere += ' AND';
                blockWhere += ' ' + filter.value + ' ' + filter.compare + ' ';
                if (filter.compare == 'LIKE') {
                    blockWhere += '\'%' + filter.filter + '%\'';
                } else {
                    blockWhere += filter.filter;
                }
            }
        });
        if (blockWhere != ' WHERE') cmp.set('v.blockWHERE', blockWhere);
        helper.refreshSOQL(cmp);
    },

    buildOrderBlock : function(cmp, evt, helper) { 
        let blockWhere = ''; 
        let mySort = evt.getParam('mySort');

        if (mySort.fieldSort) {
            blockWhere += ' ORDER BY ' + mySort.fieldSort + ' ' +  mySort.typeSort + ' ' + mySort.nulls;
        }    
        if (mySort.limit) {
            blockWhere += ' LIMIT ' + mySort.limit;
        }

        if (blockWhere) cmp.set('v.blockORDER', blockWhere);
        helper.refreshSOQL(cmp);
    },
})