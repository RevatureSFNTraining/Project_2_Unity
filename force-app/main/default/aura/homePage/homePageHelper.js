({
    init : function(component) {
        component.set('v.mapMarkers', [
            {
                location: {
                    Street: '11730 Plaza America Dr',
                    City: 'Reston',
                    State: 'Virginia'
                },

                title: 'Revature HQ',
                description: 'Home of Salesforce'
            }
        ]);
        component.set('v.zoomLevel', 16);
    },
    
    top : function(component) {
        var props = component.get("c.top");
        props.setCallback(this, function(response) {
            if(response.getState() == "SUCCESS") {
                component.set("v.top", response.getReturnValue());
            }
        });
        $A.enqueueAction(props);
    },
    
    bot : function(component) {
        var props = component.get("c.bot");
        props.setCallback(this, function(response) {
            if(response.getState() == "SUCCESS") {
                component.set("v.bot", response.getReturnValue());
            }
        });
        $A.enqueueAction(props);
    }
})
