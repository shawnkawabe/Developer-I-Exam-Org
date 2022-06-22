public with sharing class AccountHandler {
    public static Account insertNewAccount(String accountName){
        Account currentInsertedAccount = new Account(Name=accountName);
        try{
            insert currentInsertedAccount;
           }
        catch(Exception e){
            System.debug(e.getMessage());
            return null;
        }
        return currentInsertedAccount;
    }
}