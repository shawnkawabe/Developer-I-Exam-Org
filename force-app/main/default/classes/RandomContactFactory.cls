public class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer Parameter1,String Parameter2){
        List<Contact> resultContactList = new List<Contact>();
        for(Integer i = 0; i < Parameter1; i++){
            Contact currentNewContact = new Contact(
            	FirstName 	= 'Test' + ' ' + i + 1,
                LastName	= Parameter2
            ); 
            resultContactList.add(currentNewContact);
        }
        return resultContactList;
    }
}