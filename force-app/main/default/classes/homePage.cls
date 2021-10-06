public class homePage {
	@AuraEnabled
    public static List<Property__c> top() {
        return [SELECT Desired_Rent__c, Picture__c, Name FROM Property__c ORDER BY Desired_Rent__c DESC NULLS LAST LIMIT 1];
    }
    
    @AuraEnabled
    public static List<Property__c> bot() {
        return [SELECT Desired_Rent__c, Picture__c, Name FROM Property__c ORDER BY Desired_Rent__c ASC NULLS LAST LIMIT 1];
    }
}