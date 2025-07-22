trigger SetChangedDateOnUpdate on CAMPX__Event__c (before update, before insert) {
    if(trigger.isInsert){
        SetChangedDateHandler.SetChangedDateOnInsert (Trigger.new);
    }
    if (trigger.isUpdate){
        SetChangedDateHandler.SetChangedDateOnUpdate (Trigger.new, Trigger.oldMap);
   }
}