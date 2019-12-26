({
	doInit : function(component, event, helper) {
		var usrnme=component.get("v.recordId"); 
        console.log('id is'+usrnme);
                    	 component.set("v.nme",usrnme);
         var action = component.get("c.serverEcho");
        action.setParams({ filterName : usrnme });

        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                 
                var frmsrver=response.getReturnValue();
            // alert("From server: " + response.getReturnValue());
				 console.log('response.getReturnValue()'+frmsrver);
           		 var myJSON = JSON.stringify(frmsrver);
             	 
                component.set("v.abc", frmsrver);
             //   alert("JSON  stringify: " + myJSON);
        		//debugger;
              }
        });
      
        $A.enqueueAction(action);
	}
})