trigger SponsorTierTrigger on CAMPX__Sponsor__c (before insert, before update) {
    SponsorTierHandler.SponsorTierSetter(Trigger.new);
    SponsorRelatedEventValidationHandler.SponsorRelatedEventValidation(Trigger.new);
}