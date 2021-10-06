/*
*Name: TenantInformationController.js
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 10/5/2021
*Description: 
*	Methods to get data about tenant
*/
({
    // initialize tenant__c object
    // grabs tenant information including primary phone, email, and Name
	doInit: function(component, event, helper) 
    {
		helper.helperMethod(component, event, helper); 
	},
    // sets clicked to true for edit button being clicked 
    handleClick: function (component, event, helper)
    {
    	
        helper.buttonHelper(component, event, helper);
	},
    // Sets clicked to false for edit button not being clicked
    // or user has clicked quit in edit view
    handleExit: function (component, event, helper)
    {
    	 component.set("v.clicked", false);
	},
    // Sets clicked to false for edits being submitted
    onSubmit:function (component, event, helper)
    {
         component.set("v.clicked", false);
	},
})