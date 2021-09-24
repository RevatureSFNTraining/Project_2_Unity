@isTest
private class MaintenanceRequestTriggerTest {
    
    /*@isTest static void SingleRequestTest(){
        
        Property__c testProperty = new Property__c(Name='Test Property', Address__c='123 Example', City__c='Test', State__c='NC',
                                     			   Zip_Code__c='12345', Bedrooms__c=1, Bathrooms__c=1);
        insert testProperty;
        Maintenance_Request__c testRequest = new Maintenance_Request__c(Name='Test Request', Maintenance_Type__c = 'Plumbing', 
                                                                        Description__c = 'Test', Property__c= testProperty.Id);
        insert testRequest;
        List<Vendor__c> testVendors = new List<Vendor__c>();
        
        for (Integer i = 0; i<10; i++){
            testVendors.add(new Vendor__c(Name='Test Vendor ' + i, Email__c = i + 'test@test.com'));
        }
        
        insert testVendors;
        testRequest.Approved__c = true;
        Test.StartTest();
        //EmailUtility.sendPlainTextEmail(new List<String>{'test@test.com'}, 'Unit Test X', 'Unit Test');
        Database.update(testRequest, false);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        //System.assertEquals(10, invocations, 'invocations actually' + invocations);
        System.assert(invocations >= 1);
    }
	
    @isTest static void NegativeTest(){
        
        Property__c testProperty = new Property__c(Name='Test Property', Address__c='123 Example', City__c='Test', State__c='NC',
                                     			   Zip_Code__c='12345', Bedrooms__c=1, Bathrooms__c=1);
        insert testProperty;
        Maintenance_Request__c testRequest = new Maintenance_Request__c(Name='Test Request', Maintenance_Type__c = 'Plumbing', 
                                                                        Description__c = 'Test', Property__c= testProperty.Id, Approved__c = false);
        List<Vendor__c> testVendors = new List<Vendor__c>();
        
        for (Integer i = 0; i<10; i++){
            testVendors.add(new Vendor__c(Name='Test Vendor ' + i, Email__c = i + 'test@test.com'));
        }
        
        insert testVendors;
        
        Test.StartTest();
        //EmailUtility.sendPlainTextEmail(new List<String>{'test@test.com'}, 'Unit Test X', 'Unit Test');
        Database.insert(testRequest, false);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        
        System.assertequals(0, invocations);
    }*/
}