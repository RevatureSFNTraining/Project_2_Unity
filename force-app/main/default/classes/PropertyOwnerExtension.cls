public without sharing class PropertyOwnerExtension {
    // public Account acct {get;set;}
    public String accName {get;set;}
    public PropertyOwnerExtension(ApexPages.StandardSetController stdCtrl) {
        // this.acct = (Account)stdController.getRecord();
    }
    
    public List<contact> getContacts() {
        String accName;
        List<Account> lstacc = new List<Account>();
        List<contact> lstcon = new List<contact>();
        Set<string> accIds = new set<string>();
        lstcon.clear();
        // accName.clear();
        accIds.clear();
        lstacc.clear();
        
        lstacc=[select id,name from Account where name=:accName];
        
        for(Integer i=0;i<lstacc.size();i++) {
            accIds.add(lstacc[i].Id);
        }
        
        lstcon =[select id,name,Phone, email,accountId from contact where accountid in : accIds];
        return lstcon;
    }
    
    public pagereference showContacts() {
        return null;        
    }
}