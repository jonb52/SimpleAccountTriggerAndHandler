public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newListOfAccounts){
        AccountDupeCheck.dupeCheck(newListOfAccounts);
    }

    public static void afterInsert(List<Account> newListOfAccounts){
        // We'll add a call to a class here that will create a task for five days in the future.
        // This will have to be done in the after insert because we will need access to the Account ID as we'll want to relate the task to the account
        AccountTaskCreate.createTask(newListOfAccounts);
    }

    public static void beforeUpdate(List<Account> newListOfAccounts){
        // Do something
    }

    public static void afterUpdate(List<Account> newListOfAccounts){
        // Do something
    }
}