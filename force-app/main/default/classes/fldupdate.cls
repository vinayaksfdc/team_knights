public class fldupdate {
   public A__c coll{set;get;}
    public id recid{set;get;}
    public string status{set;get;}
 	public string grade{set;get;}
    public decimal tot{set;get;}
    public  List<Decimal> r{set;get;}
	 
	public fldupdate() {
		coll = new A__c();
	}
    		
	public void  save() {
        r=new List<Decimal>();
        r.add(coll.hindi__c);
        r.add(coll.english__c);
        r.add(coll.maths__c);
        r.add(coll.hindi__c);
        r.add(coll.science__c);
      system.debug('r value is'+r);
        
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
        a.AID__c=coll.id;
        a.status__c=status;
        a.grade__c=grade;
        insert a;
		  coll = new A__c();
   }
    		 
}