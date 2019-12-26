trigger contSize on Contact (after insert,after update) {
    
    set<id> ids=new set<id>();
    
    List<account> conts=[select id, (select id from Contacts) from Account where id in: trigger.newMap.keyset()];
    for(Account a: conts)
    {
        System.debug('contact size is'+a.contacts.size());
        
    }
    
}