({
    getSpecialties : function(component) {
        var specialtiesMethod = component.get("c.getSpecialties");
        specialtiesMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set("v.specialties", response.getReturnValue());
            }
        });
        $A.enqueueAction(specialtiesMethod);
    },

    getVendorCount : function(component, specialty) {
        var vendorCountMethod = component.get("c.getVendorCount");
        vendorCountMethod.setParams({
            specialty: specialty
        });
        vendorCountMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var totalRecords = response.getReturnValue();
                var totalPages = Math.ceil(totalRecords / component.find("entriesPerPage").get("v.value"));
                
                var pageList = [];
                for (var i = 1; i <= totalPages; i++)
                    pageList.push(i);
                component.set("v.pageList", pageList);
            }
        });
        $A.enqueueAction(vendorCountMethod);
    },

    getVendorList : function(component, specialty, sortField, page) {
        var vendorListMethod = component.get("c.getVendorList");
        var entriesPerPage = component.find("entriesPerPage").get("v.value");
        vendorListMethod.setParams({
            specialty: specialty,
            orderByField: sortField,
            limitRecords: entriesPerPage,
            offset: (page - 1) * entriesPerPage
        });
        vendorListMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set("v.vendorList", response.getReturnValue());
            }
        });
        $A.enqueueAction(vendorListMethod);
    }
})
