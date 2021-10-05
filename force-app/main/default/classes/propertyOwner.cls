public class propertyOwner {
	@AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Name, Phone FROM Account LIMIT 20];
    }
}