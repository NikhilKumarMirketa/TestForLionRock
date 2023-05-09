trigger Account on Account (before insert,before update,before delete,after insert,after update,after delete){

    accounthandler acchandle=new accounthandler();    
   
    if(trigger.isbefore){
        if(trigger.isinsert){
            acchandle.checkPhonefiled(trigger.new,null);           
            acchandle.duplicateAccount(trigger.new);
            
        }
        if(trigger.isupdate){
           acchandle.checkPhonefiled(trigger.new, trigger.oldmap); 
        }
        if(trigger.isdelete){
          acchandle.stopDeletaccount(trigger.oldmap);
       }
    }

}