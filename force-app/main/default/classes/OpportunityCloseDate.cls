// Write an Apex class that updates the CloseDate of a list of Opportunity records to the current date.

public with sharing class OpportunityCloseDate {
    public static void opportunityCloseDate(List<Id> opptyIds) {
        if(opptyIds == null || opptyIds.isEmpty()){
            return;
        }
        List<Opportunity> oppList = [SELECT Name FROM Opportunity WHERE Id IN :opptyIds];
        for(Opportunity opp : oppList) {
            opp.CloseDate = Date.today();
        }
        update oppList;
    }
}