@isTest
public with sharing class AccountControllerTest {
    @isTest
    public static void testGetAccount() {
        List<Account> testAcc = new List<Account>{
            new Account(Name = 'Test Account 1', AnnualRevenue = 2000000),
            new Account(Name = 'Test Account 2', AnnualRevenue = 1500000),
            new Account(Name = 'Test Account 3', AnnualRevenue = 300000)
        };
        insert testAcc;
        List<Account> result = AccountController.getAccounts();
        System.AssertEquals(2, result.size(), 'Only the 2 accounts with annual revenue > 1 million are returned');
        Set<String> returnedNames = new Set<String>();
        for(Account acc : result) {
            returnedNames.add(acc.Name);
        }
        System.Assert(returnedNames.contains('Test Account 1'));
        System.Assert(returnedNames.contains('Test Account 2'));
        System.Assert(!returnedNames.contains('Test Account 3'));
    }
}
