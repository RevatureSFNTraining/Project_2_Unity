({
    initialize : function(component, event, helper) {
        helper.getSpecialties(component);
        helper.getVendorCount(component);
        helper.getVendorList(component, "", "Branch__r.Name", 1, 5);
    },

    filter : function(component, event, helper) {
        var specialty = component.find("selectedSpecialty").get("v.value");
        var sortField = component.find("sortField").get("v.value");
        var entriesPerPage = component.find("entriesPerPage").get("v.value");

        helper.getVendorCount(component, specialty);
        helper.getVendorList(component, specialty, sortField, 1, entriesPerPage);
    },

    selectSortAndPage : function(component, event, helper) {
        var specialty = component.find("selectedSpecialty").get("v.value");
        var sortField = component.find("sortField").get("v.value");
        var page = component.find("page").get("v.value");
        var entriesPerPage = component.find("entriesPerPage").get("v.value");

        helper.getVendorList(component, specialty, sortField, page, entriesPerPage);
    }
})
