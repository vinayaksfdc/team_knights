public class Student_Search {
	/* @AuraEnabled
    public static Account save(Account student){
       if(student == null)
           throw new AuraHandledException('student is null');
        insert student;
        return student;
    } */
    
    @AuraEnabled
    public static List<sObject> getAllStudents(String searchParam){
       String likeParam = '%' +searchParam+'%'; 
     		String Query= '';
        
        if(searchParam != null)
            {
                Query='select id,Name,Phone from Account where Name like :likeParam limit 10';  
               }
        else
            {
           	 Query='select id,Name,Phone from Account from Account limit 25';
               }
       	List<sObject> Blist=Database.query(Query);
        return Blist;
        
    }
     
}