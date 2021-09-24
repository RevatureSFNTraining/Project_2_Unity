public class MNMaintenanceRequestController {
    public Date PrefDateStart {get;set;}
    public Date PrefDateEnd {get;set;}    
    public List <Maintenance_Request__c> mRList {get;set;}
    public List <Maintenance_Request__c> vQList {get;set;}
    Boolean isMatch = true;
    public MNMaintenanceRequestController() {
        mRList = [SELECT Name, Maintenance_Type__c, Preferred_Date_of_Service__c, Job_Scheduled__c, (SELECT Name, Hourly_Rate__c FROM Vendor_Quotes__r) FROM Maintenance_Request__c];
    }
    
    public void SearchByDateRange() {

        mRList = [SELECT Name, Maintenance_Type__c, Preferred_Date_of_Service__c, Job_Scheduled__c, (SELECT Name, Hourly_Rate__c FROM Vendor_Quotes__r) FROM Maintenance_Request__c 
                  WHERE Preferred_Date_of_Service__c >= :PrefDateStart AND Preferred_Date_of_Service__c <= :PrefDateEnd];

    }
    
    public void SearchByJobsNotScheduled(){
        mRList = [SELECT Name, Maintenance_Type__c, Preferred_Date_of_Service__c, Job_Scheduled__c, (SELECT Name, Hourly_Rate__c FROM Vendor_Quotes__r) FROM Maintenance_Request__c 
                  WHERE Job_Scheduled__c = false]; 
    }
    public void SearchByJobsScheduled(){
        mRList = [SELECT Name, Maintenance_Type__c, Preferred_Date_of_Service__c, Job_Scheduled__c, (SELECT Name, Hourly_Rate__c FROM Vendor_Quotes__r) FROM Maintenance_Request__c 
                  WHERE Job_Scheduled__c = true]; 
    }
    public void ResetSearch(){
        mRList = [SELECT Name, Maintenance_Type__c, Preferred_Date_of_Service__c, Job_Scheduled__c, (SELECT Name, Hourly_Rate__c FROM Vendor_Quotes__r) FROM Maintenance_Request__c];
    }
}