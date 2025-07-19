@isTest
public with sharing class MatchingRecordsTest {
    @isTest
    public static void testFindMatchingRecords() {
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name = 'Tech and Transform'));
        accList.add(new Account(Name = 'Sun Technologies'));
        accList.add(new Account(Name = 'Should not match'));
        insert accList;
        List<Account> result = MatchingRecords.findMatchingRecords('Tech');
        System.assertEquals(2, result.size());
        for(Account acc : result){
            System.assert(acc.Name.contains('Tech'));
        }
    }
}