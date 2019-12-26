/* public class Datetestcls {

@AuraEnabled
public static string createleave(Leaves__c levObj)    {
     system.debug('Leaves__c obj is'+levObj);
    system.debug('Leaves__c obj is'+levObj.Leave_From__c);
    insert levObj;
    return levObj.Id;
    
}*/
   
public class elfL1 {
    @AuraEnabled public static Leaves__c          getLeaves(){
        return (Leaves__c) Database.query( ' SELECT Name FROM Leaves__c ' )[0];
    }


}