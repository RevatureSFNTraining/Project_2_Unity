({
	display : function(component, event, helper) {
        var showRec = component.get("c.getProperty");
        var size = component.get("v.OffsetSize");
        showRec.setParams({numBathrooms : component.get("v.oldnumBath"), numBedrooms : component.get("v.oldnumBed"), maxRent : component.get("v.oldnumRent"), setsize : size});
        showRec.setCallback(this,function(response) {
            component.set("v.OffsetSize", size);
            component.set("v.properties", response.getReturnValue());
        });
        $A.enqueueAction(showRec);
    },
    nextProperty : function(component, event, helper) {
		var action = component.get("c.getProperty");
        var size = component.get("v.OffsetSize");
        size += 1;
        action.setParams({numBathrooms : component.get("v.oldnumBath"), numBedrooms : component.get("v.oldnumBed"), maxRent : component.get("v.oldnumRent"), setsize : size});
        action.setCallback(this, function(response) {
            if (response.getReturnValue().length > 0) {
                component.set("v.OffsetSize", size);
                component.set("v.properties", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    previousProperty : function(component, event) {
		var getList = component.get("c.getProperty");
        var size = component.get("v.OffsetSize");
        size -= 1;
        getList.setParams({numBathrooms : component.get("v.oldnumBath"), numBedrooms : component.get("v.oldnumBed"), maxRent : component.get("v.oldnumRent"), setsize : size});
        getList.setCallback(this, function(response) {
            if (response.getReturnValue().length > 0) {
                component.set("v.OffsetSize", size);
                component.set("v.properties", response.getReturnValue());
            }
        });
        $A.enqueueAction(getList);
    },
    filterResults : function(component, event, helper) {
        var getBedList = component.find("bedroomList").get("v.value");
        var getBathList = component.find("bathroomList").get("v.value");
        var getRentAmount = component.find("rentamount").get("v.value");
        var getList = component.get("c.getProperty");
        var checkBedValue = component.get("v.numBed");
        var checkBathValue = component.get("v.numBath");
        var checkRentValue = component.get("v.numRent");
        component.set("v.oldnumRent", checkRentValue);
        component.set("v.oldnumBath", checkBathValue);
        component.set("v.oldnumBed", checkBedValue);
        alert(getRentAmount);
        getList.setParams({numBathrooms : getBathList, numBedrooms : getBedList, maxRent : getRentAmount, setsize : 0}); 
        getList.setCallback(this, function(response) {
            component.set("v.OffsetSize", 0);
            alert(response.getReturnValue());
            component.set("v.properties", response.getReturnValue());
            
        });
        $A.enqueueAction(getList);
    }
})