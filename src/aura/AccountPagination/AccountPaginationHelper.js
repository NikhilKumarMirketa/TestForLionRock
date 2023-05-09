({ 
    getAccounts: function(cmp, page,recordToDisplay) {                
        var action = cmp.get("c.getAccount"); 
        action.setParams({ 
            "pageNumber": page, 
            "recordToDisplay": recordToDisplay
        });         
        action.setCallback(this, function(response) { 
            var result = response.getReturnValue(); 
            console.log ('**********Nikihil ' + JSON.stringify(result));                    
            cmp.set("v.AccountList", result.AccountListToDisplay); 
            cmp.set("v.page", result.pageNumber); 
            cmp.set("v.total", result.totalAccount); 
            cmp.set("v.pages", Math.ceil(result.totalAccount / recordToDisplay)); 
             
        });          
        $A.enqueueAction(action); 
    } 
})