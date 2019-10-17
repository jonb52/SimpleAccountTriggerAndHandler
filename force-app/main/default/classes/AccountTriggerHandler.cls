// **************************************************************************************************************************
// Boilerplate for a trigger handler.
//
// You will want to have individual methods/functions to handle the execution of your code.
// The standard naming convention for naming classes in apex is to use CamelCase, capitalizing the first letter.
// **************************************************************************************************************************


public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newListOfAccounts){
        AccountDupeCheck.dupeCheck(newListOfAccounts);
    }

    public static void afterInsert(List<Account> newListOfAccounts){
        AccountTaskCreate.createTask(newListOfAccounts);
    }

    public static void beforeUpdate(List<Account> newListOfAccounts){
        // Call class to perform the desired operation
    }

    public static void afterUpdate(List<Account> newListOfAccounts){
        // Call class to perform the desired operation
    }
}