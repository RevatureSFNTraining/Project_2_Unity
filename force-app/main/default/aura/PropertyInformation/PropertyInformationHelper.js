/*
*Name: PropertyInformationHelper.js
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 10/5/2021
*Description: 
*	Methods that contain logic for the Methods that retrieve information on property associated with current user
*	in the controller 
*/
({
    // sets prop attribute to property object containing all information on the property associated with the user
    propSetUp : function(component, event, helper) 
    {
        // apex controller method for retrieving data
        let method = component.get("c.getPropInfo");
        
        // create callback for apex method
        method.setCallback(this, function(response) 
                           {
                               // if response is successful set prop to the return value of apex method
                               if(response.getState() === "SUCCESS")
                               {
                                   let res = response.getReturnValue(); 
                                   component.set("v.prop", res);
                               } // end of if
                               else 
                               {
                                   console.log("Failed with state: " + response.getState());
                               } // end of else
                           }); // end of callback 
        
        // enqueue apex method so it will run
        $A.enqueueAction(method);
    }                       
})