({
	doInit : function(component, event, helper) {
		let method = component.get("c.getLeaseAgreementInfo");
       
        method.setCallback(this, function(response) {
        	if(response.getState() === "SUCCESS")
        	{
                let res = response.getReturnValue(); 
                 component.set("v.lease", res);
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
