({
    filterBySpecialty : function(component, event, helper) {
        var vendorListMethod = component.get("c.getVendorList");
        vendorListMethod.setParams({
            specialty: component.find("selectedSpecialty").get("v.value"),
            orderByField: component.find("sortField").get("v.value")
        });
        vendorListMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var vendorList = response.getReturnValue();
                component.set("v.vendorList", vendorList);
            }
        });
        $A.enqueueAction(vendorListMethod);
    }
})
