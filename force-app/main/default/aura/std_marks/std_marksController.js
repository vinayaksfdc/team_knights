({
    doInit : function(component, event, helper) {
        var usrnme=component.get("v.val1"); 
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
               	component.set("v.ListOfAccount",frmsrver);
                
               
            }
            var a=JSON.stringify(component.get("v.ListOfAccount"));
                 //var myJSON = (a); 
              console.log('response ReturnValue  ListOfAccount'+a);
                alert(a);
        });
        
        $A.enqueueAction(action);
    },   
    doInit1 : function(component, event, helper) {
        var usrnme=component.get("v.val1"); 
        console.log('id is'+usrnme);
        component.set("v.nme",usrnme);
        var action = component.get("c.serverEcho1");
        action.setParams({ filterName : usrnme });
        
        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                 var frmsrver=response.getReturnValue();
               	component.set("v.ListOfSem2",frmsrver);
                
            var b=JSON.stringify(component.get("v.ListOfSem2"));
                 //var myJSON = (a); 
              console.log('response ReturnValue  ListOfSem2'+b);
              // alert(a);
            }
        });
        
        $A.enqueueAction(action);
    },
    invoke : function(component, event, helper) {
                var acc=event.getParam("accName");
                component.set("v.val1",acc);
         var usrnme=component.get("v.val1"); 
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
               	component.set("v.ListOfAccount",frmsrver);
               var a=JSON.stringify(component.get("v.ListOfAccount"));
                 //var myJSON = (a); 
              console.log('response ReturnValue  ListOfAccount'+a);
              // alert(a);
            }
        });
        
        $A.enqueueAction(action);
            }

})