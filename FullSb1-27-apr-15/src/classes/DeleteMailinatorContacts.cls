global class DeleteMailinatorContacts implements Database.Batchable<sobject> ,Database.Stateful
{
  global String ContactQuery;
  
  public DeleteMailinatorContacts(String q){
      this.ContactQuery = q;
  }
  
  global Database.QueryLocator start(Database.BatchableContext BC){
      system.debug(ContactQuery);
      return Database.getQueryLocator(ContactQuery);
  }
   
  global void execute(Database.BatchableContext BC,List<sobject> ContactsScope){
      try{
          delete ContactsScope;
      }
      catch(Exception e){
          System.Debug('Exception while deleting Contacts'+e);
      }    
  } 
  
   global void finish(Database.BatchableContext BC){ 
       
       System.Debug(LoggingLevel.WARN,'Deleting Individual Email Results Finished');
   }
}