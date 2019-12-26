trigger trig_update_cnt_Acc on Account (before insert) {

    For(Account a: [select id,name, (select id,firstname from Contacts) from Account])
    {
       
    } 
}