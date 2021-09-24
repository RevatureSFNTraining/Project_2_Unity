public class LHMarketingListController {
    public integer totalRecs{get; set;}
    public integer OffsetSize=0;
    public integer LimitSize{get; set;} {LimitSize = 1;}
    public decimal numberBathrooms{get; set;} //{numberBathrooms = 10;}
    public integer numberBedrooms{get; set;} //{numberBedrooms = 10;}
    public integer rentFilter{get; set;} {rentFilter = 10000;}
    
    public LHMarketingListController(){
        totalRecs = [SELECT Count() FROM Property__c WHERE Include_in_Marketing__c = True];
    }
    
    public List<Property__c> getPropertyList(){
        numberBathrooms = Integer.valueOf(numberBathrooms);
        numberBedrooms = Integer.valueOf(numberBedrooms);
        rentFilter = Integer.valueOf(rentFilter);
        List<Property__c> prop = Database.Query('SELECT Name, Address__c, Zip_Code__c, Property_Manager__r.Name, Property_Manager__r.Email__c, Property_Manager__r.Phone__c, Property_Manager__r.Branch__r.Name, Desired_Rent__c, Picture__c, Bedrooms__c, Bathrooms__c ' +
                                            	'FROM Property__c WHERE Include_in_Marketing__c=True AND Bedrooms__c >= :numberBedrooms AND Bathrooms__c >= :numberBathrooms AND Desired_Rent__c <= :rentFilter ' +
                                                'ORDER BY Desired_Rent__c DESC LIMIT 1 OFFSET :OffsetSize');
        List<Property__c> matchProp = Database.Query('SELECT Name, Address__c, Zip_Code__c, Property_Manager__c, Desired_Rent__c, Picture__c, Bedrooms__c, Bathrooms__c ' + 
                                            		'FROM Property__c WHERE Include_in_Marketing__c=True AND Bedrooms__c >= :numberBedrooms AND Bathrooms__c >= :numberBathrooms AND Desired_Rent__c <= :rentFilter ');
        totalRecs = matchProp.Size();
        return prop;
    }
    
    public void previous() {
        OffsetSize = OffsetSize - 1;
    }
    
    public void next() {
        OffsetSize = OffsetSize + 1;
    }
    
    public boolean getdisabledPrev() {
		 if(OffsetSize>0)
             return false;
         else 
             return true;
    }
    
    public boolean getdisabledNext() {
        if(OffsetSize + 1 < totalRecs)
            return false;
        else
            return true;      
    }

}