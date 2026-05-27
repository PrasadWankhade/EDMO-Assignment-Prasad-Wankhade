public class AccountTriggerHandler {
    public static void updateRelatedContacts(List<Account> accList,Map<Id,Account> oldMap){
        
        Map<Id,String> accConMap = new Map<Id,String>();
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            if(acc.Phone != oldMap.get(acc.Id).Phone){
                accConMap.put(acc.Id,acc.Phone);
            }
        }
        if(!accConMap.isEmpty()){
            for(Contact con : [SELECT Id,AccountId FROM Contact
                               WHERE AccountId IN : accConMap.keySet()]){
                    con.Phone = accConMap.get(con.AccountId);
                    conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
}