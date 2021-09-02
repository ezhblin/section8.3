({
    onMultiSelectChange: function (cmp, event) {
        let appEvent = $A.get('e.c:ChangeSELECT');
        let selectBox = cmp.find('InputSelectMultiple');
        appEvent.setParams({'fields' : selectBox.get('v.value')});
        appEvent.fire();
    },
})