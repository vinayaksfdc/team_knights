public class Timetable {
    
    public list<account> acc {set;get;}
 
 
    public Timetable(){
        acc=[select name,phone,industry,rating from account where rating='warm'];
    }
     
    
    
}