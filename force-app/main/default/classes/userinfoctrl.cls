public class userinfoctrl {
	
    @AuraEnabled
    public static Profile getLoggedInProfile() {
      Profile loggedinUser = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId() LIMIT 1];
        return loggedinUser;
  }
    @AuraEnabled
    public static user fetchuser(){
        user userinfo = [SELECT id, name, username, country, email
                        FROM User
                        WHERE id =: userinfo.getuserId()];
        system.debug('userinfo is'+userinfo);
        return userinfo;
    }
    
  /*
    public static string getcon(string filterParam){
        list<contact> conid=[SELECT accountid   FROM contact  WHERE name =: filterParam];
        string id1 = conid[0].id;
        system.debug('id1 is'+id1);
        return id1;
    } 
 */
  	 @AuraEnabled
     public static String serverEcho(String filterName) { 
         system.debug('filterName'+filterName);
       /* return ('Hello from the server, ' + filterName);  */
         list<contact> conid=[SELECT accountid  FROM contact  WHERE name =: filterName];
            system.debug('conid'+conid);
        id id1 = conid[0].accountid;
          system.debug('id1 is'+id1);
         return id1;
    }


    
}