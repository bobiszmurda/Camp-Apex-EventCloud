trigger SponsorSetStatusOnInsert on CAMPX__Sponsor__c (before insert) {
    SponsorSetStatusHandler.SponsorStatusPending(Trigger.new);
}