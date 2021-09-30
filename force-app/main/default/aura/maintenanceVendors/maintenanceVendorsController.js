({
    initialize : function(component, event, helper) {
        helper.initialize(component);
    },

    filter : function(component, event, helper) {
        helper.getVendorCount(component);
        helper.getVendorList(component);
    },

    swapPage : function(component, event, helper) {
        helper.getVendorList(component, component.find("page").get("v.value"));
    }
})
