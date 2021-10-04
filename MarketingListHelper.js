({
	nextProperty : function(component, event, helper) {
		var action = component.get("c.getProperty");
        var size = component.get("v.OffsetSize");
        action.setParams({numBathrooms : component.get("v.oldnumBath"), numBedrooms : component.get("v.oldnumBed"), maxRent : component.get("v.oldnumRent"), setsize : size});
        size += 1;
        action.setCallback(this, function(response) {
            component.set("v.OffsetSize", size);
            component.set("v.properties", response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    previousProperty : function(component, event) {
		var getList = component.get("c.getProperty");
        var size = component.get("v.OffsetSize");
        size -= 1;
        getList.setParams({numBathrooms : component.get("v.oldnumBath"), numBedrooms : component.get("v.oldnumBed"), maxRent : component.get("v.oldnumRent"), setsize : size - 1});
        
        getList.setCallback(this, function(response) {
            component.set("v.OffsetSize", size);
            component.set("v.properties", response.getReturnValue());
        });
        $A.enqueueAction(getList);
    },
    filterResult : function(component, event, helper) {
        var getBedList = component.find("bedroomList").get("v.value");
        var getBathList = component.find("BathroomList").get("v.value");
        var getRentAmount = component.find("rentamount").get("v.value");
        var getList = component.get("c.getProperty");
        var checkBedValue = component.get("v.numBed");
        var checkBathValue = component.get("v.numBath");
        var checkRentValue = component.get("v.numRent");
        component.set("v.oldnumRent", checkRentValue);
        component.set("v.oldnumBath", checkBathValue);
        component.set("v.oldnumBed", checkBedValue);
        getList.setParams({numBathrooms : getBathList, numBedrooms : getBathList, maxRent : getRentAmount, setsize : "v.OffsetSize"}); 
        getList.setCallback(this, function(response) {
            component.set("v.OffsetSize", 0);
            component.set("v.examples", response.getReturnValue());
            
        });
        $A.enqueueAction(getList);
    }
})