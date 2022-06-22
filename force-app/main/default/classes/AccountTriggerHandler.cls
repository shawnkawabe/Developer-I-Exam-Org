public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accountList){
        for(Account currentAccount : accountList){
            if(currentAccount.ShippingState != currentAccount.BillingState){
            	currentAccount.ShippingState = currentAccount.BillingState; 
            }
        }
    }
}