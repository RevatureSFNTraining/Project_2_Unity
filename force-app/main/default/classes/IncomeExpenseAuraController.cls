public class IncomeExpenseAuraController {
    @AuraEnabled
    public static List<Property__c> getProperties(){
        try {
            return [SELECT Id, Name, Address__c, City__c, State__c, Zip_Code__c FROM Property__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Lease_Agreement__c> getLeaseAgreements(String propertyId){
        try {
            String query = 'SELECT Name, Security_Deposit__c, Monthly_Rent_Due__c, Start_Date__c, End_Date__c FROM Lease_Agreement__c WHERE Approval_Status__c = \'Approved\'';
            if (propertyId != null && !propertyId.equals(''))
                query += ' AND Property__c = \'' + propertyId + '\'';
            return Database.query(query);
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Vendor_Quote__c> getQuotes(String propertyId){
        try {
            String query = 'SELECT Name, Hourly_Rate__c, Hours__c FROM Vendor_Quote__c WHERE Maintenance_Request__r.Job_Completed__c = TRUE';
            if (propertyId != null && !propertyId.equals(''))
                query += ' AND Maintenance_Request__r.Property__c = \'' + propertyId + '\'';
            return Database.query(query);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
