public class contacthandler {

    /*Avoid deleting parent if associated*/
    public void stopDeletingChild(list<contact> conlist){
      for(contact con:conlist){            
          if(con.accountId!=null){
             con.adderror('You can\'t delete conatct bcz having assioacation with an account.');
           }
        }
        
    }
    
    /*Validation-maximum one conatct you can add per acccount daily*/    
     public void adddailyOnecontact(list<contact> triggernew){
     
        set<id> accid=new set<id>();        
        for(contact convar:triggernew){
           accid.add(convar.accountid);           
        }
        
        map<id,account> conmap=new map<id,account>([select id,(select id from contacts where createddate=today) from account where id IN:accid]);      
        for(contact convar:triggernew){
            if(conmap.get(convar.AccountId).contacts!=null && conmap.get(convar.AccountId).contacts.size()>0){
               convar.adderror('Can\'t add contact , you are crossing daily limit'); 
            }
        }           
    }
    
    
}