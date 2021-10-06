/*
*Name: TenantInformationHelper.js
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 10/5/2021
*Description: 
*	Helper methods that hold the logic for the methods in the tenantInformationController
*   that retrieves data about tenant
*/
({
    helperMethod : function(component, event, helper) {
        // use method in apex controller
        let method = component.get("c.getTenantInfo");
        
        // setcallback for apex method
        method.setCallback(this, function(response) 
                           {
                               // check response
                               // if success set tenant info to return value of apex method
                               if(response.getState() === "SUCCESS")
                               {
                                   let res = response.getReturnValue(); 
                                   component.set("v.tenant", res);
                               } // end of if
                               else 
                               {
                                   // if failed response console log state
                                   console.log("Failed with state: " + response.getState());
                               } // end of else
                           }); // end of setCallback
        
        // enqueue Action to run
        $A.enqueueAction(method);
    }, 
    // sets clicked to true for edit button being clicked 
    buttonHelper: function(component, event, helper)
    {
        component.set("v.clicked", true);
        
    }
})