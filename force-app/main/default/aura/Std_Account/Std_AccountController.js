({
	 invoke : function(component, event, helper) {
                var acc=event.getParam("accName");
         		console.log('acc from std_account');	
                component.set("v.val1",acc);
            },
   	 getContactsList : function(component, event, helper) {
        // Assign server method to action variable
         var accountId = component.get("v.val1");
          console.log('accountId'+accountId);
        var action = component.get("c.fetchAccount");
        console.log('Fetch Account is passed');
       // var accountId = component.find("body").get("v.value");
          console.log("Account id"+accountId);
        // Setting parameters for server method
        action.setParams({
            accountid: accountId
        });
        // Callback function to get the response
        action.setCallback(this, function(response) {
            // Getting the response state
            var state = response.getState();
            // Check if response state is success
            if(state === 'SUCCESS') {
                // Getting the list of contacts from response and storing in js variable
                var accVal = response.getReturnValue();
                // Set the list attribute in component with the value returned by function
                component.set("v.acc",accVal);
                
                var myJSON = JSON.stringify(accVal);
                console.log('Account val is'+myJSON);
            }
            else {
                // Show an alert if the state is incomplete or error
                alert('Error in getting data');
            }
        });
        // Adding the action variable to the global action queue
        $A.enqueueAction(action);
        }  ,
    handleLoad: function(cmp, event, helper) {
        cmp.set('v.showSpinner', false);
    },

    handleSubmit: function(cmp, event, helper) {
        cmp.set('v.disabled', true);
        cmp.set('v.showSpinner', true);
    },

    handleError: function(cmp, event, helper) {
        // errors are handled by lightning:inputField and lightning:nessages
        // so this just hides the spinnet
        cmp.set('v.showSpinner', false);
    },

    handleSuccess: function(cmp, event, helper) {
        cmp.set('v.showSpinner', false);
        cmp.set('v.saved', true);
    }
    
})