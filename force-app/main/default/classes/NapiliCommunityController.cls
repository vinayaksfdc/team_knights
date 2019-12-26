public class NapiliCommunityController {
@AuraEnabled
    public static Profile getLoggedInProfile() {
      Profile loggedinUser = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId() LIMIT 1];
        return loggedinUser;
  }
}