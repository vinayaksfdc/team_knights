trigger ExamMarks1 on Mark__c (before insert) {
    
    Set<Id>Accids = new Set<Id>();
    for(Mark__c c:Trigger.New)
    {
        if(c.Student__c <> null)
            Accids.add(c.Student__c);
    }
    
    Map<string, Id> Result = new Map<string,Id>();
    
    for(Id s : Accids)
    {
        Decimal i =35;
        Id cc;
        String res;
        for(Mark__c c : [Select id, status__c,Student__c from Mark__c where Student__c =: s])
        {
            Integer mrks = Integer.ValueOf(c.Name);
            if(i<mrks)
            {
                res=c.Status__c;
                cc = c.Student__c;
            }
            else
              {}    
        }
        Result.put(res, cc);
    }
    
    for(Account a : [select id, name, Result__c from Account where Id IN: Result.Values()])
    {
        a.Result__c = Result.get(a.id);
        update a;
    }
}