global with sharing class MarksRecords{
      public Id accountId {get;set;}
    public  List<Mark__c> getopptys()
    {
        List<Mark__c> oppty;
        oppty = [select name,status__c,semister__C,subject__r.name from Mark__C where Student__c  =: accountId];
        return oppty;
    }
}