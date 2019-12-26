@isTest
Private class Student_marksTest {
@isTest static void marksList(){
     Account a=new  Account(name='raj');
        insert a;
         Subject__C s=new  Subject__C(name='history');
        insert s;
         Mark__C m=new  Mark__C(name='raj',status__c='PASS',semister__C='sem1');
        insert m;
        Student_marks.serverEcho(a.id); 
    }
    
    @isTest static void marksList1(){
     Account a=new  Account(name='raj');
        insert a;
         Subject__C s=new  Subject__C(name='history');
        insert s;
         Mark__C m=new  Mark__C(name='raj',status__c='PASS',semister__C='sem2');
        insert m;
        Student_marks.serverEcho1(a.id); 
    }
    
}