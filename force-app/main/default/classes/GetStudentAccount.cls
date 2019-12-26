public class GetStudentAccount {
    public Id con {get;set;}
    public Id acc {get;set;}
    public List<contact> getcons{get;set;}
    
    public Account accObj {get;set;}
    
    /**
    * get all sibling Contacts
    */ 
    public List<Contact> getAllContact(){
    
    
        if(acc != null)
        {
            accObj = [SELECT NAME FROM Account WHERE Id = : acc ];
            system.debug('accObj is '+accObj);
            //SELECT NAME FROM Account WHERE Id='0016F00002MWV6j'   Burlington Textiles Corp of America
            getcons=  [SELECT Id, Name, FirstName, LastName FROM Contact Where AccountId =: acc];
              system.debug('getcons is '+getcons);
            return getcons;
          
        }
      
        return null;
    }
    
    /**
    * get all sibling Contacts

    public List<Account> getAllContact(){
    
    
        if(acc != null)
        {
            accObj = [SELECT NAME FROM Account WHERE Id = : acc ];
           // return [SELECT Name, (select Name,semister__c from Marks__r where semister__c='SEM1' and  status__c='pass')  FROM Account  
            //         WHERE  Id =: acc ];
           // return [SELECT Name,phone,industry,rating from Account];
           return [SELECT Name, (select Name,semister__c,Subject__r.Name from Marks__r where semister__c='SEM1') FROM Account where id='0012v00002Q0o1pAAB'];

                  }
        
            
        return null;    
    }*/ 
}