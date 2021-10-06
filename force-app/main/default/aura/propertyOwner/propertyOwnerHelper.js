({
	getAccounts : function(component) {
		var accs = component.get("c.getAccounts");
        accs.setCallback(this, function(response) {
            if(response.getState() == "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
            }
        });
        $A.enqueueAction(accs);
	},
    
    init : function(component) {
        var userId = $A.get("$SObjectType.CurrentUser.Id");
        component.set("v.userId", userId);
    },

    resetForm : function (component) {
        component.find('accField').forEach(function(f) {
        f.reset();
        });
    }
})