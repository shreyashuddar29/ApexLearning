// Write an Apex class method that performs a dynamic SOQL query based on a string variable for the Account name and returns the matching records.

public with sharing class MatchingRecords {
    public static List<Account> findMatchingRecords(String name) {
        String nameWithoutQuotes = String.escapeSingleQuotes(name);
        String query = 'SELECT Id, Name FROM Account WHERE Name LIKE \'%' + nameWithoutQuotes + '%\'';
        List<Account> matchingAccounts = Database.query(query);
        return matchingAccounts;
    }
}