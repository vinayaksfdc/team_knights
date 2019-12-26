public class NewAndExistingController {
    
    public string res1{set;get;}
    public A__c coll{set;get;}
    public id recid{set;get;}
    public string status{set;get;}
    public string grade{set;get;}
    public decimal tot{set;get;}
    public List<decimal> dec{set;get;}
    public NewAndExistingController() {
        coll = new A__c();
    }
    
    public pagereference   save() {
        List<decimal> dec=new List<decimal>{coll.hindi__c,coll.english__c,coll.maths__c,coll.science__c,coll.social__c};
   				system.debug('dec is '+dec);
        
        	for(decimal d: dec)
            {
                if(d<45)
                {
                    res1='fail';
                }
                else
                {
                    res1='Pass';
                }    
            }
        system.debug('res1 is'+res1);
            //   dec.addall{coll.hindi__c,coll.english__c,coll.maths__c,coll.science__c,coll.social__c};
        if(coll.hindi__c<35)
        {
            status='fail';  
        }
        else if(coll.english__c<35)
        {
            status='fail';  
        }
        else if(coll.maths__c<35)
        {
            status='fail';  
        }
        else if(coll.science__c<35)
        {
            status='fail';  
        }
        else if(coll.social__c<35)
        {
            status='fail';  
        }
        if(status!='fail')
        {
            tot=coll.english__c+coll.maths__c+coll.science__c+coll.social__c+coll.hindi__c;
            system.debug('tot is'+tot);
        }
        else if(coll.english__c>45 && coll.maths__c>45  && coll.science__c>45 && coll.social__c>45 && coll.hindi__c>45)
        {
            status='Pass'; 
        }
        if(tot>399)
        {
            grade='First Class'; 
        }
        else if(tot>300 && tot<400)
        {
            grade='second Class'; 
        }  
        else if(tot<300)
        {
            grade='Third Class'; 
        }    
        
        insert coll;
        Result__c a=new Result__c();
        system.debug('status is'+status);
        a.AID__c=coll.id;
        a.status__c=status;
        a.grade__c=grade;
        system.debug('status is'+status);
        insert a;
        pagereference p=new pagereference('/'+a.Id);
        return p;
        //  coll = new A__c();
    }
}