public class CheckFileExistingTriggerHandler {
	list<Attachment> customerlist= [SELECT Name 			 
                 				    FROM   Attachment];
    list<Attachment> updatelist = new list<Attachment>();
    public void checkfileexistingmethod(Attachment Attfromtrigger){
        for(Attachment Att: customerlist){
if(Att.Name == Attfromtrigger.Name ){ 
                Attfromtrigger.AddError('File Already Exists!');
            }
        }
    }

}