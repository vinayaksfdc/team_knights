trigger ExamMarks on Contact (before insert, before update) {
    
    Set<Id>Accids = new Set<Id>();
    for(Contact c:Trigger.New)
    {
        if(c.AccountId <> null)
            Accids.add(c.AccountId);
    }
    
    Map<Id, Id> Result = new Map<Id, Id>();
    
    for(Id s : Accids)
    {
        Decimal i =0;
        Id cc;
        for(Contact c : [Select id, name, Marks__c from Contact where AccountId =: s])
        {
            if(i<c.Marks__c)
            {
                i=c.Marks__c;
                cc = c.id;
            }
        }
        Result.put(s, cc);
    }
    
    for(Account a : [select id, name, contact__c from Account where Id IN: Result.keySet()])
    {
        a.contact__c = Result.get(a.id);
        update a;
    }
}