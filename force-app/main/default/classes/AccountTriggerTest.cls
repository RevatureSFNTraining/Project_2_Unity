@isTest
private class AccountTriggerTest {
    @isTest static void singleTest(){
        Account a = new Account(name='Test');
        Test.startTest();
        Database.insert(a, false);
 		Test.stopTest();
        
        List<Management_Contract__C> Contracts = [SELECT Id FROM Management_Contract__c WHERE Account__r.Name = 'Test'];
        System.assert(Contracts.size()==1);  
   }
    
    @isTest static void negativeTest(){
        Account a = new Account(Name='Test');
        Management_Contract__c mc = new Management_Contract__c(Name='Test contract', Branch__c = 'a065f000000g9N5AAI',
                                                               Account__c = a.Id);
        Test.startTest();
        Database.insert(a, false);
 		Test.stopTest();
        
        List<Management_Contract__c> Contracts = [SELECT Id FROM Management_Contract__c WHERE Account__r.Name = 'Test'];
        System.assert(Contracts.size()==1);
    }
    
    @isTest static void bulkTest(){
        
        List <Account> testAccounts = new List <Account>();
        for(Integer i = 0; i<200; i++){
            testAccounts.add(new Account(Name='Test Account ' + i));
        }
        
        Test.startTest();
        Database.insert(testAccounts, false);
 		Test.stopTest();
        
        List<Management_Contract__c> newContracts = [SELECT Id FROM Management_Contract__c WHERE Account__r.Name LIKE 'Test Account%']; 
        
        System.assert(newContracts.size()==200);
       
        
    } 
}