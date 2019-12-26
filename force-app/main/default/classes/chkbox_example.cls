public class chkbox_example {

    @AuraEnabled
     public static Fees__c serverEcho(String filterName) { 
       /* return ('Hello from the server, ' + filterName);  */
          Fees__c f=[SELECT Student_Name__r.Transport__c, Student_Name__r.Scholarship__c,Student_Name__r.Hostel__c FROM Fees__c
                    where id=:filterName]; 

         system.debug(f);
        return f;
    }
    }