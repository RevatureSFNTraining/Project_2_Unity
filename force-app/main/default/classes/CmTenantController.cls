public class CmTenantController {
    
    // UserId: 0055f000002S8PMAA0
    public static Tenant__C getTenantInfo() {
        
        try {
            // Query for the fields from Tenant__c where the owner's id = current user's id.
            List<Tenant__c> tList = [SELECT Name, Email__c, Primary_Phone__c, Id 
                                     FROM Tenant__c 
                                     WHERE User__c = :UserInfo.getUserId()];
            return tList[0];
        } catch(Exception e) {
            System.debug('There is no result return from the query.');
            return null;
        }
        
    }
    
    // SELECT Tenant__c.Name, Tenant__c.Lease_Agreement__r.Name FROM Tenant__c WHERE User__c = '0055f000002S8PMAA0'
    public static List<Tenant__c> getLeaseAgreementInfo() {
        List<Tenant__c> tList = [SELECT  
                                 Tenant__c.Lease_Agreement__r.Name, 
                                 Tenant__c.Lease_Agreement__r.Start_Date__c, 
                                 Tenant__c.Lease_Agreement__r.End_Date__c, 
                                 Tenant__c.Lease_Agreement__r.Monthly_Rent_Due__c, 
                                 Tenant__c.Lease_Agreement__r.Security_Deposit__c
                                 FROM Tenant__c 
                                 WHERE User__c = :UserInfo.getUserId()];
        return tList;   
    }
    
}