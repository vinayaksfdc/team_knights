trigger result_update_on_Acc on A__c (after insert,after update) {
   
    Set<Id> Accids = new Set<Id>();
    for(A__c c:Trigger.New)
    {
        if(c.Accountid__c <> null)
            Accids.add(c.Accountid__c);
    }
    
    Account a1=new Account();
    for(A__c a : [select id,hindi__c,english__c,maths__c,science__c,social__c from A__c where Accountid__c =: Accids])
     {
         if(a.hindi__c<35)
         {
           a1.result__c='fail';  
         }
         else if(a.english__c<35)
         {
             a1.result__c='fail';  
         }
           else if(a.maths__c<35)
         {
             a1.result__c='fail';  
         }
           else if(a.science__c<35)
         {
             a1.result__c='fail';  
         }
           else if(a.social__c<35)
         {
             a1.result__c='fail';  
         }
    }    
         update a1;    
}