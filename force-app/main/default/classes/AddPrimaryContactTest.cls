@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        accounts.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account NY'+i,
				BillingState = 'NY'
            ));
        }
		for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account CA'+i,
				BillingState = 'CA'
            ));
        }
        insert accounts;
    }
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        Contact testContact = new Contact(
			LastName = 'CA Contact'
		);
        // Create our Queueable instance
        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(testContact, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(addPrimaryContact);
        Test.stopTest();
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from contact where Account.BillingState = 'CA']);
    }
}