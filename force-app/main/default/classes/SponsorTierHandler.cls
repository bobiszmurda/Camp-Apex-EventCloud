public with sharing class SponsorTierHandler {
    public static void SponsorTierSetter(List <CAMPX__Sponsor__c> newSponsor) {
        for (CAMPX__Sponsor__c spnsr : newSponsor){
            if (spnsr.CAMPX__ContributionAmount__c == null || spnsr.CAMPX__ContributionAmount__c <= 0){
                spnsr.CAMPX__Tier__c = null;
            }
            else if (spnsr.CAMPX__ContributionAmount__c > 0 && spnsr.CAMPX__ContributionAmount__c < 1000){
                spnsr.CAMPX__Tier__c = 'Bronze';
            }
            else if (spnsr.CAMPX__ContributionAmount__c >= 1000 && spnsr.CAMPX__ContributionAmount__c < 5000){
                spnsr.CAMPX__Tier__c = 'Silver';
            }
            else {
                spnsr.CAMPX__Tier__c = 'Gold'; 
            }    
        }
    }
}   