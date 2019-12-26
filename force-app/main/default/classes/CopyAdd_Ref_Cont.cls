global class CopyAdd_Ref_Cont implements Database.Batchable<sObject> {
 
    global Database.QueryLocator start(database.BatchableContext bc)
     {
        String query='select id,firstname,contact.account.BillingStreet,Mailingstreet,accountid from contact';
         return Database.getQueryLocator(query);
     }
     global void execute(database.BatchableContext bc,List<Contact> scope)
     {
      for(Contact c:scope)
      {
          if(c.accountid!=null && c.Mailingstreet==null)
          {
              c.Mailingstreet=c.account.BillingStreet;
          }  
      } 
         update scope;
     }   
    
    global void finish(Database.BatchableContext bc){
        
    }
    
    
}