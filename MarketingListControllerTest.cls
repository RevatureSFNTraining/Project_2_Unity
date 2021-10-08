@isTest
public class MarketingListControllerTest {
    @isTest static void singleTest(){
        //Creating test data
        Property__c prop = new Property__c();
        prop.Name = '123 Test'
        p.Address__c = '123 Test St';
        p.Bedrooms__c = 2;
        p.Bathrooms__c = 1;
        p.Desired_Rent__c = 1000;
        p.Zip_Code__c = '12345';
        p.Include_in_Marketing__c = True;
        Test.startTest();
        insert e;
        List<Property__c> pl = MarketingListController.getProperty(0, 1, 1, 100);
        Test.stopTest();
        System.assertEquals(1, pl.size());
    }
}