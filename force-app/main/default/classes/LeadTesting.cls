@isTest
public class LeadTesting {
@isTest
    static void testing(){
    Lead l=new Lead();
        l.lastname='testing';
        l.FirstName='abc';
        l.Company='raj';
        l.leadsource='Web';
        insert l;
        Lead leads=[select rating from lead where id=:l.Id];
        system.assertequals('Warm',leads.Rating);
    }
}