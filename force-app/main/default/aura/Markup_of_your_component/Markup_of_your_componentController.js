({
    doinit: function (component, event, helper) {
        component.set("v.mycolumns", [
          
            {label: 'Contact Name', fieldName: 'Name', type: 'text'},
            {label: 'Contact title', fieldName: 'Title', type: 'text'},
 {label: 'Contact department', fieldName: 'Department', type: 'text'}
          
          
        ]);
        var action=component.get('c.fetchContact');
      
        action.setCallback(this,function(response){        
            var state=response.getState();
            if(state==="SUCCESS")
            {alert('Inside success');
                component.set("v.mydata",response.getReturnValue());
            }
          
        });
        $A.enqueueAction(action);


    }
});