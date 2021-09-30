public class TenantController {

    
    // UserId: 0055f000002S8PMAA0
    @AuraEnabled
    public static Tenant__c getTenantInfo() 
    {
        
        try {
            // Query for the fields from Tenant__c where the owner's id = current user's id.
            List<Tenant__c> tList = [SELECT Name, Email__c, Primary_Phone__c,  Id 
                                     FROM Tenant__c 
                                     WHERE User__c = :UserInfo.getUserId()];
            System.debug(tList[0].id);
            return tList[0];
        } 
        catch(Exception e) 
        {
            System.debug('There is no result return from the query.');
            return null;
        }
        
    }
    
    // SELECT Tenant__c.Name, Tenant__c.Lease_Agreement__r.Name FROM Tenant__c WHERE User__c = '0055f000002S8PMAA0'
   @AuraEnabled
    public static Lease_Agreement__c getLeaseAgreementInfo() 
    {
        List<Tenant__c> tList = [SELECT id,Lease_Agreement__r.id, Lease_Agreement__r.Name, Lease_Agreement__r.Start_Date__c, Lease_Agreement__r.End_Date__c, Lease_Agreement__r.Monthly_Rent_Due__c
                                 FROM Tenant__c 
                                 WHERE User__c = :UserInfo.getUserId()];
       
        Lease_Agreement__c lease = new Lease_Agreement__c(id= tList[0].Lease_Agreement__r.id, Name=  tList[0].Lease_Agreement__r.Name, Start_Date__c=  tList[0].Lease_Agreement__r.Start_Date__c, End_Date__c=  tList[0].Lease_Agreement__r.End_Date__c, Monthly_Rent_Due__c = tList[0].Lease_Agreement__r.Monthly_Rent_Due__c ); 
        return lease;   
    }
    
    @AuraEnabled
    public static Property__c getPropInfo() 
    {
        List<Tenant__c> tList = [SELECT id, Property__r.Id
                                 FROM Tenant__c 
                                 WHERE User__c = :UserInfo.getUserId()];
       
        Property__c np = new Property__c(id= tList[0].Property__r.Id);
        return np; 
    }
    

}