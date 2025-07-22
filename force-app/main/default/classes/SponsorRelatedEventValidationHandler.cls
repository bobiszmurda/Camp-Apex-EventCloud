public with sharing class SponsorRelatedEventValidationHandler {
    public static void SponsorRelatedEventValidation(List <CAMPX__Sponsor__c> newSponsor) {
        for (CAMPX__Sponsor__c spnsr : newSponsor) {
            if (spnsr.CAMPX__Event__c == null && spnsr.CAMPX__Status__c == 'Accepted'){
                spnsr.addError('A Sponsor must be associated with an event before being Accepted.');
            }
         }
     }
}