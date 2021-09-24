public class ContactsController {
    private String sortOrder = 'LastName';
    public List<Contact> contactList {get;set;}
    public ContactsController() {
        contactList = Database.query(
            'SELECT Id, FirstName, LastName, Phone, Email, MailingState ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC '
        );
    }
    public void getCAContacts() {
        contactList = [SELECT Id, FirstName, LastName, Phone, Email, MailingState
            			FROM Contact WHERE MailingState = 'CA'];
    }
/*    public List<Contact> getCAContacts() {
        List<Contact> CAresults = Database.query(
            'SELECT Id, FirstName, LastName, Phone, Email, MailingState ' +
            'FROM Contact ' + 'WHERE MailingState=CA ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return CAresults;
    }*/
}