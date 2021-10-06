public class MarketingListController {
    @AuraEnabled
    public static List<Property__c> getProperty(Integer setsize, Integer numBathrooms, Integer numBedrooms, Integer maxRent) {
        String query = 'SELECT Name, Address__c, Zip_Code__c, Property_Manager__r.Name, Property_Manager__r.Email__c, Property_Manager__r.Phone__c, Property_Manager__r.Branch__r.Name, Desired_Rent__c, Picture__c, Bedrooms__c, Bathrooms__c FROM Property__c WHERE Include_in_Marketing__c = True AND Bathrooms__c >= ' + numBathrooms + ' AND Bedrooms__c >= ' + numBedrooms;
        if (maxRent != null && maxRent <= 0)
            query += ' AND Desired_Rent__c <= ' + maxRent;
        query += ' LIMIT 1 OFFSET ' + setsize;
        System.debug(query);
        List<Property__c> displayProp = Database.query(query);
        return displayProp;
    }
}