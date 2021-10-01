({
    initialize : function(component) {
        var specialtiesMethod = component.get("c.getSpecialties");
        specialtiesMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set("v.specialties", response.getReturnValue());
                this.cacheSearchParams(component);
                this.getVendorCount(component);
                this.getVendorList(component);
            }
        });
        $A.enqueueAction(specialtiesMethod);
    },

    cacheSearchParams : function(component) {
        component.set("v.searchCache", {
            search: component.find("search").get("v.value"),
            specialty: component.find("selectedSpecialty").get("v.value"),
            sortField: component.find("sortField").get("v.value"),
            entriesPerPage: component.find("entriesPerPage").get("v.value")
        });
    },

    getVendorCount : function(component) {
        const searchCache = component.get("v.searchCache");

        var vendorCountMethod = component.get("c.getVendorCount");
        vendorCountMethod.setParams({
            search: searchCache.search,
            specialty: searchCache.specialty
        });
        vendorCountMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var totalRecords = response.getReturnValue();
                var totalPages = Math.ceil(totalRecords / component.find("entriesPerPage").get("v.value"));
                
                var pageList = [];
                var i = 1;
                do {
                    pageList.push(i);
                    i++;
                } while (i <= totalPages);
                    
                component.set("v.pageList", pageList);
                component.find("page").set("v.value", 1);
            }
        });
        $A.enqueueAction(vendorCountMethod);
    },

    getVendorList : function(component, page) {
        const searchCache = component.get("v.searchCache");

        if (page === undefined)
            page = 1;

        var vendorListMethod = component.get("c.getVendorList");
        vendorListMethod.setParams({
            search: searchCache.search,
            specialty: searchCache.specialty,
            orderByField: searchCache.orderByField,
            limitRecords: searchCache.entriesPerPage,
            offset: (page - 1) * searchCache.entriesPerPage
        });
        vendorListMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set("v.vendorList", response.getReturnValue());
            }
        });
        $A.enqueueAction(vendorListMethod);
    }
})
