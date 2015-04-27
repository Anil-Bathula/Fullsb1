/******************************************************************************
Class: BulkDeleteMailinatorLeadsAndContacts
Author: Sambit Pattanaik
Purpose:To Schedule the batch apex for deleting the Records from Lead and Contact objects that have mailinator email address
******************************************************************************/

global class BulkDeleteMailinatorLeadsAndContacts Implements Schedulable{

public static String CRON_EXP = '0 0 0 3 9 ? 2022';
/*Method to query for the records to delete */

     global void Execute(SchedulableContext SC){  
       string LeadQuery = 'SELECT Id, Name FROM Lead WHERE Email LIKE \'%@mailinator%\' AND CreatedDate < TODAY-2 limit 200000';
       DeleteMailinatorLeads leadRecs = new DeleteMailinatorLeads(LeadQuery);
       database.executebatch(leadRecs);
       
       string ContactQuery = 'SELECT Id, Name FROM Contact WHERE Email LIKE \'%@mailinator%\' AND CreatedDate < TODAY-2 limit 200000';
       DeleteMailinatorContacts ContactRecs = new DeleteMailinatorContacts(ContactQuery);
       database.executebatch(ContactRecs);
     }     
}