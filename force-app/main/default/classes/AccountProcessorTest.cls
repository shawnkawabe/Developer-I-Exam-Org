@IsTest
public class AccountProcessorTest {
    @testSetup
    public static void setupData(){
        List<Account> accountsTest = new List<Account>();
        //List<Contact> contactsTest = new List<Contact>();
        for (Integer i = 0; i < 5; i++){
            Account accTest = new Account(Name='AccTest'+ i);
            accountsTest.add(accTest);
        }
        // for(Account acctest : accountsTest){
        //     for (Integer j = 0; j < 5; j++){
        //         Contact cttTest = new Contact(FirstName='CttTest', LastName=''+j, Account=acctest);
        //         contactsTest.add(cttTest);
        //     }
        // }
        insert(accountsTest);
        //insert(contactsTest);
        AccountProcessor accProcessor = new AccountProcessor();
    }

    public static void addContacts(Account acc){
        List<Contact> contactsTest = new List<Contact>();
        for (Integer j = 0; j < 5; j++){
            Contact cttTest = new Contact(FirstName='CttTest' + j, LastName='Test'+j, AccountId=acc.Id);
            contactsTest.add(cttTest);
        }
        Database.insert(contactsTest, false);
    }

    @IsTest
    public static void testAccountProcessor() {
        List<Id> accounts = new List<Id>();
        for (Account currentAccount : [
            SELECT	Id
            FROM	Account
            LIMIT   5
        ]) {
            addContacts(currentAccount);
            accounts.add(currentAccount.Id);
        }
        Test.startTest();
            Boolean result = AccountProcessor.countContacts(accounts);
        Test.stopTest();
        for(Account account : [
            SELECT  Id, 
                    Number_Of_Contacts__c
            FROM    Account
            WHERE   Id IN: accounts
        ]){
            System.assertEquals(5, account.Number_Of_Contacts__c, 'The count its wrong in id >> '+ account.Id + ' Number of contacts >>' + account.Number_Of_Contacts__c);
        }
      }
}
