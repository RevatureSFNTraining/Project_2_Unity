public class TenantFormController {
	@AuraEnabled
    public static Case saveExample (String status, String orig, String description, String subject, String reason) {
        Case cas = new Case();
        cas.Reason = reason;
        cas.Subject = subject;
        cas.Description = description;
        cas.Status = status;
        cas.Origin = orig;
        insert cas;
        return cas;
    }
}