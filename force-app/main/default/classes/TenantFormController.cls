public class TenantFormController {
	@AuraEnabled
    //Inserting case to Org 
    public static Case saveCase (String name, String description, String subject, String reason) {
        Case cas = new Case();
        cas.tenantId = name;
        cas.Reason = reason;
        cas.Subject = subject;
        cas.Description = description;
        cas.Status = 'New';
        cas.Origin = 'Web';
        insert cas;
        return cas;
    }
}