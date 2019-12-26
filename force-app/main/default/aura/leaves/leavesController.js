({
    onChange: function (cmp, evt, helper) {
        var lve=cmp.find('select').get('v.value');
        
        console.log(lve);
        
        //alert(cmp.find('select').get('v.value') );
       
        alert(lve);
        
        cmp.set("v.Selected_option", lve);
        
    },
    
        sub : function (cmp) {
        var lrm=cmp.get("v.Total_Leaves")-cmp.get("v.Leaves_usd");
			
        console.log(lrm);
        
        cmp.set("v.Leaves_Remaining", lrm);
},
    
            
    fromChange: function(component, event, helper) {
        //console.warn("fromchange");
       var fromdate = new Date(component.find("dateValue1").get("v.value"));
        var todate = new Date(component.find("dateValue").get("v.value"));
        console.log("date is fromdate in from change: ", fromdate);
          console.log("date is todate in from change: ", todate);
        var diffdate=todate.getDate()-fromdate.getDate();
        component.set("v.NoofDays",diffdate);
        console.log(diffdate);
  },
   	
	toChange: function(component, event, helper) {
        //console.warn("toChange");
       
        var todate = component.find("dateValue").get("v.value");
        console.warn("date is: ", todate);
  },
	invoke  : function(component, event, helper) {
        console.log("event received by HelloNameAura.js");
        var message = event.getParam("empName"); 
        component.set("v.messageFromEvent", message); 
        console.log(name);
    },
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
    },
    
});