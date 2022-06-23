public class AddPrimaryContact implements Queueable {
    private Contact contact;
	private String state;
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
		this.state = state;
    }
    public void execute(QueueableContext context) {
        List<Contact> contacts = new List<Contact>();
		for (Account account : [
			SELECT	Id
			FROM 	Account
			WHERE 	BillingState =: state
			LIMIT 	200
		]) {
			Contact currentcontact = contact.clone();
			contact.AccountId = account.Id;
			contacts.add(currentcontact);
        }
		insert(contacts);
    }
}