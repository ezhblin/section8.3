({
    showRecordDetails : function(component, recordId) {
        if (component.get('v.record.Id') != recordId) {
            component.set ('v.record', component.get('v.records').find(record => record.Id === recordId));
        } else {
            this.hideRecordDetails(component);
        }
    },

    hideRecordDetails : function(component) {
        component.find('detailCard').clearCard(true);
    },

    fillData : function (component) {
        let action = component.get('c.getRecordApex');
            action.setCallback(this, $A.getCallback(response => {
                let state = response.getState();
                if (state === 'SUCCESS') {
                    component.set('v.records', response.getReturnValue());
                } else if (state === 'ERROR') {
                    console.error(response.getError());
                }
            }));
        $A.enqueueAction(action);
        
    },

    updateRecords : function(component, param) {
        let action = component.get('c.updateRecordApex');
        action.setParams({objectJSON : JSON.stringify(param)});
        action.setCallback(this, $A.getCallback(response => {
            if (response.getState() == 'SUCCESS') {
                component.set('v.records', component.get('v.records'));
            } else {
                component.set('v.record', component.get('v.records').find(record => record.Id === component.get('v.record').Id));
            }
        }));
        $A.enqueueAction(action);
    },

    deleteRecord : function(component, param) {
        let action = component.get('c.deleteRecordApex');
        action.setParams({objectJSON : JSON.stringify(param)});
        action.setCallback(this, $A.getCallback(response => {
            if (response.getState() != 'SUCCESS') {
                let data = component.get('v.records');
                data.map(item => {if(item.Id == component.get('v.record.Id')) item.hide = true});
                component.set('v.records', data);
            } else {
                this.fillData(component);
            }
            //this.fillData(component);
            component.set('v.record', null);
        }));
        $A.enqueueAction(action);
    },

})