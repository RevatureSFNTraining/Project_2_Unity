/*
*Name: TenantController.apxc
*Author: Julia Weakley
*DateCreated: 9/26/2021
*DateModified: 10/5/2021
*Description: 
*	Tests for 
*	Tests cover 
*/



public class TenantController {

    
   // retrieve tenant associated with user 
   // written by Canbin Mei
    @AuraEnabled
    public static Tenant__c getTenantInfo() 
    {
        
        try {
            // Query for the fields from Tenant__c where the owner's id = current user's id.
            List<Tenant__c> tList = [SELECT Name, Email__c, Primary_Phone__c,  Id 
                                     FROM Tenant__c 
                                     WHERE User__c = :UserInfo.getUserId()];
            
         	// retun tenant found  
            return tList[0];
        } // end of try
        catch(Exception e) 
        {
            System.debug('There is no result return from the query.');
            return null;
        } // end of catch
        
    } // end of getTenantinfo
    
    // retrieves lease associated with tenant amd user
    // written by Canbin Mei, edited by Julia Weakley
   @AuraEnabled
    public static Lease_Agreement__c getLeaseAgreementInfo() 
    {
        // query for lease associated with tenant attached to current user
        List<Tenant__c> tList = [SELECT id,Lease_Agreement__r.id, Lease_Agreement__r.Name, Lease_Agreement__r.Start_Date__c, Lease_Agreement__r.End_Date__c, Lease_Agreement__r.Monthly_Rent_Due__c
                                 FROM Tenant__c 
                                 WHERE User__c = :UserInfo.getUserId()];
        // if nothing is in list return null
       if(tList.size() ==0)
       {
           return null; 
       } // end of if 
        
        // if there is something in list of tenants grab lease
        Lease_Agreement__c lease = new Lease_Agreement__c(id= tList[0].Lease_Agreement__r.id, Name=  tList[0].Lease_Agreement__r.Name, Start_Date__c=  tList[0].Lease_Agreement__r.Start_Date__c, End_Date__c=  tList[0].Lease_Agreement__r.End_Date__c, Monthly_Rent_Due__c = tList[0].Lease_Agreement__r.Monthly_Rent_Due__c ); 
      
        // return lease
        return lease;   
    } // end of getLeaseAgreementInfo
    
    // retrieves property associated with lease, tenant, and user 
    @AuraEnabled
    public static Property__c getPropInfo() 
    {
        // query for tenant information associated with user
        List<Tenant__c> tList = [SELECT id, Property__r.Id
                                 FROM Tenant__c 
                                 WHERE User__c = :UserInfo.getUserId()];
       // if nothing was found return null
       if(tList.size() == 0)
       {
           return null; 
       } // end of if
        
        // if tenant was found grab associated property
        Property__c np = new Property__c(id= tList[0].Property__r.Id);
        
        // return property found 
        return np; 
    } // end of getPropInfo 
} // end of TenantController