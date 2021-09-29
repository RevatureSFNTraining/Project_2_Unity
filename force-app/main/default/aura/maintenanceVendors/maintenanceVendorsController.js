({
    initialize : function(component, event, helper) {
        helper.getSpecialties(component);
        helper.getVendorList(component, "", "");
    },

    filterBySpecialty : function(component, event, helper) {
        helper.getVendorList(component, component.find("selectedSpecialty").get("v.value"), component.find("sortField").get("v.value"));
    }
})
