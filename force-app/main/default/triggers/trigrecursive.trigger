trigger trigrecursive on Mark__c (before insert) {
if(checkRecursive.runOnce())
    {
       list<Mark__c> cr=[select status__c,Student__c from Mark__C where Student__c in (SELECT id FROM Account)  limit 1];
    //select id,name from car__c where id in (SELECT Car__c FROM Car_Route__c)];
    list<Account> acclist=new list<Account>();
    
    integer i=0;
    Account acc=new Account(); 
    //Map<id,account> oldmap=Trigger.oldMap();
    // else   
    /*   {
acc.Result__c='Pass';
}
acc.id=c.Student__c;
acclist.add(acc);
} 
*/
    
    //Map<id,account> newmap=Trigger.newMap();
    
        if(acc.Result__c!='Fail')
        {
            for(Mark__c c: cr){
        if(c.status__c=='Fail')
        {
            {
                acc.Result__c=c.status__c;
                system.debug('failed');
            }    
        }
        
            update acclist;
        }
       
            
        
    }
    }
}