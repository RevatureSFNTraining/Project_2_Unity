public class AccountTriggerHandler {
    public static void addManagementContract(List <Account> newaccounts){
        //Check for existing contract
        List <Management_Contract__c> contractList = new List<Management_Contract__C>();
            
        List<Account> NeedContract = [SELECT Id, Name FROM Account
             						  WHERE Id IN :newaccounts AND
             						  Id NOT IN (SELECT Account__c FROM Management_Contract__c)];
        for (Account acc : NeedContract) {
            contractList.add(new Management_Contract__C(
                						Name = acc.Name + ' Contract - ' + System.Today().Year(),
                						Account__c = acc.id, Branch__c = 'a065f000000g9N5AAI'));
            }  
        if (contractList.size() > 0) {
            insert contractList;
        }    
    }
}