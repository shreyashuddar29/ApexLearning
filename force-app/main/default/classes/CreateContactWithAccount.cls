//Write an Apex method to insert a new Contact record with the fields FirstName, LastName, and Email, and associate it with an existing Account ID provided as a parameter.

public with sharing class CreateContactWithAccount {
    public static void createContactWithAccount(Id accountId, String firstname, String lastname, String email) {
        if(String.isBlank(accountId) || String.isBlank(firstname) || String.isBlank(lastname) || String.isBlank(email) ){
            System.debug('All fields are mandatory');
        }
        Contact con = new Contact();
        con.FirstName = firstname;
        con.LastName = lastname;
        con.Email = email;
        con.AccountId = accountID;
        insert con;
    }
}