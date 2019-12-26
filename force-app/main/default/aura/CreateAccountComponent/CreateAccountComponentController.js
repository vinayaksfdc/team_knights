({
                handleClick : function(component, event, helper) {
                    
                    var action=component.get("c.createContact");
                    
                  var vale = component.get('v.contactObj');
                    action.setParams({"contObj":component.get('v.contactObj')});
                    console.log(JSON.stringify(vale));
                   
                    console.log(vale);
                   //debugger;
                    action.setCallback(this,function(response){
                        var state=response.getState();
                        if(state==='SUCCESS'){
                            var result=response.getReturnValue();
                             
                            component.set("v.contactId",result);
                            console.log(result);
                        }else{
                            console.log('Error');
                        }
                    });
                    $A.enqueueAction(action);

                }
			})