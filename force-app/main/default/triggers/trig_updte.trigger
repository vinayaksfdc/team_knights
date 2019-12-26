trigger trig_updte on Account (before update) {
set<id> accid=new set<id>();
    List<account> accsupdate=new List<account>();
    for(Account a: trigger.old)
        {
            accid.add(a.id);
        }
    for(Account acs: [select id,name,phone,industry from Account where id in :accid] )
    {
        Account a=new Account();
        
    }
}