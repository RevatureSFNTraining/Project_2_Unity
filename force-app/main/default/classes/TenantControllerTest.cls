/*
*Name: TenantControllerTest.apxc
*Author: Julia Weakley
*DateCreated: 9/27/2021
*DateModified: 10/5/2021
*Description: 
*	Tests for Tenant Controller
*	Test coverage 100%
*/
@isTest
public class TenantControllerTest {
    
    // Since there is no Tenant added to database null should have been returned
    @isTest 
    static void tenantNullTest() 
    {
        // Perform test
        Test.startTest();
        
        // retrieve tenant information in database with method being tested
        Tenant__c t = TenantController.getTenantInfo();
        
        // stop test
        Test.stopTest();
        
        // Verify null
        System.assertEquals(null, t);        
    } // end of test tenantNullTest
    
    // 
    @isTest 
    static void leaseNullTest() 
    {
        // Perform test
        Test.startTest();
        
        // retrieve lease from database with method being tested 
        Lease_Agreement__c tList = TenantController.getLeaseAgreementInfo();
        
        // stop test
        Test.stopTest();
        
        // Verify null
        System.assertEquals(null, tList);    
    } // end of test  leaseNullTest
    
   
    // Null should be returned since no relationship to tenant was established 
    @isTest 
    static void LeaseNoTenantTest() 
    {
        // create lease record for testing
        Lease_Agreement__c temp = new Lease_Agreement__c(); 
        temp.Name = 'Test';
        temp.Monthly_Rent_Due__c = 200; 
        temp.Security_Deposit__c = 1000;
        temp.Signed_By_Tenant__c = false; 
        temp.Start_Date__c = System.today();
        temp.End_Date__c = System.today() +100 ;
       
        // create property associated with lease
        Property__c prop = new Property__c(Name='leaseProperty');
		
        // insert property
        insert prop;
        
        temp.Property__c = prop.Id; 
        
       	// insert new lease
        insert temp;

        // retrieve lease found by tenant method
        Lease_Agreement__c tList = TenantController.getLeaseAgreementInfo();
        
        // Verify null
        System.assertEquals(null, tList);  

    } // end of test LeaseNoTenantTest
    
    // Null should be returned since there are no properties in database
    @isTest 
    static void propNullTest() 
    {
        // Perform test
        Test.startTest();
        
        // Retireve propertu from tenant Method
        Property__c prop = TenantController.getPropInfo();
        
        // stop test
        Test.stopTest();
        
        // Verify null
        System.assertEquals(null, prop);    
    } // end of propNullTest
  
    // should get tenant created back since there is an associated user 
  @isTest 
  static void tenantWithUserTest() 
  {
       // create temporary user 
        Profile p =  [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'testuser', Email = 'testinguser@testfake.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles', UserName='Tenanttestinguser@faketest.com');

      	// run test as newly created user
        System.runAs(u)
        {
            // create test tenant
           Tenant__c ten = new Tenant__c(); 
            ten.Name = 'test'; 
            ten.Email__c ='fake@fake.com'; 
            ten.Primary_Phone__c ='9145083456'; 
            // create lease test
            Lease_Agreement__c lease = new Lease_Agreement__c(Name ='test'); 
            
            // create Property
            Property__c testp = new Property__c(Name='nes'); 
            
            // insert property
            insert testp; 
            
            lease.Property__c = testp.Id; 
            
            //insert lease
            insert lease; 
            
          	// associate lease and user to tenant
           	ten.Lease_Agreement__c = lease.Id; 
            ten.User__c = u.Id; 
            
            // insert test tenant
            insert ten; 
     
            // retrieve tenant information associated with current user
            Tenant__c t = TenantController.getTenantInfo();
            
            // verify 
            System.assertEquals('test', t.Name); 
        }// end of user run 
    } // end of test
    
    
    
    // should retrieve lease since there is a user associated with the tenant that holds that lease
      @isTest 
      static void leaseWithUser() 
    {
       // create temporary user 
        Profile p =  [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'testuser', Email = 'testuser@fake.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
         LocaleSidKey='en_US', ProfileId = p.Id,
         TimeZoneSidKey='America/Los_Angeles', UserName='Tenanttestuser@faketest.com');

        // run test as new user
        System.runAs(u)
        {
            // create test tenant
            Tenant__c ten = new Tenant__c(); 
            ten.Name = 'test'; 
            ten.Email__c ='fake@fake.com'; 
            ten.Primary_Phone__c ='9145083456'; 
          	// create lease 
            Lease_Agreement__c lease = new Lease_Agreement__c(Name ='test'); 
          
            // create Property
            Property__c testp = new Property__c(Name='nes'); 
            
            // insert property
            insert testp; 
            
            lease.Property__c = testp.Id; 
            
            //insert lease
            insert lease; 
            
            // associate lease and user with tenant
           	ten.Lease_Agreement__c = lease.Id; 
             ten.User__c = u.Id; 
            
            //insert ten 
            insert ten; 
             
            //Retrieve lease
            Lease_Agreement__c tList = TenantController.getLeaseAgreementInfo();
             
            // Verify that names match
        	System.assertEquals('test', tList.Name);  
        }// end of user 
    }// end of test  
    
    // should retrieve property since there is a related tenant and user 
      @isTest 
    static void propWithUser() 
    {
       // create temporary user 
        Profile p =  [SELECT Id FROM Profile WHERE Name='Standard User'];   
        User u = new User(Alias = 'testuser', Email = 'testuser@fake.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
         LocaleSidKey='en_US', ProfileId = p.Id,
         TimeZoneSidKey='America/Los_Angeles', UserName='Tenanttestuser@faketest.com');

        // run tests as temporary user
        System.runAs(u)
        {
            // create tenant
            Tenant__c ten = new Tenant__c(); 
            ten.Name = 'test'; 
            ten.Email__c ='fake@fake.com'; 
            ten.Primary_Phone__c ='9145083456'; 
           // create  associated lease
            Lease_Agreement__c lease = new Lease_Agreement__c(Name ='test'); 
            
            // create Property
            Property__c testp = new Property__c(Name='nes'); 
            
            // insert property
            insert testp; 
            
            lease.Property__c = testp.Id; 
            
            // insert lease
            insert lease; 
            
            // create property
            Property__c tempProp = new Property__c(); 
            
            // insert property
            insert tempProp;
            
            //associate property, lease, and user with tenant
           	ten.Property__c = tempProp.Id; 
           	ten.Lease_Agreement__c = lease.Id; 
             ten.User__c = u.Id; 
            
            // insert tenant
            insert ten; 
            
            // retrieve property information
           Property__c prop = TenantController.getPropInfo();
      
        // Verify that id matches 
        System.assertEquals(tempProp.id, prop.id);    
        }// end of user 
    }// end of test  propWithUser
} // end of test class