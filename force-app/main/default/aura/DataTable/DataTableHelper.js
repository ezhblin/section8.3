({
    retriveData : function(cmp, request) {
        request.setCallback(this, $A.getCallback(response => {
            if (response.getState() === 'SUCCESS') {
                let retriveData = JSON.parse(response.getReturnValue());
                this.fillColumns(cmp, retriveData);
                this.filltable(cmp, retriveData);
            } else {
                console.log('ERROR');
            }
        }));
        $A.enqueueAction(request);
    },

    fillColumns : function(cmp, data) {
        let columns = [];
        let fields = new Set();
        data.map(obj => {
            Object.keys(obj).forEach(fieldName => {
                if (fieldName != 'attributes') {
                    fields.add(fieldName);
                }
            })
        });
        fields.forEach(field => columns.push({label: field, fieldName: field, type: 'text'}));
        cmp.set('v.myColumns', columns);
    },

    filltable : function(cmp, data) {
        cmp.set('v.myData', data);
    },
})