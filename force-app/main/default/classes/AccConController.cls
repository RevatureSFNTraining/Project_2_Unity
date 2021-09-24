public class AccConController {
    public List<Account> getAccounts() {
        List<Account> results =
            [SELECT Id, Name, (SELECT Name, Email FROM Contacts)
             FROM Account];
        return results;
    }
    
}