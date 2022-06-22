public class ContactSearch {
    public static List<Contact> searchForContacts(String firstName, String secondName){
        List<Contact> currentContactList = [
            SELECT	Id,
            		LastName,
            		MailingPostalCode 
            FROM	Contact
            WHERE	LastName =: firstName
            AND		MailingPostalCode =: secondName
        ];
        return currentContactList;
    } 
}