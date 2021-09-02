({
    onMultiSelectChange: function (cmp, event) {
        let appEvent = $A.get('e.c:ChangeSOQL');
        appEvent.setParams({'fields' : event.getParam('selectedRows')});
        appEvent.fire();
    },
})