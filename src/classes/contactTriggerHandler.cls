public class contactTriggerHandler{
        
    public static void  checkRelatedParent(list<contact> triggerold){
       for(contact convar:triggerold){
            if(convar.accountId!=null){
                convar.adderror('Can not delete this because of assciated account');
            }            
        } 
    }
    public static void  ableToInsertDaliyOneContact(list<contact> triggernew,map<id,contact> triggeroldmap){
        
        set<id> accid=new set<id>();
        
        for(contact con:triggernew){
           accid.add(con.Accountid);
        }
       
        map<id,account> accMap=new map<id,account>([select id,(select id from contacts where createddate=today) from account 
                                                    where id in:accid]);
        for(contact convar:triggernew){
            
            if(triggeroldmap==null){                
                if(accMap.get(convar.AccountId)!=null && (accMap.get(convar.AccountId).contacts).size()>0){
                  convar.adderror('you can add only 1 contact perday');  
                }
            }
            if(triggeroldmap!=null){
                system.debug('triggeroldmap '+triggeroldmap);
                if(convar.Phone==triggeroldmap.get(convar.Id).phone){
                 convar.adderror('Hey, you changed phone but old and new is same.'); 
               }
            }            
        }
    }
}