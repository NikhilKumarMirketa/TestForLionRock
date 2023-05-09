public class accountRecordShow1{
    
    @AuraEnabled
    public static list<account> rerieveAccount(){
        
        list<account> acclist=new list<account>();       
        acclist=[select id,Active__c,Name,Type,Industry,Is_Important__c from account];
        
        if(!(acclist.isEmpty())){
            return acclist;
        }else{
            return null;
        }
        
    }

}