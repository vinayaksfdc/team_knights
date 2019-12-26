trigger trigger_update_status_Account on Mark__c (before insert,before update) {
    
    list<Mark__c> cr=[select id,status__c,Student__c from Mark__C where Student__c in (SELECT id FROM Account)  limit 1];
    system.debug('cr id is'+cr);
 
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
    if(acc.Result__c!='Fail')
    {
        for(Mark__c c: cr){
            if(c.status__c=='Fail')
            {
                {
                     system.debug('c.status__c is '+c.status__c);
                    acc.Result__c=c.status__c;
                    system.debug('failed');
                }  
               
            }
             else
                {
                    acc.Result__c='Pass';
                }    
             //Map<id,account> newmap=Trigger.newMap();
            system.debug('acclist is '+acclist);
            update acclist;
        }    
        
    }
}