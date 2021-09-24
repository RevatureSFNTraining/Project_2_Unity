@isTest
private class PropertyManagerTriggerTest {
    @isTest static void TestDeleteSingle(){
        
        // Insert single test property manager and single test property assigned to them
        Property_Manager__c mgr = new Property_Manager__c(Name='Testing');
        insert mgr;
        Property__c prop = new Property__c(Name='Test Property', Address__c='123 Example', City__c='Test', State__c='NC',
                                     Zip_Code__c='12345', Bedrooms__c=1, Bathrooms__c=1, Property_Manager__c= mgr.Id);
        insert prop;
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(mgr, false);
        Test.stopTest();

        // Verify that we got the correct error and that the delete was unsuccessful
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('There are properties assigned to this property manager. Please re-assign before deleting',
                             result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestDeleteBulk(){
        
        // Insert list of 200 test property managers
        List<Property_Manager__c> testmgrs = new List<Property_Manager__c>();
        List<Property__c> testprops = new List<Property__c>();
        for(Integer i = 0; i<200; i++){
            testmgrs.add(new Property_Manager__c(Name='Testing Manager' + i));
        }
        insert testmgrs;
        
        // Create and insert list of 200 test properties, each assigned to one of the 200 test managers
        for (property_manager__c mgr: testmgrs){
            testprops.add(new Property__c(Name='Test Property', Address__c='123 Example', City__c='Test', State__c='NC',
                                     Zip_Code__c='12345', Bedrooms__c=1, Bathrooms__c=1, Property_Manager__c= mgr.Id));
        }
        System.debug('Testmgrs: ' + testmgrs.size());
        System.debug('Testprops: ' + testprops.size());                     
        
        insert testprops;
        // Perform test
        Test.startTest();
        List <Database.DeleteResult> results = Database.delete(testmgrs, false);
        Test.stopTest();
            // Run loop to verify that each of the deletions has failed
        Integer numFailed = 0;
        for(Database.DeleteResult dr : results){
            if(dr.getErrors()[0].getMessage() == 'There are properties assigned to this property manager. Please re-assign before deleting'){
                numFailed +=1;
            }
        }
        System.assertEquals(200, numFailed);   

    }
    
    @isTest static void TestNegative(){
       
        // Insert property manager with no property assigned
        Property_Manager__c mgr = new Property_Manager__c(Name='Testing');
        insert mgr;
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(mgr, false);
        Test.stopTest();
        
        // Verify that the deletion was successful and no errors occurred
 		System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
    }
}