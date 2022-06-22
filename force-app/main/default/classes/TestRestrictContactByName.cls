@isTest
public class TestRestrictContactByName {
    @isTest static void TestRestrictedContact(){
        Contact currentContact = new Contact(
        	FirstName 	= 	'firstName',
            LastName	=	'INVALIDNAME'
        ); 
        insert currentContact;
    }
}