@isTest
Private class chkbox_exampleTest {
@isTest static void marksList(){
    Account a=new  Account(name='raj',Transport__c=true,Scholarship__c=true,Hostel__c=true);
        insert a;
         Fees__c s=new  Fees__c(Student_Name__c=a.id); 
        insert s;
       Fees__c f=new  Fees__c(); 
        f=chkbox_example.serverEcho(s.id); 
    }
    
   
}