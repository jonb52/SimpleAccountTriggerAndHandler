trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
    if(trigger.isBefore && trigger.isInsert){
        AccountTriggerHandler.beforeInsert(Trigger.new);
    }

    if(trigger.isAfter && trigger.isInsert){
		AccountTriggerHandler.afterInsert(Trigger.new);
    }

    if(trigger.isBefore && trigger.isUpdate){
       	//Call handler
    }

    if(trigger.isAfter && trigger.isUpdate){
        //Call handler
    }
}