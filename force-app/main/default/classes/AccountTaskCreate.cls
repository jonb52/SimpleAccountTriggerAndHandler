public with sharing class AccountTaskCreate {
    public static void createTask(List<Account> newListOfAccounts) {
        // Initializing a empty list to hold the tasks
        List<Task> tskList = new List<Task>();

        // For loop to loop over each of the accounts in the newListOfAccounts list
        for(Account acc : newListOfAccounts){
            // Creates an empty task
            Task tsk = new Task();
            // Sets the subject to Call
            tsk.Subject = 'Call';
            // Sets the status to Not Started
            tsk.Status = 'Not Started';
            // Sets the priority to Normal
            tsk.Priority = 'Normal';
            // Relates the task to the account
            tsk.WhatId = acc.Id;
            // Sets th due date to 5 days from the creation date
            tsk.ActivityDate = Date.today() + 5;
            // Adds to newly created task to our list
            tskList.add(tsk);
        }
        // Checks to make sure that there is at least one task in the list before inserting
        if(tskList!=null && tskList.size()>0){
            insert tskList;
        }
    }
}
