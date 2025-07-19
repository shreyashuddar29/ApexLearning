// Write an Apex class called ContactManager that retrieves all contacts whose MailingPostalCode is '12345' and updates a custom field Status__c to 'Active' for each.

public with sharing class ContactManager {
    public static void updateContactActiveStatus() {
        List<Contact> conList = [SELECT Id, Status__c FROM Contact WHERE MailingPostalCode = '12345'];
        List<Contact> contactsToUpdate = new List<Contact>();
        for(Contact con : conList){
            if(con.Status__c != 'Active'){
                con.Status__c = 'Active';
                contactsToUpdate.add(con);
            }
        }
        if(!contactsToUpdate.isEmpty()){
            update contactsToUpdate;
        }
    }
}