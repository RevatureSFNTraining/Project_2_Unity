({
    initialize : function(component) {
        var propertiesMethod = component.get("c.getProperties");
        propertiesMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set("v.properties", response.getReturnValue());
            }
        });
        $A.enqueueAction(propertiesMethod);
    },

    calculateProfit : function(component, event) {
        var totalIncome = component.find("totalIncome").get("v.value");
        var totalExpenses = component.find("totalExpenses").get("v.value");
        component.set("v.profit", totalIncome - totalExpenses);
        event.getSource().set("v.disabled", false);
    },

    getDaysBetween : function(date1, date2) {
        var millis = Math.abs(date2.getTime() - date1.getTime());
        return millis / (1000 * 60 * 60 * 24); //1000 ms = 1 s, 60s = 1m, 60m = 1h, 24h = 1 day
    },

    getExpenseReport : function(component, event) {
        var expenseMethod = component.get("c.getQuotes");
        expenseMethod.setParams({
            propertyId: component.find("propertySelect").get("v.value")
        });
        expenseMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var totalExpenses = 0;
                const quotes = response.getReturnValue();
                for (var i = 0; i < quotes.length; i++) {
                    var cost = quotes[i].Hours__c * quotes[i].Hourly_Rate__c
                    totalExpenses += cost;
                    quotes[i].cost = cost;
                }
                component.find("totalExpenses").set("v.value", totalExpenses);
                component.set("v.quotes", quotes);
                this.calculateProfit(component, event);
            }
            else {
                event.getSource().set("v.disabled", false);
            }
        });
        $A.enqueueAction(expenseMethod);
    },

    getRentalReport : function(component, event) {
        event.getSource().set("v.disabled", true);
        var incomeMethod = component.get("c.getLeaseAgreements");
        incomeMethod.setParams({
            propertyId: component.find("propertySelect").get("v.value")
        });
        incomeMethod.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var totalIncome = 0;
                const leaseAgreements = response.getReturnValue();
                for (var i = 0; i < leaseAgreements.length; i++) {
                    var agreementIncome = leaseAgreements[i].Security_Deposit__c;

                    var startDate = new Date(leaseAgreements[i].Start_Date__c);
                    var endDate = new Date(leaseAgreements[i].End_Date__c);
                    agreementIncome += this.getDaysBetween(startDate, endDate) / 30 * leaseAgreements[i].Monthly_Rent_Due__c; //Assume 30 days per month.

                    totalIncome += agreementIncome;
                    leaseAgreements[i].calculatedIncome = agreementIncome;
                }
                component.find("totalIncome").set("v.value", totalIncome);
                component.set("v.leaseAgreements", leaseAgreements);
                this.getExpenseReport(component, event);
            }
            else {
                event.getSource().set("v.disabled", false);
            }
        });
        $A.enqueueAction(incomeMethod);
    },

    selectProperty : function(component) {
        const properties = component.get("v.properties");
        const propertyId = component.find("propertySelect").get("v.value");
        for(var i = 0; i < properties.length; i++) {
            if (propertyId == properties[i].Id) {
                component.set("v.selectedProperty", properties[i]);
                component.set("v.hasSelectedProperty", true);
                return;
            }
        }

        //set hasSelectedProperty to false if no match is found
        component.set("v.selectedProperty", {});
        component.set("v.hasSelectedProperty", false);
    }
})
