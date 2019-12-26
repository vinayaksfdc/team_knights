public class std_marks {
@AuraEnabled
     public static List<Account> serverEcho(String filterName) { 
     
         //select  Name,Subject__r.Name from Mark__c
         // SELECT Name, (select Name,Subject__r.Name from Marks__r) FROM Account  WHERE id ='0012v00002Q0o1pAAB'
         List<Account> acc=[SELECT Name, (select Name,semister__c,	Subject__r.Name from Marks__r where semister__c='SEM1') FROM Account  
                      WHERE id =: filterName  ];
         system.debug(acc);
        return acc;
    }
     @AuraEnabled
     public static List<Account> serverEcho1(String filterName) { 
     
         //select  Name,Subject__r.Name from Mark__c
         // SELECT Name, (select Name,Subject__r.Name from Marks__r) FROM Account  WHERE id ='0012v00002Q0o1pAAB'
         List<Account> acc=[SELECT Name, (select Name,semister__c,Subject__r.Name from Marks__r where semister__c='SEM2') FROM Account  
                      WHERE id =: filterName];
         system.debug(acc);
        return acc;
    }
    
}