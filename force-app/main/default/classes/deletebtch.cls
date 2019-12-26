global class deletebtch implements Database.Batchable<sObject>, Database.Stateful{
    
    global final String query;
    global Set<Id> failureIdsSet;
    global List<Account> accounts;
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('Select Id,Name From Account Limit 10');
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope){
        for(Account a: scope)
        {
            if(a.RecordTypeId=='0122v000001RlKQAA0')
            {
                accounts.add(a);
            }
        }
        delete accounts;
        
    }
    global void finish(Database.BatchableContext BC){
        AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors,
                          a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById,
                          a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
        System.debug('$$$ Jobid is'+BC.getJobId());
        
    }
}