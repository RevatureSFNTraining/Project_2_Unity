/*
*Name: LeaseInformationHelper.js
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 10/5/2021
*Description: 
*	Helper methods that hold the logic for the methods in the leaseInformationController
*   that retrieves data about lease
*/
({
    // helper method to retrieve information on lease agreement 
	leaseSetUp : function(component, event, helper) 
    {
        // apex method from tenant controller 
		let method = component.get("c.getLeaseAgreementInfo");
       
        // create callback for apex method
        method.setCallback(this, function(response) 
        {
            // if success set lease attribute in view to apex method return value
        	if(response.getState() === "SUCCESS")
        	{
                let res = response.getReturnValue(); 
                 component.set("v.lease", res);
            	console.log(res); 
        	} // end of if
        	else 
            {
                // is fail console log state of response
                console.log("Failed with state: " + response.getState());
            } // end of else
        }); // end of callback
         
    	// enqueue Action method for it to run
    	$A.enqueueAction(method);
	}
})