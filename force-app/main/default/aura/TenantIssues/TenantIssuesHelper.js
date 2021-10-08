({
    formCase : function(component, event, helper) {
        var action = component.get("c.saveCase");
        action.setParams({name : component.get("v.tenantId"), description : component.get("v.description"),subject : component.get("v.subject"), reason : component.get("v.reason"), status : component.get("v.status"), orig : component.get("v.origin")});
        action.setCallback(this,function(response){
            component.set("v.tenantId", "")
            component.set("v.status", "");
            component.set("v.origin", "");
            component.set("v.reason", "");
            component.set("v.subject", "");
            component.set("v.description", "");
        });
        $A.enqueueAction(action);
    }
})
