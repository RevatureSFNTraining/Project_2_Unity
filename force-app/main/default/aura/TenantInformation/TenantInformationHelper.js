({
	helperMethod : function(component, event, helper) {
		let method = component.get("c.getTenantInfo");
       
        method.setCallback(this, function(response) {
        	if(response.getState() === "SUCCESS")
        	{
                let res = response.getReturnValue(); 
                 component.set("v.tenant", res);
                
                  console.log(res); 
        	}
        	else 
            {
                console.log("Failed with state: " + response.getState());
            }
        });
         
        
    	
    	$A.enqueueAction(method);
	}, 
    buttonHelper: function(component, event, helper)
    {
            component.set("v.clicked", true);

    }
})