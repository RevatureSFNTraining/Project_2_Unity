@isTest
public class homePageTest {
    private Property__c prop1;
    private Property__c prop2;
    @TestSetup
    static void makeData(){
        prop1 = new Property__c(Desired_Rent__c = 5000, Picture__c = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nbcnews.com%2Fnews%2Fus-news%2Fcouple-planned-wedding-florida-mansion-no-one-told-owner-n1264962&psig=AOvVaw27Q_DVHoZhm3UOXvhigzwg&ust=1633615699451000&source=images&cd=vfe&ved=2ahUKEwj49_7s-rXzAhUZOc0KHfaLA5sQjRx6BAgAEAk', Name = 'Expensive Property');
        prop2 = new Property__c(Desired_Rent__c = 100, Picture__c = 'https://www.google.com/imgres?imgurl=https%3A%2F%2Frentpath-res.cloudinary.com%2Fw_336%2Ch_280%2Ct_rp%2Ccs_tinysrgb%2Cfl_force_strip%2Cc_fill%2Fe_unsharp_mask%3A50%2Cq_auto%2F0fb79addb779d91efd89375e805613a0&imgrefurl=https%3A%2F%2Fwww.apartmentguide.com%2Fapartments%2FNew-York%2FPeru%2F&tbnid=1WJDEIoVkl2POM&vet=12ahUKEwiZtamF-7XzAhUG66wKHeU4A0kQMygCegUIARDOAQ..i&docid=llequstHyeY_TM&w=336&h=280&q=apartment&ved=2ahUKEwiZtamF-7XzAhUG66wKHeU4A0kQMygCegUIARDOAQ', Name = 'Cheap Property');
        List<Property__c> props = new List<Property__c>();
        props.add(prop1);
        props.add(prop2);
        insert props;
    }

    @isTest
    public static void testProps(){
        List<Property__c> high = homePage.top();
        List<Property__c> low = homePage.bot();
        system.assertEquals(prop1, high[0]);
        system.assertEquals(prop2, low[0]);
    }
}
