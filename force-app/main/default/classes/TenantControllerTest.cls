@isTest
private class CmTenantControllerTest {
    
    @isTest static void Test1() {
        // Perform test
        Test.startTest();
        Tenant__c t = CmTenantController.getTenantInfo();
        Test.stopTest();
        // Verify
        System.assertEquals(null, t);        
    }
    
    @isTest static void Test2() {
		// Perform test
        Test.startTest();
        List<Tenant__c> tList = CmTenantController.getLeaseAgreementInfo();
        Test.stopTest();
        // Verify
        System.assertEquals(0, tList.size());    
    }

}