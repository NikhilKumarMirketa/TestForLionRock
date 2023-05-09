public class ClassForIntegrationHandsOn {

    /* Complex Serilize Using JSONGenerator---------------*/
    
    public void createJson(string name,string phone,string Industry){
        
        system.JSONGenerator JG=JSON.createGenerator(true);
        JG.writeStartObject();
        
         try{  
             
             Account acc=new account();
             acc.Name=name;
             acc.Phone=phone;
             acc.Industry=Industry;
             insert acc;
             JG.writeStringField('Status','Success');
             JG.writeStringField('Message', 'Account Inserted successfully');
             JG.writeIdField('Account Id', acc.id);
             JG.writeNumberField('Code', 100);  
             
          }catch(exception e){
             
             JG.writeStringField('Status','Failed');
             JG.writeStringField('Message', e.getMessage());
             JG.writeNumberField('Code', 200);
              
          }  
        
        JG.writeEndObject();         
        system.debug('JsonGenerator '+JG.getAsString());        
    }
    
    
     /*Complex Serilize Using JSONGenerator---------------*/
    
     public void createJsonDynamic(){
        
        system.JSONGenerator JG=JSON.createGenerator(true);
        JG.writeStartObject();
        
         try{  
             
            for(Account acc:[select id,name,phone,Industry from account ]){
               JG.writeStringField('Status','Success');
               JG.writeStringField('Message', 'Account Inserted successfully');
               JG.writeIdField('Account Id', acc.id);
               JG.writeNumberField('Code', 100);  
             }
             
          }catch(exception e){
             
             JG.writeStringField('Status','Failed');
             JG.writeStringField('Message', e.getMessage());
             JG.writeNumberField('Code', 200);
              
          }  
        
        JG.writeEndObject();         
        system.debug('JsonGenerator '+JG.getAsString());        
    }
    
    /*deserialize complex data Using parser*/
    
    public void parseJsonString(string data){
        
        map<string,object> parseData=new map<string,object>();
        system.debug('data--'+data);
        system.JSONParser JP=Json.createParser(data);
        
        while(JP.nextToken()!=null){
            parseData.put(Jp.getCurrentName(),Jp.getCurrentToken());
        }
        
        system.debug(parseData);    
    }
    
    
}