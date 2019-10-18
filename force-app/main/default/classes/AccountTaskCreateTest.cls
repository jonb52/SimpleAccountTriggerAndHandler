// **************************************************************************************************************************
// All test classes must be prefixed with the @isTest annotation. Please note that it is best practice to never use SeeAllData=true. 
// Best practice is to always create your own test data within the test class or by utilizing a TestUtil/DataFactory class
// 
// Resources: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_isTest.htm
//           https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing.htm
// **************************************************************************************************************************

@isTest(SeeAllData=false)
public class AccountTaskCreateTest {

    // Test methods should always be prefixed with @isTest annotation as well. Please note that test methods do not contain any arguments.
    // This test method does not use the TestUtil to create any of the test data/records
    @isTest public static void createTaskTest() {
        // Initializing two empty accounts
        Account acc1 = new Account();
        Account acc2 = new Account();
        // Setting the names of each of the account records
        acc1.Name = 'Acc1';
        acc2.Name = 'Acc2';
        // Initializing a list to hold the two accounts
        List<Account> listOfAccounts= new List<Account>();
        // Inserting both accounts into the list
        listOfAccounts.add(acc1);
        listOfAccounts.add(acc2);

        // Test.startTest() is not required, however it is good practice to use in your test. RESOURCE: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_tools_start_stop_test.htm
        Test.startTest();
            // Inserting the two accounts into our test database
            insert listOfAccounts;
        Test.stopTest();
        // Creates a list to hold all of the Tasks returned from the SOQL query
        List<Task> tskList = [Select Id FROM Task];
        // Assert statement that is stating that the expected size of our task list will only be two (because we only created two test accounts)
        System.assert(tskList.size() == 2);
    }

    // This test method is the exact same as the one above, however, it is using the TestUtil to create the test data/records
    @isTest public static void createTaskTestUsingTestUtil() {
        // Creates a list to hold the Accounts returned from test utility.
        List<Account> listOfAccounts = TestUtil.createTestAccounts(2, false); // 2 is the number of accounts to create, and false is telling the method to not insert the accounts

        Test.startTest();
            insert listOfAccounts;
        Test.stopTest();

        List<Task> tskList = [Select Id FROM Task];

        System.assert(tskList.size() == 2);
    
    }
}