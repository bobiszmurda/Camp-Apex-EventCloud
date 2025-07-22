@isTest
public class SetChangedDateHandlerTest {

    @isTest
    static void testInsertSetsDate() {
        CAMPX__Event__c newEvent = new CAMPX__Event__c();
        newEvent.CAMPX__Status__c = 'Planning';

        Test.startTest();
        insert newEvent;
        Test.stopTest();

        CAMPX__Event__c insertedEvent = [SELECT CAMPX__StatusChangeDate__c FROM CAMPX__Event__c WHERE Id = :newEvent.Id];
        System.assertNotEquals(null, insertedEvent.CAMPX__StatusChangeDate__c, 'Date should be set on insert');
    }

    @isTest
    static void testUpdateChangesDateWhenStatusChanged() {
        CAMPX__Event__c event = new CAMPX__Event__c();
        event.CAMPX__Status__c = 'Planning';
        insert event;

        event.CAMPX__Status__c = 'Cancelled'; // zmiana statusu
        Test.startTest();
        update event;
        Test.stopTest();

        CAMPX__Event__c updatedEvent = [SELECT CAMPX__StatusChangeDate__c FROM CAMPX__Event__c WHERE Id = :event.Id];
        System.assertNotEquals(null, updatedEvent.CAMPX__StatusChangeDate__c, 'Date should be updated on status change');
    }

    @isTest
    static void testUpdateDoesNotChangeDateWhenStatusUnchanged() {
        CAMPX__Event__c event = new CAMPX__Event__c();
        event.CAMPX__Status__c = 'Planning';
        insert event;

        DateTime originalDate = [SELECT CAMPX__StatusChangeDate__c FROM CAMPX__Event__c WHERE Id = :event.Id].CAMPX__StatusChangeDate__c;

        event.CAMPX__NetRevenue__c = 333; // Zmień na rzeczywiste pole, które nie jest status

        Test.startTest();
        update event;
        Test.stopTest();

        CAMPX__Event__c updatedEvent = [SELECT CAMPX__StatusChangeDate__c FROM CAMPX__Event__c WHERE Id = :event.Id];
        System.assertEquals(originalDate, updatedEvent.CAMPX__StatusChangeDate__c, 'Date should NOT change if status did not change');
    }
}
