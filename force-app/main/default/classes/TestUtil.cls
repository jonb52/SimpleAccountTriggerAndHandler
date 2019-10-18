// **************************************************************************************************************************
// A TestUtility/TestDataFactory is a single class that contains reusable code for test data creation. 
// 
// Resource: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_utility_classes.htm
// **************************************************************************************************************************

// Be sure to include the '@isTest' annotation to prevent this code from counting against your code coverage.
@isTest
public class TestUtil {
    
    // In this method, several test accounts are being created with all of the required fields and the account(s) is/are being returned to the caller.
    // NOTE: This method is not prefixed with the isTest annotation because it contains an argument and this method is not actually testing anything.
    public static List<Account> createTestAccounts(Integer numOfAccounts, Boolean doInsert){
        // Empty list of accounts to hold our accounts that will be returned to the caller
        List<Account> listOfTestAccounts = new List<Account>();
        
        // For loop to create the specified number of accounts that will get returned to the caller.
        for(Integer i=0; i<numOfAccounts; i++){
            // Initializes an Account
            Account testAccount = new Account();
            // Sets the account name
            testAccount.Name = 'TestAccount'+i;
            // Adds the account to the account list
            listOfTestAccounts.add(testAccount);
        }

        // If statement to determine if the test accounts should be inserted into the database 
        if(doInsert == True && testAccounts.size() > 0){
            insert testAccounts;
        }

        // Returns the list of newly created accounts to the caller
        return listOfTestAccounts;
    }
}