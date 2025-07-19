@isTest
public with sharing class AccountWithIndustryTest {
    @isTest
    public static void testGetAccountIndustry() {
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name = 'Test Account1', Industry = 'Technology'));
        accList.add(new Account(Name = 'Test Account2', Industry = 'Banking'));
        accList.add(new Account(Name = 'Test Account3', Industry = 'Technology'));
        insert accList;
        
        Test.startTest();
        AccountWithIndustry.getAccoutIndustry();
        Test.stopTest();

        List<Account> result = [SELECT Id, Name, Industry FROM Account WHERE Industry = 'Technology'];
        System.assertEquals(2, result.size());
    }
}