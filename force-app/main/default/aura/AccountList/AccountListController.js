({
	updateHandleClick : function(component, event, helper) {
		helper.updateData(component);
	},
	
	clearHandleClick : function(component, event, helper) {
		helper.clearData(component);
	},

	searchHandleClick : function(component, event, helper) {
		helper.getSearchData(component);
	},

	init : function(component, event, helper) {

	},

	searchPathName : function(component, event, helper) {
		let lengthName = component.get('v.searchingName').length;
		if (lengthName > 2 || lengthName == 0) helper.getSearchData(component);
	},
})