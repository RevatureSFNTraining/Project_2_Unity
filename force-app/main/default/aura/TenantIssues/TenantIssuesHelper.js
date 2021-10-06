({
    formCase : function(component, event, helper) {
        var action = component.get("c.saveCase");
        action.setParams({
            tenantId : component.get("v.tenantId"),
            description : component.get("v.description"),
            subject : component.get("v.subject"),
            reason : component.get("v.reason"),
        });
        action.setCallback(this,function(response){
            component.set("v.tenantId", "");
            component.set("v.reason", "");
            component.set("v.subject", "");
            component.set("v.description", "");
        });
        $A.enqueueAction(action);
    }
})
