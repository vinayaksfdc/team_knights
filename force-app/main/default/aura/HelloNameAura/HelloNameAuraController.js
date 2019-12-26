({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchuser");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // console.log('store response is '+storeResponse);
                //Country: "USA" Email: "vinayakb2@gmail.com" Id: "0052v00000auLB7AAM" Name: "Andy Young" Username: "a_young@dickenson.com"
                
                var myJSON = JSON.stringify(storeResponse)
                console.log('myJSON response is '+myJSON);
              // alert(' doinit myJSON'+myJSON);
                // set current user information on userInfo attribute
                component.set("v.userInfo", storeResponse);
            }
        });
        $A.enqueueAction(action);
        
    },
    
    itemsChange: function(component,event,helper){
         console.log('itemsChange event clicked');
       // var usrnme=component.find("body").get("v.value");  
     	//var usrnme=component.find("body").get("v.value"); 
        var usrnme=component.get("v.userInfo.Name"); 
        	component.set("v.NameString",usrnme);
       		 console.log('name in shw1 is'+usrnme); 
        //name in shw1 is Andy Young
        var name=component.get("v.NameString");
        console.log('component.get("v.NameString")'+name);
        var action = component.get("c.serverEcho");
        action.setParams({filterName : usrnme });
        
        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                 var frmsrver=response.getReturnValue();
              //  alert("From server: " + response.getReturnValue());
                console.log('response.getReturnValue() frm server'+frmsrver);
                //response.getReturnValue()0032v00002pEXL5AAO
                 var myJSON = JSON.stringify(frmsrver);
                component.set("v.id_of_cont", frmsrver);
                //debugger;
            }
        });
         $A.enqueueAction(action);
    },
    
    
    //var accid = component.get("v.id_of_cont");
  	 fireComponentEvent : function(component, event, helper) {
             console.log('event fired1');
                var name=component.get('v.id_of_cont');
          console.log('event fired2');
         		component.set("v.id_from_event",name);
         	 console.log('event fired3');       
         console.log(name);
          console.log('event fired4');
                var evt=$A.get("e.c:secondEvent");
          console.log('event fired5');
                evt.setParams({"accName":name});
          console.log('event fired6');
                evt.fire();
          console.log('event fired7');
       console.log('event fired');
          console.log('event fired8');
           },
   
    
    ddd : function (component, event, helper) {
         console.log('key Check event clicked');
    }
    
    
})