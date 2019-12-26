trigger leadsourceTrigger on Lead (before insert) {

    for(lead l:Trigger.new)
    {
        if(l.leadsource=='Web')
        {
            l.rating='Warm';
        }
    }
}