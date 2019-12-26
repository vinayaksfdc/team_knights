public class A_Trigger_handler {
    public static string res{set;get;}
    public static string grade{set;get;}
    public static decimal tot{set;get;}
    Public static List<result__c> r1{set;get;}
public static void beforeInsert(List<A__c> AList){
        for(A__c op: AList){
            op.course__c='MPC';
             }
    }
public static void afterInsert(List<A__c> AList){
     r1=new List<result__C>();
        for(A__c op: AList){
            if(op.english__c>40 && op.hindi__c>40 && op.maths__c>40 && op.science__c>40 && op.social__c>40)
            {
                res='Pass';
             }
            else
            {
                res='fail';
            }
             tot=op.english__c+op.hindi__c+op.maths__c+op.science__c+op.social__c;
             if(res!='fail' && tot>400)
             {
                 grade='A';
             }
             else if(res!='fail' && tot>300 && tot<400)
             {
                 grade='B';
             }
            else if(res!='fail' && tot<300 )
             {
                 grade='C';
             }
            System.debug('grade is'+grade);
            System.debug('res is'+res);
           
            system.debug('tot is'+tot);
            
             Result__c a=new Result__c();
       		a.AID__c=op.id;
            a.name=op.name;
            a.total__c=tot;
            a.Grade__c=grade;
            a.Status__c=res;
            r1.add(a);
             }
    insert r1;
    }    
	/*
    public static void afterUpdate(Result__c Accid){
     r1=new List<result__C>();
                List<Result__c> op1 =[select  Grade__c,Status__c,total__c,Aid__r.name,Aid__r.hindi__C,Aid__r.science__C,Aid__r.social__C,Aid__r.maths__C,
Aid__r.english__C from Result__C where Aid__c=:Accid];
        for(Result__c op: op1){
            if(op.Aid__r.english__c>40 && op.Aid__r.hindi__c>40 && op.Aid__r.maths__c>40 && op.Aid__r.science__c>40 && op.Aid__r.social__c>40)
            {
                res='Pass';
             }
            else
            {
                res='fail';
            }
             tot=op.english__c+op.hindi__c+op.maths__c+op.science__c+op.social__c;
             if(res!='fail' && tot>400)
             {
                 grade='A';
             }
             else if(res!='fail' && tot>300 && tot<400)
             {
                 grade='B';
             }
            else if(res!='fail' && tot<300 )
             {
                 grade='C';
             }
            System.debug('grade is'+grade);
            System.debug('res is'+res);
           
            system.debug('tot is'+tot);
            
             Result__c a=new Result__c();
       		a.AID__c=op.id;
            a.name=op.name;
            a.total__c=tot;
            a.Grade__c=grade;
            a.Status__c=res;
            r1.add(a);
             }
    insert r1;
    }    
	*/
}