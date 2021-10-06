({
	doInit : function(component, event, helper) {
		   let method = component.get("c.getPropInfo");
       
        method.setCallback(this, function(response) {
        	if(response.getState() === "SUCCESS")
        	{
                let res = response.getReturnValue(); 
                 component.set("v.prop", res);
            	console.log(res); 
        	}
        	else 
            {
                console.log("Failed with state: " + response.getState());
            }
        });
         
    	
    	$A.enqueueAction(method);
    }
                           
})
