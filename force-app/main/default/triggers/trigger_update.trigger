trigger trigger_update on Account (before update) {
    map<id,Account> oldmap=trigger.oldMap;
    map<id,Account> newmap=trigger.newMap;
         String name;
    for(id  key:newmap.keySet())
        {
            Account ol=oldmap.get(key);
            Account n2=newmap.get(key);
            if(ol.name!=n2.name)
            {
                n2.contact__c='pass';
            } 
            else 
            {
              n2.contact__c='fail';
            }   
                
       
        }  

}