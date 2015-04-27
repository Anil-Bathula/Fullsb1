/*****************
Test Class for:Opportunity_SelfUpdate.tgr
Code coverage:-78%
******************/

@isTest
private class Opportunity_SelfUpdate_test{
   
                
       @testSetup static void DataArrange(){  
        String recdtypeid=RecordTypeHelper.getRecordTypeId('Opportunity','Accepted & R');
        String recdtypeid2=RecordTypeHelper.getRecordTypeId('Opportunity','Housing External Opportunity');
        String recdtypeid3=RecordTypeHelper.getRecordTypeId('Opportunity','Confirmation & CAX-D');
        
        String p = RecordTypeHelper.getprofileid('Sitecore SysAdmin');
        
        User u = new User(alias = 'standt', email='standarduserfff6655@testorg.com', 
        firstname='S4S',lastname='Testing', EmailEncodingKey='UTF-8',isActive=True,
        languagelocalekey='en_US', Hult_Department__c='OPS',Regional_Division__c='DUB',
        localesidkey='en_US', profileid = p,TimeZoneSidKey='America/Los_Angeles',
        username='standarduserfff6655@testorg.com');
        insert u;
      
        
        Program__c objPgm=new program__c();
        objPgm.Name='Bachelor of Business Administration-UK-London';
        objPgm.Campus__c='London';
        objPgm.Program_pre_parsed__c='BBA';
        insert objPgm;                
                
        
        Contact objCon = new Contact();
        objcon.LastName='LastName';
        objcon.Applicant_Email__c='workflow2trigger_test@email.com';
        objcon.Program_Primary__c=objPgm.Id;
        insert objCon;   
        
        
        Contact Con = new Contact();
        con.LastName='LastName1';
        con.Applicant_Email__c='workflow2trigger_test2@email.com';
        insert Con;        
        
           
       
        
        Opportunity opp= new Opportunity();
        opp.Name='OpportunityName';
        opp.StageName = 'Accepted';
        opp.Visa_Related_Sub_Stages__c='5a. Visa Approved';
        opp.Contact__c=objCon.id;
        opp.CloseDate = System.today();
        opp.Primary_Campus__c='London';
        opp.Program__c =objPgm.Id;
        opp.recordtypeid=recdtypeid;
        opp.Partial_Application_Date__c=Null;
        opp.Program_and_Location_Tab_Complete__c=false;
        opp.Withdrawn_Date__c=NULL;
        opp.Deferred_Date__c=NULL;
        opp.Accepted_Date__c=NULL;
        opp.Cancellation_Date__c=NULL;
        opp.Q_Lead_Date_N__c=NULL;
        
        insert opp;
        
        
        Opportunity opp1= new Opportunity();
        opp1.Name='OpportunityName1';
        opp1.StageName = 'Rejected';
        opp1.Contact__c=Con.id;
        opp1.CloseDate = System.today();
        opp1.Primary_Campus__c='London';
        insert opp1;
        }
        
        
         public static testMethod void Opp_selfupdate_Test1() {
         
         List<Opportunity>opp=[Select id,name,Primary_Campus__c,StageName,recordtypeid,
                                 Program_and_Location_Tab_Complete__c,
                                 Confirmed_Date__c,Confirmation_Activity__c,
                                 Visa_Related_Sub_Stages__c,
                                 Accommodation_Student_Status__c,Application_Substage__c
                                 From opportunity where contact__r.Name='LastName1' or contact__r.Name='LastName' LIMIT 2 ];
                                 System.debug('===>'+opp.size());
                                 
          user u=[select id,name,alias,email from user where email='standarduserfff6655@testorg.com' ];
          
           String recdtypeid2=RecordTypeHelper.getRecordTypeId('Opportunity','Housing External Opportunity');
       
        opp[0].Program_and_Location_Tab_Complete__c=true;
        opp[0].StageName='Rejected';
        opp[0].Application_Substage__c='Completed Application';
        opp[0].Confirmation_Activity__c='SFO Walk candidate through Accommodation process';
        update opp[0];
        
        System.runAs(u){
         opp[0].StageName='Qualified Lead';
         update opp[0];
        } 
             
        opp[0].StageName='In Progress';
        opp[0].Waived_off_Application_Fee__c=true;
            try{update opp[0];}Catch(Exception e){System.debug(e);}
        
        opp[0].StageName = 'Partial Application';
        opp[0].recordtypeid=recdtypeid2;
        opp[0].Confirmed_Date__c=null;
        opp[0].Confirmation_Activity__c='LDN Walk candidate through Accommodation process';
        opp[0].Accommodation_Student_Status__c='Hult Prospective Student';        
        update opp[0];
        
        opp[0].StageName = 'Confirmed';
        opp[0].Visa_Related_Sub_Stages__c='7c. Arrived according to recruiting';
        update opp[0];
    }
    Public static testmethod void Opp_selfupdate_Test2(){
        List<Opportunity>opp=[Select id,name,Primary_Campus__c,StageName,recordtypeid,
                                 Program_and_Location_Tab_Complete__c,
                                 Confirmed_Date__c,Confirmation_Activity__c,
                                 Visa_Related_Sub_Stages__c,
                                 Accommodation_Student_Status__c,Application_Substage__c
                                 From opportunity where contact__r.Name='LastName1' or contact__r.Name='LastName' LIMIT 2 ];
        
         opp[1].StageName = 'Confirmed';        
        update opp[1];
        
        opp[1].StageName='Soft Rejected';
        update opp[1];
        
        opp[1].stageName='Deferral';
        opp[1].Application_Substage__c='Reactivated – Paid';
        Update opp[1];
        
        opp[1].stageName='Withdrawn';       
        Update opp[1];
        
        opp[1].StageName='Conditionally Accepted';        
        Update opp[1];
        
        opp[1].StageName='Cancellation';
        Update opp[1];
    }
}