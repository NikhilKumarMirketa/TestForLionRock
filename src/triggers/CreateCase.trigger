trigger CreateCase on Contact (after update){
       
    list<case> caseList=new list<case>();    
    if(trigger.isupdate && trigger.isafter){
         
       for(contact convar:trigger.new){
           if(convar.Email!=null && convar.Email!=trigger.oldmap.get(convar.Id).Email){
               case caseVar=new case();
               
                caseVar.ContactId=convar.Id;
                caseVar.Origin='Phone';
                caseVar.Status='New';
                caseVar.Description='Old Email '+trigger.oldmap.get(convar.Id).Email+' New Email '+convar.Email;
              
               caseList.add(caseVar); 
           }     
       }
        if(!caseList.isEmpty()){
            insert caseList;
        }   
    }

}