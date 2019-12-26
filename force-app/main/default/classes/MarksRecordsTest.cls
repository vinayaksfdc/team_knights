@isTest
private class MarksRecordsTest {
 /*
   public Id accountId {get;set;}
    public List<Mark__c> getopptys()
    {
        List<Mark__c> oppty;
        oppty = [select name,status__c,semister__C,subject__r.name from Mark__C where Student__c  =: accountId];
        return oppty;
    }
 	*/  
    
    @isTest static void marksList(){
     Account a=new  Account(name='raj');
        insert a;
         Subject__C s=new  Subject__C(name='history');
        insert s;
         Mark__C m=new  Mark__C(name='raj',status__c='PASS',semister__C='sem1');
        insert m;
        Student_marks.serverEcho(a.id);
    }
    
}