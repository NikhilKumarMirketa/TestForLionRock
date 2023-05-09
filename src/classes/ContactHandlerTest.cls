@isTest
public class ContactHandlerTest {

    @isTest
    public static void testcase1(){
        
        account accvar=new account();
        accvar.Name='Account Test';
                
        contact convar=new contact();
        convar.LastName='contactLastname';
        convar.Salutation='Mr.';
        convar.AccountId=accvar.Id;
        convar.Phone='7361089227';
        
        test.startTest();
         insert accvar;
         insert convar;
         database.SaveResult dc1=database.insert(convar);
          system.assertEquals('Can not delete this because of assciated account',dc1.errors[0].getmessage());
         convar.phone='7361089227';
         database.SaveResult dc2=database.update(convar);       
           system.assertEquals('Hey, you changed phone but old and new is same.',dc2.errors[0].getmessage());
         delete convar;
        test.stopTest();
    }
}