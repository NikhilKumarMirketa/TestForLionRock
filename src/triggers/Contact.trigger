trigger Contact on Contact (before insert,before update,before delete,after insert,after update,after delete) {

    contacthandler conhandler=new contacthandler();
    
    if(trigger.isbefore){
        if(trigger.isdelete){
           conhandler.stopDeletingChild(trigger.old);
        }
        if(trigger.isinsert){
          conhandler.adddailyOnecontact(trigger.new);  
        }
       
    }
   
}