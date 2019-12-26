trigger trig_update_cont_updateofAcc on Contact (after INSERT, after UPDATE,after DELETE) {
   set<id> accid=new set<id>();
    List<account> accs_to_update=new List<account>();
    
    if(Trigger.isInsert){
        for(contact c:trigger.new)
       {
    	   accid.add(c.AccountId);     
       }
    } 
     if(Trigger.isUpdate||trigger.isDelete){
        for(contact c:trigger.old)
       {
    	   accid.add(c.AccountId);     
       }
    
    }   
    for(Account c:[select id,name,(select id from Contacts) from Account where id in:accid])
       {
    	   Account a=new Account();
           a.id=c.id;
           a.No_of_Contacts__c=c.contacts.size();
           accs_to_update.add(a);
           
       }
    update accs_to_update;
}