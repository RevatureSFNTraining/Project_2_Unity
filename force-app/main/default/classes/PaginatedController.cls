public class PaginatedController {
	private integer totalRecs=0;
    private integer OffsetSize=0;
    public integer LimitSize{get; set;} {LimitSize = 2;}
    public PaginatedController(){
        totalRecs = [SELECT Count() FROM Contact];
    }
    
    public List<Contact> getConList(){
        List<Contact> con = Database.Query('SELECT FirstName, LastName, Phone, Email, MailingState ' + 
                                            'FROM Contact ORDER BY LastName LIMIT :LimitSize OFFSET :OffsetSize');
        return con;
    }
    
    public void FirstPage() {
        OffsetSize = 0;
    }
    
    public void previous() {
        OffsetSize = OffsetSize - LimitSize;
    }
    
    public void next() {
        OffsetSize = OffsetSize + LimitSize;
    }
    
    public void LastPage() {
        OffsetSize = totalrecs - math.mod(totalRecs, LimitSize);
    }
    
    public boolean getprev() {
        if(OffsetSize == 0)
            return true;
        else
            return false;
    }
    
    public boolean getnxt() {
        if((OffsetSize + LimitSize) > totalRecs)
            return true;
        else
            return false;      
    }
     
}