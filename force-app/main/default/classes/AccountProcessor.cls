public class AccountProcessor {
	@future
    public static void countContacts(List<Id> listAccountData){
        List<Account> currentUpdateAccountList = new List<Account>();
        
        for(Id currentId : listAccountData){
            Integer currentCountAccountContacts = [
                SELECT COUNT()
				FROM Contact, Contact.Account
				WHERE Account.Id =: currentId
            ];
            Account currentAccount = new Account(Id=currentId, Number_Of_Contacts__c=currentCountAccountContacts);
            currentUpdateAccountList.add(currentAccount);
        }
        update currentUpdateAccountList;
    }
}