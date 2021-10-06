public class TenantFormController {
	@AuraEnabled
    public static Case saveCase (Id tenantId, String description, String subject, String reason) {
        Case cas = new Case();
        cas.Tenant__c = tenantId;
        cas.Reason = reason;
        cas.Subject = subject;
        cas.Description = description;
        cas.Status = 'New';
        cas.Origin = 'Web';
        insert cas;
        return cas;
    }
}