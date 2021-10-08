@isTest
public class TestControllerTest {
    @isTest static void singleTest(){
        Tenant__c ten = new Tenant__c(Name= 'Joe');
        insert ten;
        Case testCase = new Case();
        testCase.TenantId = ten.Id;
        testCase.Status = 'New';
        testCase.Origin = 'Web';
        testCase.Reason = 'Installation';
        testCase.Subject = 'Test';
        testCase.Description = 'Test';
        
        Test.startTest();
        insert testCase;
        Case cas = TestController.saveCase('Joe', 'New', 'Web', 'Test', 'Test', 'Installation');
        System.assertEquals(testCase.Status, 'New');
        System.assertEquals(testCase.Origin, 'Web');
        System.assertEquals(testCase.Reason, 'Installation');
        System.assertEquals(testCase.Subject, 'Test');
        System.assertEquals(testCase.Description, 'Test');
}
}