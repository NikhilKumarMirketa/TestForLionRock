trigger opportunityLineItem on OpportunityLineItem (before insert , before update) {
    if((trigger.isinsert || trigger.isBefore) && trigger.isbefore){
      for(OpportunityLineItem var:trigger.new){
        if(var.Billing_Type__c=='Subscription Plan'){
            var.ABC__c=var.UnitPrice;
        }else if(var.Billing_Type__c=='Non Subscription Plan'){
              var.ABC__c=var.ListPrice;
        }
      }
    }
}