//Write an Apex class named AccountController that queries all Account records with AnnualRevenue greater than 1,000,000 and returns them as a list.

public with sharing class AccountController {
    public static List<Account> getAccounts() {
        List<Account> accList = [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue > 1000000];
        return accList;
    }
}
