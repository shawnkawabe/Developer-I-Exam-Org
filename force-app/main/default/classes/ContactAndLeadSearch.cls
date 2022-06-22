public class ContactAndLeadSearch {
	public static List<List<sObject>> searchContactsAndLeads (String lastName){
        List<List<sObject>> searchList = [FIND :lastName IN ALL FIELDS
                    RETURNING Lead(Name,LastName),Contact(FirstName,LastName,Department)];
        return searchList;
    } 
}