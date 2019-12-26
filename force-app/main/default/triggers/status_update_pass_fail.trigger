trigger status_update_pass_fail on Mark__c (before insert,before update) {
    
    for(Mark__c c:trigger.new)
    {
        Integer mrks = Integer.ValueOf(c.Name);
        
        if(mrks<35)
        {
            c.Status__c='Fail';
        }
        else
        {
            c.Status__c='Pass';
        } 
        
    }
   
}