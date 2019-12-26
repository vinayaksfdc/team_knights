public class user_Soql {
 @AuraEnabled
    public static User getLoggedInUser(){
        return [SELECT Id, Contact.AccountId FROM User WHERE Id =: UserInfo.getUserId() LIMIT 1];
    }
}