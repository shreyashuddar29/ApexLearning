@isTest
public with sharing class ContactManagerTest {
    @isTest
    public static void testContactManager() {
        List<Contact> conList = new List<Contact>();
        conList.add(new Contact(FirstName = 'Test', LastName = 'One', MailingPostalCode = '11111', Status__c = 'Inactive'));
        conList.add(new Contact(FirstName = 'Test', LastName = 'Two', MailingPostalCode = '12345', Status__c = 'Inactive'));
        conList.add(new Contact(FirstName = 'Test', LastName = 'Three', MailingPostalCode = '12345', Status__c = 'Pending'));
        insert conList;

        Test.startTest();
        ContactManager.updateContactActiveStatus();
        Test.stopTest();

        List<Contact> result = [SELECT Id, Status__c, MailingPostalCode FROM Contact WHERE Status__c = 'Active' AND MailingPostalCode = '12345'];
        System.Assert.areEqual(2, result.size());
    }
}
