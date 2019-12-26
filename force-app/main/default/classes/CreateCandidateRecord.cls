public with sharing class CreateCandidateRecord {

    /**
   * Create a new candidate Record
   *
   * @param Candidate__c candidate  candidate record to be inserted
   * 
   */
    @AuraEnabled
    
    public static void saveStudent(Fees__c student){
        INSERT student;
       
        
    }    
}