trigger TriggDelAcc on Account (before insert) {
    
    for(Account o: trigger.old)
    {
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        string mail=userinfo.getUserEmail();
      
         List<String> sendTo = new List<String>();
          sendTo.add(o.Student_Email__c);
        
        string body='dear customer';
        msg.setplaintextbody(body);
        msg.setsubject('teat email');
        Messaging.Email[] emails=new Messaging.Email[]{msg};
            Messaging.sendEmail(emails);
        
    }
}