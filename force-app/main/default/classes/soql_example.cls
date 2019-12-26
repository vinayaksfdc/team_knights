public class soql_example {
    
   public list<Account> accs {get;set;}
public void soql_example1()
{
accs = [Select Id, Name, (Select Id, Name From Contacts) From Account limit 10];
}
}