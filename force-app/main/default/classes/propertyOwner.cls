public class propertyOwner {
	@AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Name, Phone from Account LIMIT 20];
    }
}