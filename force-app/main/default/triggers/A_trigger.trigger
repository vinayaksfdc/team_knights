trigger A_trigger on A__c (after insert, after update) {

    /*
     * if(Trigger.isBefore && Trigger.isInsert){
        A_Trigger_Handler.beforeInsert(Trigger.new);
    }
    
if(Trigger.isAfter && Trigger.isInsert){
        A_Trigger_handler.afterInsert(Trigger.new);
    }
 		*/
       // A_Trigger_handler.afterUpdate(Trigger.oldMap.keySet());
    
}