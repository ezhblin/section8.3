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
})