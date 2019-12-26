public class AccountController {
 @AuraEnabled
    public static Account fetchAccount(id accountid) {
        Account accs = [SELECT Id, name, Student_Email__c, phone,industry,rating FROM Account where id=:accountid];
         return accs;
    }
}