trigger checkfileexisting on Attachment (before insert) {
	CheckFileExistingTriggerHandler triggerhandler = new CheckFileExistingTriggerHandler();
    for(Attachment c: trigger.new){
        triggerhandler.checkfileexistingmethod(c);
        //c.addError('stop');
    }

}