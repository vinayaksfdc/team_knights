public class Student_marks {
	
       /* return ('Hello from the server, ' + filterName); 
Pass__c,Grade__c, 
         
         Account acc=[SELECT name, (select  name,Subject_Name__r.Name from Marks__r) FROM Account  WHERE id =: filterName];
         system.debug(acc);
        return acc;
    }
  @AuraEnabled
     public static Account listofmarks(String filterName) { 
	select Pass__c,Grade__c, Student_Name__r.Name,Subject_Name__r.Name from Marks__r
Pass__c,Grade__c,*/
       @AuraEnabled
     public static Account serverEcho(String filterName) { 
     
         //select  Name,Subject__r.Name from Mark__c
         // SELECT Name, (select Name,Subject__r.Name from Marks__r) FROM Account  WHERE id ='0012v00002Q0o1pAAB'
         Account acc=[SELECT Name, (select Name,semister__c, Subject__r.Name,status__c from Marks__r where semister__c='SEM1') FROM Account  
                      WHERE id =: filterName  ];
         system.debug(acc);
        return acc;
    }
     @AuraEnabled
     public static Account serverEcho1(String filterName) { 
     
         //select  Name,Subject__r.Name from Mark__c
         // SELECT Name, (select Name,Subject__r.Name from Marks__r) FROM Account  WHERE id ='0012v00002Q0o1pAAB'
         Account acc=[SELECT Name, (select Name,semister__c,Subject__r.Name,status__c from Marks__r where semister__c='SEM2') FROM Account  
                      WHERE id =: filterName];
         system.debug(acc);
        return acc;
    }
    
}