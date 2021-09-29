({
    getVendorList : function(component, specialty, sortField) {
        var vendorListMethod = component.get("c.getVendorList");
        vendorListMethod.setParams({
            specialty: specialty,
            orderByField: sortField
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
