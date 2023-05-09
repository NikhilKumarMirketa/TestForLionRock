public class AccountSaveVFpage{
    
    public Account accObj{get;set;}
    public list<Account> accList{get;set;}
    public static string str='Nikhil';
    
   public AccountSaveVFpage(ApexPages.StandardController controller){
      system.debug('controller '+controller.getrecord());
          accObj =new Account();
      system.debug('accObj '+accObj);
          accList=new List<Account>([select name,type,industry,rating from account]);
    }
    
    public void accountSave(){     
       // insert accObj;
       // return null; //new pagereference('/'+accObj.Id); --for redirecting to saved result also add return type pagereference 
   }
   
}