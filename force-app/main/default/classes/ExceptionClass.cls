public with sharing class ExceptionClass {
    public class CustomException extends Exception {}

    public static void validateAnnualRevenue(Id accId) {
        Account acc = [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id = :accId LIMIT 1];
        if(acc.AnnualRevenue < 0) {
            throw new  CustomException('Annual Revenue cannot be less than 0');
        }
        System.debug('The Annual Revenue is ' +acc.AnnualRevenue);
    }
}