public class AccountDupeCheck {
    public static void dupeCheck(List<Account> newListOfAccounts){ 
        List<Account> currentAccounts = getAccounts();
        
        Set<String> setOfAccountName = new Set<String>();
        
        for(Account currentAcc : currentAccounts){
            setOfAccountName.add(currentAcc.Name);
        }
        
        for(Account newAccounts : newListOfAccounts){
            if(setOfAccountName.contains(newAccounts.Name)){
                newAccounts.adderror('Duplicate Account already exists');
                return;
            }
        }
    }
    
    public static void print(){
        system.debug('Printing to the debug log');
    }
    
    private static List<Account> getAccounts(){
        List<Account> currentAccounts = [SELECT Id, Name From Account LIMIT 50000];
        return currentAccounts;
    }
	
}