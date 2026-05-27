public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id,Name,Phone,Rating FROM Account WITH USER_MODE];
    }

    @AuraEnabled
    public static List<Account> getAccountsWithImperatively() {
        return [SELECT Id,Name,Phone,Rating FROM Account WITH USER_MODE LIMIT 10];
    }
}