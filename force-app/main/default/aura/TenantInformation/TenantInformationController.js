({
	doInit: function(component, event, helper) 
    {
		helper.helperMethod(component, event, helper); 
	},
    handleClick: function (component, event, helper)
    {
    	console.log("Clicked");
        helper.buttonHelper(component, event, helper);
	},
    
    handleExit: function (component, event, helper)
    {
    	 component.set("v.clicked", false);
	},
    onSubmit:function (component, event, helper)
    {
    	console.log("Submitted");
         component.set("v.clicked", false);
	},
    
   
   
})