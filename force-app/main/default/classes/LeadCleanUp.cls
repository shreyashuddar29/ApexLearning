// Write an Apex class called LeadCleanup with a method that deletes all Lead records that were created more than one year ago.

public with sharing class LeadCleanUp {
    @future
    public static void leadCleanUp() {
        Date cutoffDate = Date.today().addYears(-1);
        List<Lead> leads = [SELECT Id, Name FROM Lead WHERE CreatedDate < :cutoffDate];
        if(!leads.isEmpty()){
            delete leads;
        } 
    }
}