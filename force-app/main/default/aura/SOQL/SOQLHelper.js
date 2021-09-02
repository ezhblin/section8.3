({
    buildStringForSOQL : function(cmp, fields, objectName) {
        let stringSOQL = 'SELECT ';
        let filter = '';
        fields.map(object => {
            stringSOQL += (object.value + ', ');
            if (object.compare) {
                if (!filter) {
                    filter += ' WHERE ';
                } else {
                    filter += 'AND ' 
                }
                filter += object.value + ' ' + object.compare + ' ';
                if (object.filter) {
                    if(object.compare == 'LIKE') {
                        filter += '\'%'+ object.filter + '%\''+' ';
                    } else {
                        filter += object.filter + ' ';
                    }
                } else {
                    filter += '""' + ' '; 
                }
            }
        });
        stringSOQL = stringSOQL.substring(0, stringSOQL.length-2);
        
        stringSOQL += ' FROM ' + objectName;
        stringSOQL += filter == '' ? ' ' : filter;
        stringSOQL += 'LIMIT 2000';
        cmp.set('v.mySOQL', stringSOQL);
    },
})