trigger Account on Account (before insert,before update,before delete,after insert,after update,after delete){

    accounthandler acchandle=new accounthandler();    
    
    //Add this line for testing --By Nikhil Kumar on 09/05/2020	
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