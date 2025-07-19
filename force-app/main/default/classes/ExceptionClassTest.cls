@isTest
public with sharing class ExceptionClassTest {
    @isTest
    public static void validateAnnualRevenueThrowsException() {
        Account acc = new Account(Name = 'Test Account', AnnualRevenue = -200);
        insert acc;
        Boolean exp = false;
        try {
            ExceptionClass.validateAnnualRevenue(acc.Id);
        } catch (ExceptionClass.CustomException e) {
            exp = true;
            System.assertEquals(e.getMessage(), 'Annual Revenue cannot be less than 0');
        }
        System.assert(exp);
    }

    @IsTest
    public static void validateAnnualRevenueDoesNotThrowsException() {
        Account acc = new Account(Name = 'Test Account', AnnualRevenue = 1000);
        insert acc;
        Test.startTest();
        ExceptionClass.validateAnnualRevenue(acc.Id);
        Test.stopTest();
    }
}