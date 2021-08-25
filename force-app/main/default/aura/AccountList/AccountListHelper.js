({
	updateData : function(component) {
        let action = component.get('c.updateSearchDataBack');
        action.setParams({objectName : component.get("v.myString"), objectJSON : JSON.stringify(component.get('v.myData'))});
        action.setCallback(this, $A.getCallback(response => response.getState() == 'SUCCESS' ? alert('Good job') : console.log(response.getState())));
        $A.enqueueAction(action);
	},

    changeComponentName : function(component, myString) {
        component.set("v.myString", myString);
	},
    

    getSearchData : function(component) {
        let action = component.get('c.getSearchDataBack');
        action.setParams({objectName : component.get("v.myString"), 
                        pathName : component.get("v.searchingName")});
        this.fillData(component, action);
    },

    clearData : function(component) {
        component.set("v.myData", null);
    },

    fillData : function(component, action) {
        action.setCallback(this, $A.getCallback(response => {
            let state = response.getState();
            if (state === 'SUCCESS') {
                let retrivedObject = response.getReturnValue();
                if (!retrivedObject) {
                    this.showToast('No data, check object name');
                } else {
                    let fields = new Set();
                    retrivedObject.map(obj => Object.keys(obj).forEach(fieldName => fields.add(fieldName)));
                    let columns = [];
                    fields.forEach(field => columns.push({label: field, fieldName: field, type: 'text'}));
                    component.set('v.myColumns', columns);
                    component.set('v.myData', retrivedObject);
                }
            } else if (state === 'ERROR') {
                console.log('ERROR');
            //    console.log(response.getError());
            }
        }));
        $A.enqueueAction(action);
    },

    showToast : function(message) {
        let toastEvent = $A.get("e.force:showToast");

        toastEvent.setParams({'message' : message});

        toastEvent.fire();
    },
})