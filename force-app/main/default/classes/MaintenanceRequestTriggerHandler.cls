public class MaintenanceRequestTriggerHandler {
    
    /*public static void sendvendormail(List<Maintenance_Request__c> requests){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        list <Maintenance_Request__c> approvedRequests = [SELECT Id,Name,Maintenance_Type__c,Property__r.name,Description__c
                                                          FROM Maintenance_Request__c
                                                          WHERE Id IN :requests AND Vendor_Email_Sent__c = false
                                                          AND Approved__c = true];
        List<String> toAddresses = new list<String>();
        /*List<Vendor__c> vendoremails = [SELECT Name, Email__c FROM Vendor__c];
        for (Vendor__c v: vendoremails){
            toAddresses.add(v.email__c);
        }
        
        if (approvedRequests.size() > 0)
        	for (Maintenance_Request__c mr : approvedRequests){
            	mail.setToAddresses(toAddresses);
            	mail.setSubject('New Job Available. Type: ' + mr.Maintenance_Type__c + ' Property: ' + mr.Property__r.name);
            	mail.setPlainTextBody('Description of problem: ' + mr.Description__c + '. Please submit a quote including hours and hourly rate at your convenience.');
           		// mr.Vendor_Email_Sent__c = true;
        	}
        
        	Messaging.SendEmailResult[] results = Messaging.sendEmail( 
            	new Messaging.SingleEmailMessage[] {mail});
        
        	inspectResults(results);
            
	}*/
	
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email successfully sent');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        
        return sendResult; 
    
	}
    
}