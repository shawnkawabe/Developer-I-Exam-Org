@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String AccountId = request.requestURI.substringBetween('Accounts/', '/contacts');
		Account result = [
			SELECT 	Id, Name,(SELECT Id, FirstName, LastName FROM Contacts)
            FROM 	Account
            WHERE 	Id = :AccountId];
		System.debug(AccountId);
        return result;
    }
}
