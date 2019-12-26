global class Batch_to_fieldUpdate implements Database.Batchable<sObject> {
    
    public list<mark__c> lst_std_fail{set;get;}
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query ='select id,student__r.name,student__c,status__c from mark__c  where status__c='+'fail';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,list<mark__c> listofmarks){
        system.debug('carlist execute is'+lst_std_fail);
        lst_std_fail = new list<mark__c>();
        List<Account> accts = new List<Account>();
        Account a=new Account();
        for(Mark__c c:listofmarks)
        {
            
            if(c.status__c=='fail')
            {
                a.id=c.Student__c;
                a.Result__c=c.Status__c;
            }
            accts.add(a);
        }
        update accts;
    }
    global void finish(Database.BatchableContext bc)
    {
        
        
    }
}