trigger FieldUpdate_on_result1 on A__c (after insert) {
    List<result__c> resid= new   List<result__c>();
    for(A__c c:trigger.new)
    {
        if(c.Maths__c!=null)
        {
            result__c Child = new result__c();
            Child.AID__C=c.id;
            Child.Name=c.name;
            if(c.Maths__c<40)
            {
                {
                    child.Status__c='fail';
                    resid.add(Child);  
                }
            }
            else {
                child.Status__c='pass';
                resid.add(Child);  
            }
            insert resid;
        }
    }
    
    
}