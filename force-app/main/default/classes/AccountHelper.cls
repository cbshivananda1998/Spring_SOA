public with sharing class AccountHelper {
    //get the latest 10 records of account
    @AuraEnabled(cacheable=true)
    public static List<Account> getLatestAccounts() {
        List<Account> accounts = [SELECT Id,Name,AccountNumber,CreatedDate FROM ACCOUNT ORDER BY CreatedDate DESC LIMIT 10];
        return accounts;
    }
}