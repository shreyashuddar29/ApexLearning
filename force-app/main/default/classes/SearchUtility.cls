public with sharing class SearchUtility {
    public static List<Contact> searchRecordByLastName(String search) {
        String lastName = String.escapeSingleQuotes(search);
        List<List<Contact>> conList = [FIND :lastName IN NAME FIELDS RETURNING Contact(FirstName, LastName, Id)];
        return (List<Contact>)conList[0];
    }
}