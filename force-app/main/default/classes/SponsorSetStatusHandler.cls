public with sharing class SponsorSetStatusHandler {
    public static void SponsorStatusPending(List<CAMPX__Sponsor__c> newSponsor) {
        for (CAMPX__Sponsor__c spnsr : newSponsor){
            if (spnsr.CAMPX__Status__c == null){
                spnsr.CAMPX__Status__c = 'Pending';
            }
        }
    }
}