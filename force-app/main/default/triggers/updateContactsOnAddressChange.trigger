trigger updateContactsOnAddressChange on Account (before Insert, before update, after update) {
    
 Set<Id> accountIds = new Set<Id>();
    for (account a : trigger.new) {
        account old = trigger.oldMap.get(a.Id);
        if (a.billingstreet != old.billingstreet|| a.billingcity !=old.billingcity || a.billingstate !=old.billingstate || a.billingcountry != old.billingcountry) {
            accountIds.add(a.Id);
        }
    }
    if (accountIds.size() > 0) {
        contact[] updates = [select Id, accountId from contact where accountId in :accountIds];
        for (contact c : updates) {
            account a = trigger.newmap.get(c.accountId);
            c.mailingStreet = a.billingStreet;
            c.mailingcity = a.billingcity;
            c.mailingstate = a.billingstate;
            c.mailingpostalcode = a.billingpostalcode;
            c.mailingcountry = a.billingcountry;
                    }
        update updates;
    }
}