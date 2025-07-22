public with sharing class SetEventStatusHandler {
    public static void SetEventStatusBeforeInsert(List<CAMPX__Event__c> createdEvents) {
        for (CAMPX__Event__c e : createdEvents){
            e.CAMPX__Status__c = 'Planning';
        }
    }
}