trigger triger_bfredel on Account (before delete) {

    for(Account a: trigger.old)
    {
        if(a.rating=='cold')
            {
                a.adderror('record cannot be deleted');
            }
    }
}