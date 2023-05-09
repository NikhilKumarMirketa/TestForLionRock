public class accountRecordShow{
    
    @AuraEnabled
    public static list<account> rerieveAccount(){
        
        list<account> acclist=new list<account>();        
        acclist=[select id,Is_Important__c,Name,Type,Industry from account];
        
        if(!(acclist.isEmpty())){
            return acclist;
        }else{
            return null;
        }
        
    }

}