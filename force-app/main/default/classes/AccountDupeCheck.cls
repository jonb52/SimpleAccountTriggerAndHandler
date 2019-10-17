// **************************************************************************************************************************
// This AccountDupeCheck class is used to prevent new Accounts from being created if there is already an account in the 
// database with the same name.
// 
// NOTE: This class will only work to prevent new duplicate accounts from being created, this will not help with 
//       preexisting duplicates. 
// **************************************************************************************************************************

public class AccountDupeCheck {
    public static void dupeCatch(List<Account> newListOfAccounts){
        
        // A set to hold each of the account names that are already in our database. 
        // Data is being returned from the getAccountNames method below
        Set<String> setOfAccountNames = getAccountNames();

        // For loop to check and see if there is already an account in the system with the same name
        for(Account newAccounts : newListOfAccounts){
            if(setOfAccountNames.contains(newAccounts.Name)){
                newAccounts.adderror('Duplicate Account already exists');
            }
        }
    }

    // A private method (only accessable/callable from this class). This method is used return the names of accounts in the DB.   
    private static Set<String> getAccountNames(){
        
        // SOQL query to retreive up to 50000 account records in the database
        List<Account> currentAccounts = [SELECT ID, Name FROM Account LIMIT 50000];
        
        // A empty set to hold each of the account names that are already in our database 
        Set<String> setOfAccountNames = new Set<String>();

        // For loop to add each account name to our set
        for(Account currentAcc : currentAccounts){
            setOfAccountNames.add(currentAcc.Name);
        }

        // Returns the now populated set of account names to the caller
        return setOfAccountNames;
    }
}
