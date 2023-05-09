public class accounthandler {

    //Add by Nikhil Kumar -----ignore it just for testing
    /*Validation for Phone filed*/
     public void checkPhonefiled(list<account> triggernew,map<id,account> triggeroldmap){        
        for(account accvar:triggernew){
            if((accvar.phone==null && triggeroldmap==null) || (triggeroldmap!=null && accvar.Phone==null && accvar.phone!=triggeroldmap.get(accvar.id).phone)){
                accvar.adderror('Phone field is empty');
            }
         }
     }
     
    /*Avoid deleting child if any existing*/
    public void stopDeletaccount(map<id,account> triggeroldmap){
        
       map<id,account> accmap=new map<id,account>([select id,(select id from contacts) from account where id IN:triggeroldmap.keyset()]);
        
        for(account acc:accmap.values()){
            if(acc.contacts.size()>0){
                acc.adderror('You can\'t delete conatct bcz having assioacation with an account.');
            }
        } 
        
    }
    
    /****check duplicate account********/
    public void duplicateAccount(list<account> triggernew){
        
        set<string> nameset=new set<string>();
        for(account var:triggernew){
            nameset.add(var.name);
        }
        
        map<string,account> mapAcc=new map<string,account>();
        for(account acc:[select name from account where name IN:nameset]){
            mapAcc.put(acc.name,acc);
        }
        
        /*Method 1----------
        if(!nameset.isEmpty()){
         for(account var1:triggernew){
            for(string var2:nameset){
                if(var1.name==var2){
                    var1.addError('This is duplicate name You can\'t add this NAME');
                }
            }
          }      
        }
       -------------------*/
       
        /*Method 2----------*/
       if(!nameset.isEmpty()){
            for(account var1:triggernew){
                if(mapAcc.get(var1.name)!=null){
                   var1.addError('This is duplicate name You can\'t add this NAME'); 
                }
            }
        }          
    }
    
 @AuraEnabled

public static List<Account> displayAccounts()

{

List<Account> acclist=[select Id,Name from Account];

return acclist;

}

@AuraEnabled

public static List<Account> deleteAccRecord(String accId)

{

System.debug('AccountId'+accId);

Account acc=[select Id,Name from Account where Id=:accId];

delete acc;

return displayAccounts();

}
}