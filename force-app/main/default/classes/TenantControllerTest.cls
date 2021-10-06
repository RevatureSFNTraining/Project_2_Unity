/*
*Name: TenantControllerTest.apxc
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 9/30/2021
*Description: 
*	Tests for 
*	Tests cover 
*/
@isTest
public class TenantControllerTest {
    
    
    @isTest static void Test1() {
        // Perform test
        Test.startTest();
        Tenant__c t = TenantController.getTenantInfo();
        Test.stopTest();
        // Verify
        System.assertEquals(null, t);        
    }
    
    @isTest static void Test2() {
        // Perform test
        Test.startTest();
        Lease_Agreement__c tList = TenantController.getLeaseAgreementInfo();
        Test.stopTest();
        // Verify
        System.assertEquals(null, tList);    
    }
    @isTest static void Test3() {
        Lease_Agreement__c temp = new Lease_Agreement__c(); 
        temp.Name = 'Test';
        temp.Monthly_Rent_Due__c = 200; 
        
        temp.Security_Deposit__c = 1000;
        temp.Signed_By_Tenant__c = false; 
        temp.Start_Date__c = System.today();
        temp.End_Date__c = System.today() +100 ;
       
       
        	insert temp;
        	
         
     	
        Lease_Agreement__c tList = TenantController.getLeaseAgreementInfo();
              // Verify
        System.assertEquals(null, tList);  

    }
     @isTest static void Test4() {
        // Perform test
        Test.startTest();
        Property__c prop = TenantController.getPropInfo();
        Test.stopTest();
        // Verify
        System.assertEquals(null, prop);    
    }
}