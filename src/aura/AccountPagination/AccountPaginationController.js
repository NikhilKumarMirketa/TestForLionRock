({ 
 
    doInit: function(cmp, event, helper) {       
        var page = cmp.get("v.page") || 1; 
         var recordToDisplay = cmp.find("recordSize").get("v.value"); 
         cmp.set('v.Account', [ 
            {label: 'Account Name', fieldName: 'Name', type: 'Name'},
            {label: 'Primary Counselor', fieldName: 'counselor__c', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'}]);           
        helper.getAccounts(cmp, page,recordToDisplay);          
    },  
    navigate: function(cmp, event, helper){ 
	
        var page = cmp.get("v.page") || 1; 
        var direction = event.getSource().get("v.label");  
        console.log(typeof(direction));
        var recordToDisplay = cmp.find("recordSize").get("v.value");          
        page = direction === "Previous Page" ? (page - 1) : (page + 1);          
        helper.getAccounts(cmp, page,recordToDisplay);          
    }, 
      
    onSelectChange: function(cmp, event, helper) {          
        var page = 1 
        var recordToDisplay = cmp.find("recordSize").get("v.value"); 
        helper.getAccounts(cmp, page, recordToDisplay); 
    }, 
     
})