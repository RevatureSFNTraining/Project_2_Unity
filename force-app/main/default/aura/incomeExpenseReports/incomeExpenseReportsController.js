({
    initialize : function(component, event, helper) {
        helper.initialize(component);
    },

    getReports : function(component, event, helper) {
        helper.selectProperty(component);
        helper.getRentalReport(component, event);
    }
})
