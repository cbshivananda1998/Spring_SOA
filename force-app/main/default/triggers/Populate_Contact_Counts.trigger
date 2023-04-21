trigger Populate_Contact_Counts on Contact (after insert, after update, after delete, after undelete) {
    List<Contact> contacts = new List<Contact>();
    if(Trigger.isDelete){
        contacts=Trigger.old;
    }else{
    	contacts=Trigger.new;
    }
	PopulateContactCountsHelper.PopulateContactCounts(contacts);
}