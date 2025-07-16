@isTest
private class OpportunityCloseDateTest {
    @isTest
    public static void testOpportunityCloseDate() {
        List<Opportunity> oppList = new List<Opportunity>{
            new Opportunity(Name = 'Test1', StageName = 'Prospecting', CloseDate = Date.today().addDays(20)),
            new Opportunity(Name = 'Test2', StageName = 'Prospecting', CloseDate = Date.today().addDays(30))
        };
        insert oppList;

        List<Id> opptyIds = new List<Id>();
        for(Opportunity opp : oppList) {
            opptyIds.add(opp.Id);
        }

        Test.startTest();
        OpportunityCloseDate.opportunityCloseDate(opptyIds);
        Test.stopTest();

        List<Opportunity> result = [SELECT Id, CloseDate FROM Opportunity WHERE Id IN :opptyIds];
        for(Opportunity o : result){
            System.assertEquals(Date.today(), o.CloseDate);
        }
    }
}