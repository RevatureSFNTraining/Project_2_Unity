/*
*Name: TenantControllerTest.apxc
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 9/30/2021
*Description: 
*	Tests for TenantController
*	Tests covers 100% 
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
    
  @isTest static void Test5() {
       // create temporary user 
        Profile p =  [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'testuser', Email = 'testuser@fake.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
         LocaleSidKey='en_US', ProfileId = p.Id,
         TimeZoneSidKey='America/Los_Angeles', UserName='Tenanttestuser@faketest.com');

        System.runAs(u)
        {
            Tenant__c ten = new Tenant__c(); 
            ten.Name = 'test'; 
            ten.Email__c ='fake@fake.com'; 
            ten.Primary_Phone__c ='9145083456'; 
            Lease_Agreement__c lease = new Lease_Agreement__c(); 
            
            insert lease; 
            
           	ten.Lease_Agreement__c = lease.Id; 
             ten.User__c = u.Id; 
            insert ten; 
             
            Tenant__c t = TenantController.getTenantInfo();
             System.assertNotEquals(null, t); 
        }// end of user run 
    } // end of test
      @isTest static void leaseWithUser() {
       // create temporary user 
        Profile p =  [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'testuser', Email = 'testuser@fake.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
         LocaleSidKey='en_US', ProfileId = p.Id,
         TimeZoneSidKey='America/Los_Angeles', UserName='Tenanttestuser@faketest.com');

        System.runAs(u)
        {
            Tenant__c ten = new Tenant__c(); 
            ten.Name = 'test'; 
            ten.Email__c ='fake@fake.com'; 
            ten.Primary_Phone__c ='9145083456'; 
            Lease_Agreement__c lease = new Lease_Agreement__c(Name ='test'); 
            
            insert lease; 
            
           	ten.Lease_Agreement__c = lease.Id; 
             ten.User__c = u.Id; 
            insert ten; 
             
            Lease_Agreement__c tList = TenantController.getLeaseAgreementInfo();
              // Verify
        	System.assertEquals('test', tList.Name);  
        }// end of user 
    }// end of test  
    
      @isTest static void propWithUser() {
       // create temporary user 
        Profile p =  [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'testuser', Email = 'testuser@fake.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
         LocaleSidKey='en_US', ProfileId = p.Id,
         TimeZoneSidKey='America/Los_Angeles', UserName='Tenanttestuser@faketest.com');

        System.runAs(u)
        {
            Tenant__c ten = new Tenant__c(); 
            ten.Name = 'test'; 
            ten.Email__c ='fake@fake.com'; 
            ten.Primary_Phone__c ='9145083456'; 
            Lease_Agreement__c lease = new Lease_Agreement__c(Name ='test'); 
            
            insert lease; 
            
           	ten.Lease_Agreement__c = lease.Id; 
             ten.User__c = u.Id; 
            insert ten; 
             
           Property__c prop = TenantController.getPropInfo();
      
        // Verify
        System.assertEquals(null, prop);    
        }// end of user 
    }// end of test  
}