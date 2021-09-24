public class PropertyManagerTriggerHandler {
	
    public static void checkproperties(List<property_manager__c> prop){
        List<property_manager__c> prop_mgrs = [SELECT Id from Property_Manager__c
                                               WHERE Id IN (Select Property_Manager__c FROM Property__c)
                                               AND Id IN :prop];
        for (property_manager__c mgr: prop_mgrs) {
            Trigger.oldMap.get(mgr.Id).addError(
            	'There are properties assigned to this property manager. Please re-assign before deleting');
        }
            
    }
    
}