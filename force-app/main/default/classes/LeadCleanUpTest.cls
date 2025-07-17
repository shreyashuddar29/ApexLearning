@isTest
public with sharing class LeadCleanUpTest {
    @testSetup
    static void setupData(){
        List<Lead> leads = new List<Lead>();
        leads.add(new Lead(FirstName = 'Test', LastName = 'One', Company = 'ABC', Status = 'Closed - Converted'));
        leads.add(new Lead(FirstName = 'Test', LastName = 'Two', Company = 'PQR', Status = 'Closed - Converted'));
        leads.add(new Lead(FirstName = 'Test', LastName = 'Three', Company = 'XYZ', Status = 'Closed - Converted'));
        insert leads;

        Test.setCreatedDate(leads[0].id, DateTime.now().addYears(-2));
        Test.setCreatedDate(leads[1].id, DateTime.now().addDays(-300));
        Test.setCreatedDate(leads[2].id, DateTime.now().addDays(-150));

    }
    @isTest
    public static void testLeadCleanUp() {
        Test.startTest();
        LeadCleanUp.leadCleanUp();
        Test.stopTest();
        List<lead> results = [SELECT Id, CreatedDate FROM Lead];
        System.assertEquals(2, results.size());
    }
}