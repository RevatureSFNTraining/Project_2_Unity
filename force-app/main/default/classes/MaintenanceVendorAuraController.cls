public class MaintenanceVendorAuraController {

    @AuraEnabled
    public static List<Vendor__c> getVendorList(string specialty, string orderByField){
        try {
            string query = 'SELECT Id, Name, Specialty__c, Manager_Name__c, Branch__r.Name, Email__c, Primary_Phone__c FROM Vendor__c';
            if (specialty != null && !specialty.equals(''))
                query += ' WHERE Specialty__c = \'' + specialty + '\'';
            query += ' ORDER BY ' + orderByField + ' ASC LIMIT 8';
            System.debug(query);
            return Database.query(query);
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }
}
