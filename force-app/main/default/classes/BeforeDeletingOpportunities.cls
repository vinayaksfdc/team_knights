public with sharing class BeforeDeletingOpportunities
{
 /*
  public static void beforeDeleteOperations(List<Opportunity>) trigger.old)
  {
    Messaging.reserveSingleEmailCapacity(trigger.size);
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
 
  for(Opportunity opp: (List<Opportunity>) trigger.old)
  {
     Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
     email.setToAddresses(new String[] {'yourname@yourEmail.com'});
     email.setSubject('Deleted Opportunity Alert');
     email.setPlainTextBody('This message is to alert you that the Opportunity named ' + opp.Name + ' has been deleted.');
     emails.add(email);     
   }
      Messaging.sendEmail(emails);
 
   }
  */
 }