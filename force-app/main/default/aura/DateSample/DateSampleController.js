({
	init : function(component, event, helper) {
		var pageReference = component.get("v.pageReference");
		component.set("v.accountName", pageReference.state.accountName);
	}
})