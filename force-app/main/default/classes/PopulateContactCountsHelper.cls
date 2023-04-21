public class PopulateContactCountsHelper {
    public static void PopulateContactCounts(List<Contact> contacts){
        Set<Id> ids = new Set<Id>();
        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                ids.add(contact.AccountId);//adding ids to a set to avoid duplicated
            }
        }
        List<Account> accountToUpdate = new List<Account>();
        //fetching the total no of contacts with the same account 
        List<AggregateResult> cs = [SELECT AccountId, Count(id) counts FROM Contact WHERE AccountId in: ids GROUP BY AccountId];
        for (AggregateResult  c : cs){
            Account a = [SELECT Id, contact_counts__c FROM Account WHERE Id =: (Id)c.get('AccountId')];
            a.contact_counts__c = (Integer) c.get('counts');//adding the contact count to account object
            accountToUpdate.add(a);
        }
        update accountToUpdate;
	}
}