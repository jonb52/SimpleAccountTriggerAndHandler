@isTest
private class AccountTaskCreateTest {
     @isTest private static void createTaskTest() {
        Account acc1 = new Account();
        Account acc2 = new Account();

        acc1.Name = 'Acc1';
        acc2.Name = 'Acc2';

        List<Account> listOfAccounts= new List<Account>();
        listOfAccounts.add(acc1);
        listOfAccounts.add(acc2);

        Test.startTest();
            insert listOfAccounts;
        Test.stopTest();

        List<Task> tskList = [Select Id FROM Task];

        System.assert(tskList.size() == 2);
    
    }
}