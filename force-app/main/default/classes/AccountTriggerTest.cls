@isTest
private class AccountTriggerTest {

    @isTest private static void accountInsertTest() {

        Account acc = new Account();
        acc.Name = 'WhateverIwant';
        insert acc;

        System.assert(acc.Id != null);

        List<Account> accList = [SELECT Id FROM Account];
        System.assert(accList.size() == 1);
    }

}
