trigger testCon on Contact (before insert) {
   account acc=[select id,name from account where name='newTest'];
   list<contact> conlist=new list<contact>();
   
   if(acc==null){
      account newacc=new account();
	  newacc.name='Test';
	  insert newacc;
   }
 
 
   if(trigger.isinsert && trigger.isbefore){
       for(contact convar:trigger.new){
	       
	        if(convar.AccountID==null){
			     
			   
			   //convar.AccountID=newacc.id;
			   
			   //conlist.add(convar);
			}
	    
	   }
	   
	if(!conlist.isEmpty()){
	  insert conlist;
	}
   
   }
 
}