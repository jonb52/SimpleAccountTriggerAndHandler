// **************************************************************************************************************************
// All test classes must be prefixed with the @isTest annotation. Please note that it is best practice to never use SeeAllData=true. 
// Best practice is to always create your own test data within the test class or by utilizing a TestUtil/DataFactory class
// 
// Resources: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_isTest.htm
//           https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing.htm
// **************************************************************************************************************************

@isTest(SeeAllData=false)
public class AccountTriggerTest {

    // Test methods should always be prefixed with @isTest annotation as well. Please note that test methods do not contain any arguments.
    // This test method does not use the TestUtil to create any of the test data/records
    @isTest public static void accountInsertTest() {
        // Initializing an empty accounts
        Account acc = new Account();
        // Setting the name of the account
        acc.Name = 'WhateverIwant';
        
        // Test.startTest() is not required, however it is good practice to use in your test. RESOURCE: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_tools_start_stop_test.htm
        Test.startTest();
            // Inserting the account into our test database
            insert acc;
        Test.stopTest();

        // Because our account has been inserted into the database, we are asserting below that the Id is not null.
        System.assert(acc.Id != null);

        // Querying the database for all accounts and storing them in the accList variable
        List<Account> accList = [SELECT Id FROM Account];
        // Because we only inserted one account into the database, we are asserting that the size of our accList is only 1 
        System.assert(accList.size() == 1);
    }

    // This test method is the exact same as the one above, however, it is using the TestUtil to create the test data/records
     @isTest public static void accountInsertTestUsingTestUtil(){
         // Creates a list to hold the Accounts returned from test utility. 
        List<Account> listOfAccounts = TestUtil.createTestAccounts(1, true); // 1 is the number of accounts to create, and true is telling the method to insert the account into the test database.

        // Querying the database for all accounts and storing them in the accList variable
        List<Account> accList = [SELECT Id FROM Account];
        // Because our test util only inserted one account into the database, we are asserting that the size of our accList is only 1 
        System.assert(accList.size() == 1);    
    }

}