public class InsertDML1 {
    public account acc {set;get;}
    public contact con {set;get;}
    public InsertDML1(){
        acc=new account();
        con=new contact();
    }
    public pagereference create(){
        insert acc;
        con.AccountId=acc.Id;//This is to create a link between contact(child) and Account(parent)
        insert con;
        pagereference p=new pagereference('/'+acc.Id);
        return p;
    }
}