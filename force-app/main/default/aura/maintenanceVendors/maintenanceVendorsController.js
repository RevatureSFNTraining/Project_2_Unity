({
    filterBySpecialty : function(component, event, helper) {
        var vendorListMethod = component.get("c.getVendorList");
        vendorListMethod.setParams({
            specialty: component.find("selectedSpecialty").get("v.value"),
            orderByField: component.find("sortField").get("v.value")
        });
        vendorListMethod.setCallback(this, function(response) {
            alert(response.getState());
        });
        $A.enqueueAction(vendorListMethod);
    }
})
