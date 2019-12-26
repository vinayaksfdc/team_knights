({
    
   doSearch : function(component, event, helper) {
        var componentEvent=component.getEvent('CompEvent');
        var searchParam=component.find('searchInput').get('v.value');
        componentEvent.setParams({
            searchText : searchParam 
        });
		componentEvent.fire();
	}, 
    handleCompEvent : function(component, event, helper) {
        var searchParam=event.getParam("searchText");
    	console.log(searchParam);
         var action=component.get("c.getAllStudents");
         action.setParams({"searchParam" : searchParam});
        	action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                var result=response.getReturnValue();
                component.set("v.StdList",result); 
                console.log(response.getReturnValue());
               // var res1=JSON.stringify(component.get("v.beerList"));
                //console.log(res1);
            }
            else
            {
                console.log('State failed'+response.getError());
            } 
        });
        $A.enqueueAction(action);
        
    }
 
     
    
})