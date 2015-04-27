global class DeleteMailinatorLeads implements Database.Batchable<sobject> ,Database.Stateful
{
  global String LeadQuery;
  
  public DeleteMailinatorLeads(String q){
      this.LeadQuery = q;
  }
  
  global Database.QueryLocator start(Database.BatchableContext BC){
      system.debug(LeadQuery);
      return Database.getQueryLocator(LeadQuery);
  }
   
  global void execute(Database.BatchableContext BC,List<sobject> leadsScope){
      try{
          delete leadsScope;
      }
      catch(Exception e){
          System.Debug('Exception while deleting Leads'+e);
      }    
  } 
  
   global void finish(Database.BatchableContext BC){ 
       
       System.Debug(LoggingLevel.WARN,'Deleting Individual Email Results Finished');
   }
}