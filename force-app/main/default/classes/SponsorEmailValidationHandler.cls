public with sharing class SponsorEmailValidationHandler {
    public static void SponsorEmailValidation(List <CAMPX__Sponsor__c> newSponsor) {
        for (CAMPX__Sponsor__c spnsr : newSponsor){
            if (spnsr.CAMPX__Email__c == null)
                spnsr.CAMPX__Email__c.addError('A sponsor can not be created without an email address');
        }   
    }
}