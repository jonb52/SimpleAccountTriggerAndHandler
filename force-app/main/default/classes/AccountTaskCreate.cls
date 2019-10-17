public class AccountTaskCreate {
    public static void creteTask(List<Account> newListOfAccounts){
       
        // A list to hold each of the tasks getting created in this method
        List<Task> tskList = new List<Task>();

        // For loop to loop each of the accounts and create a task to relate to each account
        for(Account acc : newListOfAccounts){
            // Creates an empty task
            Task tsk = new Task();
            // Sets the task subject
            tsk.Subject = 'Call';
            // Sets the task status
            tsk.Status = 'Not Started';
            // Sets the task priority
            tsk.Priority = 'Normal';
            // Relates the task to the account
            tsk.WhatId = acc.ID;
            // Sets the task due date to five days in the future
            tsk.ActivityDate = Date.today() + 5;
            // Adds the task to the task list to later be inserted into the database
            tskList.add(tsk);
		}

        // If the task list has at least one task, then insert it into the database
	    if(tskList!=null && tskList.size()>0){
			insert tskList;
        }
	}
}