({
	next : function(component, event, helper) {
		helper.nextProperty(component);
	},
    previous : function(component, event, helper) {
        helper.previousProperty(component);
    },
    filter : function(component, event, helper) {
        helper.filterResults(component);
    }
})