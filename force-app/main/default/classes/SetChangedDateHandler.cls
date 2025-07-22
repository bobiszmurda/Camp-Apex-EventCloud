public with sharing class SetChangedDateHandler {
    
    public static void SetChangedDateOnInsert (List<CAMPX__Event__c> newEvents){
        for (CAMPX__Event__c newE : newEvents){
            newE.CAMPX__StatusChangeDate__c = DateTime.now();
        }
    }

    public static void SetChangedDateOnUpdate(List<CAMPX__Event__c> changedEvents, Map<Id, CAMPX__Event__c> oldEventsMap) {
        for (CAMPX__Event__c e : changedEvents){
            CAMPX__Event__c oldE = oldEventsMap.get(e.Id);
            if (e.CAMPX__Status__c != '' && e.CAMPX__Status__c != oldE.CAMPX__Status__c){
                e.CAMPX__StatusChangeDate__c = DateTime.now();
            }        
        }
    }
}
