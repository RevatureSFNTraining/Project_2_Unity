@isTest
public class propertyOwnerTest {
    private static List<Account> newAccs;

    @TestSetup
    static void makeData(){
        Account acc1 = new Account(name = 'John Smith', phone = '111-111-1111');
        Account acc2 = new Account(name = 'Jane Smith', phone = '111-111-1112');
        Account acc3 = new Account(name = 'Jack Smith', phone = '111-111-1113');
        newAccs = new List<Account>();
        newAccs.add(acc1);
        newAccs.add(acc2);
        newAccs.add(acc3);
        insert newAccs;
    }

    @isTest
    public static void testList() {
        List<Account> testAccs = propertyOwner.getAccounts();
        for (Integer i = 0; i < newAccs.size(); i++) {
            system.assertEquals(newAccs[i], testAccs[i]);
        }
    }
}