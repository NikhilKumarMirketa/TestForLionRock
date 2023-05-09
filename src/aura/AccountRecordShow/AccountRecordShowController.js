({
	myAction : function(component, event, helper) {
         component.set('v.columns', [
            {label:'Important Account', fieldName: '',
             cellAttributes:{ 
                 class:{ fieldName: 'ImportantAcc' },
                 iconName:{
                     fieldName: 'displayIconName'
                 }
             }
            },
            {label: 'Account Name', fieldName: 'Name', type: 'text',
             cellAttributes:{ 
                 class: { fieldName: 'colortext' }}},
             
            {label: 'Industry', fieldName: 'Industry', type: 'Picklist',
             cellAttributes:{ 
                 class: { fieldName: 'colortext' }}},
             
            {label: 'Type', fieldName: 'Type', type: 'Picklist',
             cellAttributes:{ 
                 class: { fieldName: 'colortext' }}}            
        ]);       
		var action=component.get("c.rerieveAccount");        
        action.setCallback(this,function(response){
            if(response.getState()==="SUCCESS"){
                
                var dataSet=response.getReturnValue(); 
                for(var i=0;i<dataSet.length;i++){
 
                    
                    if(dataSet[i].Is_Important__c==true){
                        dataSet[i].displayIconName='utility:check';
                        dataSet[i].colortext='slds-text-color_success';
                    }else{
                        dataSet[i].displayIconName='utility:close';
                        dataSet[i].colortext='slds-text-color_error'; 
                    }
                }
               
                component.set("v.data",dataSet);               
              }
        });
        $A.enqueueAction(action); 
	}
})