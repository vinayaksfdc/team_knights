public class Fees {
 @AuraEnabled
     public static Account serverEcho(String filterName) { 
       /* return ('Hello from the server, ' + filterName);  */
         
         Account acc=[SELECT Hostel_Facitly__c,Scholarship__c  FROM account  WHERE id =: filterName];
         system.debug(acc);
        return acc;
    }
}