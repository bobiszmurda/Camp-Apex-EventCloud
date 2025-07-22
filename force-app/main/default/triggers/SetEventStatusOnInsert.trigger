trigger SetEventStatusOnInsert on CAMPX__Event__c (before insert) {
    SetEventStatusHandler.SetEventStatusBeforeInsert (Trigger.new);
}