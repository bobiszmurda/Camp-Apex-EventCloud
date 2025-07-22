trigger SponsorEmailValidationOnInsert on CAMPX__Sponsor__c  (before insert) {
    SponsorEmailValidationHandler.SponsorEmailValidation(Trigger.new);
}