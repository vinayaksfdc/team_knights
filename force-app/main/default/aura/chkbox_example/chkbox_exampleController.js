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
                // 	alert("JSON  stringify: " + state);
                var frmsrver=response.getReturnValue();
           	// alert("From server: " + response.getReturnValue());
                	var newExpense = JSON.stringify(frmsrver); //3
                console.log(newExpense);
                var newExp1=frmsrver.Student_Name__r.Transport__c;
                 var newExp2=frmsrver.Student_Name__r.Scholarship__c;
                   component.set("v.Transport",newExp1);
                debugger
                component.set("v.studentrec",frmsrver);
                
                component.set("v.Scholarship",newExp2);
             
              }
        });
      
        $A.enqueueAction(action);
	}
})