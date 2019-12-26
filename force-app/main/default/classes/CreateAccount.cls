public class CreateAccount {
@AuraEnabled
public static string createContact(contact contObj)    {
     system.debug('contact obj is'+contObj);
    system.debug('contact obj is'+contObj.firstname);
    insert contObj;
    return contObj.Id;
    
}
}