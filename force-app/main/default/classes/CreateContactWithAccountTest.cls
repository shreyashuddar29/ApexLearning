@isTest
private class CreateContactWithAccountTest {
    @isTest
    public static void testCreateContactWithAccount() {

        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Id accId = acc.Id;

        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Contact';
        con.Email = 'testcontact@test.com';
        con.AccountId = accId;

        Test.startTest();
        CreateContactWithAccount.createContactWithAccount(accId, con.FirstName, con.LastName, con.Email);
        Test.stopTest();

        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email, AccountId FROM Contact WHERE AccountId = :acc.Id];
        System.assertEquals(1, contacts.size(), 'One contact should be created');
        System.assertEquals('Test', contacts[0].FirstName);
        System.assertEquals('Contact', contacts[0].LastName);
        System.assertEquals('testcontact@test.com', contacts[0].Email);
        System.assertEquals(accId, contacts[0].AccountId);

    }
}