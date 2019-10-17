// **************************************************************************************************************************
// Boilerplate for a trigger.
//
// You want to have as little logic in the trigger as possible. 
// Your trigger here should route before and after operations to the handler.
// The handler class will contain calls to other classes where the desired logic and processes are performed.
// 
// Resource: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers.htm
// **************************************************************************************************************************

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