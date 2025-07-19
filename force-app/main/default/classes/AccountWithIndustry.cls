// Write an Apex class that executes a SOQL query to find all Accounts with Industry = 'Technology' and logs the number of accounts found using System.debug.

public with sharing class AccountWithIndustry {
    public static void getAccoutIndustry() {
        List<Account> accList = [SELECT Id, Name, Industry FROM Account WHERE Industry = 'Technology'];
        system.debug(accList.size());
        for(Account acc : accList) {
            System.debug(acc);
        }
    }
}