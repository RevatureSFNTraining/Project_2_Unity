public class MaintenanceVendorAuraController {

    @AuraEnabled
    public static List<String> getSpecialties(){
        try {
            List<String> specialties = new List<String>();
            List<Schema.PicklistEntry> entries = Vendor__c.Specialty__c.getDescribe().getPicklistValues();
            for (Schema.PicklistEntry entry : entries) {
                specialties.add(entry.getValue());
            }
            return specialties;
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Integer getVendorCount(string specialty){
        try {
            string query = 'SELECT COUNT() FROM Vendor__c';
            if (specialty != null && !specialty.equals(''))
                query += ' WHERE Specialty__c = \'' + specialty + '\'';
            return Database.countQuery(query);
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Vendor__c> getVendorList(string specialty, string orderByField, integer limitRecords, integer offset){
        try {
            string query = 'SELECT Id, Name, Specialty__c, Manager_Name__c, Branch__r.Name, Email__c, Primary_Phone__c FROM Vendor__c';
            if (specialty != null && !specialty.equals(''))
                query += ' WHERE Specialty__c = \'' + specialty + '\'';
            if (orderByField != null && !orderByField.equals(''))
                query += ' ORDER BY ' + orderByField + ' ASC';
            if (limitRecords != null && limitRecords > 0)
                query += ' LIMIT ' + limitRecords;
            if (offset != null && offset > 0)
                query += ' OFFSET ' + offset;
            return Database.query(query);
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }
}
