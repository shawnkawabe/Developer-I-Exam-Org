public without sharing class AccountProcessor {
	@future(callout=true)
    public static void countContactsAsync(List<Id> listAccountData){
        List<Account> currentUpdateAccountList = new List<Account>();
        
        for(Id currentId : listAccountData){
            List<Contact> currentCountAccountContacts = [
                SELECT Id
				FROM Contact
				WHERE Account.Id =: currentId
            ];
            Account currentAccount = new Account(Id=currentId, Number_Of_Contacts__c=currentCountAccountContacts.size());
            System.debug(currentCountAccountContacts.size());
            currentUpdateAccountList.add(currentAccount);
        }

        update currentUpdateAccountList;
    }

    public static Boolean countContacts(List<Id> listAccountData){
        System.debug(listAccountData.size());
        countContactsAsync(listAccountData);
        return true;
    }

}