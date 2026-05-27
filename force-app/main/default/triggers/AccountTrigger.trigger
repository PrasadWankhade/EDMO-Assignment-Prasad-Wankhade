trigger AccountTrigger on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        //AccountTriggerHandler.updateRelatedContacts(trigger.new, trigger.oldMap);
    }
}