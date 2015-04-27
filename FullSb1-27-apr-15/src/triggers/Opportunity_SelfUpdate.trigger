/*******************************************************
Trigger   : workflow2trigger
Developer : Anil.B
Purpose   : To deactivate some workflows and use those 
workflow functionality in this trigger becoz of workflow
limits reached to maximum.
Test Class :workflow2trigger_Test(84%)
Modified by   : Prem 25/06/2014 (SFSUP-744)
Modified By    : Anil.B 11/07/2014   (SFSUP-751)
Modified By    : Anil.B 15/07/2014   (SFSUP-753)
Modified By    : Anil.B 09/10/2014  changed program parsed from BIBA to BBA by using custom_lables class.(alias:Parsed)

Modified By    : Harsha 14/07/2014   (alias : extrec)

Modified by   : Prem 25/06/2014 (SFSUP-744)
               Changed program parsed from "Masters" to "MBA" --SFSUP-751
              Here we are opening accomidation status for MBA and BIBA Programs
When Opportunity of external Housing record type is created/Updated then
it should contain a contact and then it's contact should also be of External Housing Record Type.
Test class for extrec functionality  :: TestClass    : Test_Ext_Housing(33%)
 
Modified by    : Harsha 4/16/2015 (alias : waive_appfee)
                 When Application Fee is Waived, set few fields.
                 set Linkedin status of Opportunity from Contact when contact is updated.   

Modified by    : Harsha 4/17/2015 (alias :curencyiso)
                 set Currencyiso code=programcurrency.
********************************************************/


trigger Opportunity_SelfUpdate on Opportunity (before insert,before update) 
{       
    set<string> oppids_check_ctct_rectype=new set<String>();//extrec 7/14/2014  
    String API_user=userinfo.getfirstname();
    String profile_Name=RecordTypeHelper.getprofilename(userinfo.getProfileId());
    set<string> linkedin_Status=new set<String>();
    set<string> Update_accountId=new set<String>();
    set<string> waiveoff_profiles=new set<String>{'Sales-Product Head','Sales-Global Product Head','Sales-Regional Head',
        'Finance-Manager','System Administrator','9.4 HULT Super User'};
        
     for(Opportunity opp:Trigger.New){
        
        Opportunity oldopp=trigger.isUpdate?Trigger.oldmap.get(opp.id):new Opportunity(); 
         If(RecordTypeHelper.isapplicationprocessrecordtype(opp.recordtypeid))
         {
            if(trigger.isUpdate && trigger.Isbefore)
            {
                
                /*Workflow::Set Accommodation Stage to 1,SFSUP-744,SFSUP-751*/
                if(opp.Confirmation_Activity__c!=oldopp.Confirmation_Activity__c &&
                  (opp.Program_Parsed__c ==custom_lables.Bachelor_Pgm_abvtn ||opp.Program_Parsed__c =='Masters'|| opp.Program_Parsed__c =='MBA') &&
                  (opp.Confirmation_Activity__c=='LDN Walk candidate through Accommodation process'||
                   opp.Confirmation_Activity__c=='SFO Walk candidate through Accommodation process') ){
               
                        opp.Accommodation_Status__c='1. Recruiter presented Hult accom.';
                        opp.Accom_Stage_1_date_time__c=system.now();            
                }
                /*alias:Parsed*/
                If(opp.Program__c!=oldopp.Program__c && opp.Campus_parsed_from_Program__c!=NULL && opp.Program_pre_Parsed__c!=NULL){
                    opp.Campus_Program__c=opp.Campus_parsed_from_Program__c+'-'+opp.Program_pre_Parsed__c;
                }
                
                /*Start of SFSUP-898*/
                if(opp.stageName=='Qualified Lead' && opp.Q_Lead_Date_N__c==NULL ){
                    Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                    DateTime D = DateTime.newInstance(opp.createdDate.getTime() + tz.getOffset(opp.createdDate));
                    opp.Q_Lead_Date_N__c=date.valueof(d); 
                
                }
                /*End of SFSUP-898*/
                
                /*Start of SFSUP-1012 -SFSUP-1013 (5 condition-- 10 condition)*/
                if((opp.stageName=='Cancellation'||opp.stageName=='Deferral' ||opp.stageName=='Withdrawn') && 
                Oldopp.Application_Substage__c!=opp.Application_Substage__c &&
                 (opp.Application_Substage__c=='Reactivated – Paid' ||opp.Application_Substage__c=='Reactivated – Waived' )){
                 
                        Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                        DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));  
                        if((opp.stageName=='Cancellation'||opp.stageName=='Deferral')){                         
                            opp.Confirmed_Date__c=date.valueof(d); 
                            opp.Confirmed_date_time__c=System.Now();    
                        }
                        
                       else if(opp.stageName=='Withdrawn'&&(opp.Application_Substage__c=='Reactivated – Paid' ||opp.Application_Substage__c=='Reactivated – Waived' )){
                            opp.Partial_Application_Date__c=date.valueof(d); 
                            opp.Partial_Application_date_time__c=System.Now();
                        }           
                
                }
                /*End of SFSUP-1012*/
                
                /*Workflow:: Application In Progress  SFSUP-897*/
                if((opp.Program_and_Location_Tab_Complete__c!=oldopp.Program_and_Location_Tab_Complete__c ||
                    opp.StageName!=oldopp.StageName)&&
                    opp.Program_and_Location_Tab_Complete__c==True && opp.StageName=='Qualified Lead' && API_user=='S4S' ){
                    
                        If(opp.In_Progress_Date__c==NULL){
                        
                                Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                                DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                                opp.In_Progress_Date__c=date.valueof(d); 
                                opp.In_Progress_date_time__c=System.Now();
                         }
                        opp.StageName='In Progress';
                        /*Start SFSUP-897*/
                        opp.Deferred_Date__c=NULL;
                        opp.Deferred_date_time__c=NULL;
                        opp.Cancellation_Date__c=NULL;
                        opp.Date_Time_Cancellation__c=NULL;
                        opp.Confirmed_Date__c=NULL;
                        opp.Confirmed_date_time__c=NULL;
                        opp.Withdrawn_Date__c=NULL;
                        opp.Partial_Application_Date__c=NULL;
                        opp.Partial_Application_date_time__c=NULL;
                         /*END SFSUP-897*/
                }else if(opp.StageName!=oldopp.StageName && opp.StageName=='In Progress' && API_user!='S4S' &&opp.In_Progress_Date__c==NULL){
                        
                        Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                        DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                        opp.In_Progress_Date__c=date.valueof(d); 
                        opp.In_Progress_date_time__c=System.Now();
                         
                } //end of SFSUP-897
                    
                
               
              
            /*Workflow::Datestamp Partial Application */
            if(opp.StageName!=oldopp.StageName && opp.StageName=='Partial Application'){
            
                                 
                     If(opp.Partial_Application_Date__c==Null){   
                        Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                        DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                        opp.Partial_Application_Date__c=date.valueof(d); 
                        opp.Partial_Application_date_time__c=System.Now();                        
                        
                        /*start of SFSUP-895*/
                        opp.Deferred_Date__c=Null;
                        opp.Deferred_date_time__c=Null;
                        opp.Cancellation_Date__c=Null;
                        opp.Date_Time_Cancellation__c=Null;
                        opp.Confirmed_Date__c=Null;
                        opp.Confirmed_date_time__c=Null;
                        opp.Withdrawn_Date__c=Null;
                        /*END of SFSUP-895*/
                     }else if(oldopp.StageName=='Withdrawn'){
                         /*start of SFSUP-895*/
                        opp.Deferred_Date__c=Null;
                        opp.Deferred_date_time__c=Null;
                        opp.Cancellation_Date__c=Null;
                        opp.Date_Time_Cancellation__c=Null;
                        opp.Confirmed_Date__c=Null;
                        opp.Confirmed_date_time__c=Null;
                        opp.Withdrawn_Date__c=Null;
                        /*END of SFSUP-895*/
                         
                     }

                
            }/*Workflow::Application Confirmed*/
            else if(opp.StageName!=oldopp.StageName && 
                    (opp.StageName=='Admissions Endorsed Confirmed'||
                     opp.StageName=='Waitlisted Confirmed'||
                     opp.StageName=='Conditionally Confirmed'||
                     opp.StageName=='Confirmed'||
                     opp.StageName=='Soft Rejected Confirmed')){
                    
                        IF(opp.Confirmed_Date__c==NULL){
                            Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                            DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                            opp.Confirmed_Date__c=date.valueof(d); 
                            opp.Confirmed_date_time__c=System.Now();
                            /*Start SFSUP-894*/
                            opp.Deferred_Date__c=Null;
                            opp.Deferred_date_time__c=Null;
                            opp.Cancellation_Date__c=Null;
                            opp.Date_Time_Cancellation__c=Null;
                            opp.Withdrawn_Date__c=Null;
                            /*End SFSUP-894*/
                        }else if((oldopp.StageName=='Cancellation'||oldopp.StageName=='Deferral')&& opp.StageName=='Confirmed'){
                            opp.Deferred_Date__c=Null;
                            opp.Deferred_date_time__c=Null;
                            opp.Cancellation_Date__c=Null;
                            opp.Date_Time_Cancellation__c=Null;
                            opp.Withdrawn_Date__c=Null;
                        }

                    
            }/*Workflow::Application Accepted*/
             else if(opp.StageName!=oldopp.StageName &&                    
                    (opp.StageName=='Conditionally Accepted'||
                     opp.StageName=='Accepted'||
                     opp.StageName=='Soft Rejected')&&
                     opp.Accepted_Date__c==NULL){                         
                     
                         Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                         DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                         opp.Accepted_Date__c=date.valueof(d); 
                         opp.date_time_Accepted__c=System.now();
                         
             }/*Workflow::Application Cancelled*/
             else if(opp.StageName!=oldopp.StageName &&                     
                     opp.StageName=='Cancellation'&&
                     opp.Cancellation_Date__c==NULL){
                     
                        Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                        DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                        opp.Cancellation_Date__c=date.valueof(d); 
                        opp.Date_Time_Cancellation__c=System.Now();
                        /*Start -SFSUP-893*/
                        opp.Deferred_Date__c=Null;
                        opp.Deferred_date_time__c=Null;
                        opp.Withdrawn_Date__c=Null;                        
                        /*Start -SFSUP-893*/
                     
              }/*Workflow::Application Deferred*/
              else if(opp.StageName!=oldopp.StageName &&                      
                      opp.StageName=='Deferral'&&
                      opp.Deferred_Date__c==NULL){
                     
                        Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                        DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                        opp.Deferred_Date__c=date.valueof(d); 
                        opp.Deferred_date_time__c=System.Now();
                        opp.Deferred__c=True;
                        /*Start -SFSUP-892*/
                        opp.Cancellation_Date__c=Null;
                        opp.Date_Time_Cancellation__c=Null;
                        opp.Withdrawn_Date__c=Null;                        
                        /*End -SFSUP-892*/
                         
              }/*Workflow::Application Withdrawn*/
              else if(opp.StageName!=oldopp.StageName &&                      
                      opp.StageName=='Withdrawn'&&
                      opp.Withdrawn_Date__c==NULL){                      
                     
                        Timezone tz = Timezone.getTimeZone('America/Los_Angeles');
                        DateTime D = DateTime.newInstance(System.Now().getTime() + tz.getOffset(System.Now()));
                        opp.Withdrawn_Date__c=date.valueof(d); 
                        
                        /*Start SFSUP-896*/
                        opp.Deferred_Date__c=Null;
                        opp.Deferred_date_time__c=Null;
                        opp.Cancellation_Date__c=Null;
                        opp.Date_Time_Cancellation__c=Null;
                        opp.Confirmed_Date__c=Null;
                        opp.Confirmed_date_time__c=Null;
                        /*End SFSUP-896*/
                         
              }
              
              //start:set opp AccountId 
              if(opp.Program__c!=null && (opp.AccountId==null || opp.Program__c!=oldopp.Program__c))
              {
                    Update_accountId.add(opp.Id);
                    System.DEbug('1====='+Update_accountId);
              }//end:set opp AccountId
              
             if(oldopp.contact__c==null && opp.Contact__c!=null || oldopp.Linked_In_Status_New__c==null)
             {
                linkedin_Status.add(opp.Id);                
             }  
             //start:waive_appfee 
             if(opp.Waived_off_Application_Fee__c && opp.Waived_off_Application_Fee__c!=oldopp.Waived_off_Application_Fee__c &&
             !avoid_recursive_syncctctopp_trigg.has_appfee_alreadywaived(opp.id))
             {  
                if(opp.StageName=='Qualified Lead' || opp.StageName=='In Progress')
                {   //shs :31/7/2013 included some more fields in the assignment.
                    if(waiveoff_profiles.contains(RecordTypeHelper.getprofilename(Userinfo.getProfileId())))
                    {   
                        opp.Application_Fee_Waived_By__c=Userinfo.getUserId();
                        opp.Paid_Application_Fee__c=true;
                        opp.Final_Submission_Tab_Complete__c=true;
                        opp.Application_Fee_Complete__c=true;
                        opp.StageName='Partial Application';
                        avoid_recursive_syncctctopp_trigg.set_appfee_waived(opp.id);
                    }
                    else
                    {                       
                        opp.Application_Fee_Waived_By__c.addError('The user waiving the'+
                        ' fee must be either a Product, Regional, or Global Head, a member of Finance, or a System Admin');
                    }
                }
                else
                {
                    opp.Waived_off_Application_Fee__c.addError('Application Fee Can be Waived'+
                         ' only in Qualified Lead or In Progress Stage');
                }
                    
             }//end:waive_appfee  
            
            }  //end is before update if cond.    
            
            /*start: This code is from updateprimarycampus trigger we have deactivated that and made it into one trigger*/ 
            If(opp.Campus_parsed_from_Program__c!=opp.Primary_Campus__c){
                opp.Primary_Campus__c=opp.Campus_parsed_from_Program__c;
            }    
            if(opp.program__c!=oldopp.program__c && opp.Program_Parsed__c!=Null){
                opp.Program_Parsed_picklist__c=opp.Program_Parsed__c;
            }
            /*End:updateprimarycampus */
           
            /*start: updatecurrencytrigg*/ 
            if((opp.Program_Currency__c!=null && opp.CurrencyIsoCode!= opp.Program_Currency__c)||
              (opp.Start_term__c!=oldopp.Start_term__c && opp.Start_term__c!=Null)||
             (opp.Primary_Campus__c!=oldopp.Primary_Campus__c))
            {   
                opp.CurrencyIsoCode= opp.Program_Currency__c; 
            }
            /*End:updatecurrencytrigg */ 
            
             
         }  //end is app rec. type if cond.
         
         //Start : extrec 7/14/2014
         if(Trigger.isBefore)
         {
            if(Trigger.isUpdate && opp.Contact__c==null && 
               opp.RecordTypeId==RecordTypeHelper.getRecordTypeId('Opportunity','Housing External Opportunity'))
            {
                opp.addError('Opportunity should have contact.');
            }
            if(opp.RecordTypeId!=oldopp.RecordTypeId && 
               opp.RecordTypeId==RecordTypeHelper.getRecordTypeId('Opportunity','Housing External Opportunity'))
            {
                oppids_check_ctct_rectype.add(opp.Id);
            }
            if(opp.RecordTypeId!=oldopp.RecordTypeId && 
               oldopp.RecordTypeId==RecordTypeHelper.getRecordTypeId('Opportunity','Housing External Opportunity'))//8/7/2014
            {
                opp.AddError('Opportunity and Contact Record Types need to be same for External Housing : '+opp.Id);
            }
            
         }//End : extrec 7/14/2014
         
     }//Trigger For loop Ends       
     
     //Start: extrec 7/14/2014
     if(!oppids_check_ctct_rectype.isEmpty() || !Update_accountId.Isempty() || !linkedin_Status.IsEmpty())
     {
        string ctct_ext_hsng_recid=RecordTypeHelper.getRecordTypeId('Contact', 'Housing External Customer');
        for(opportunity o:[select id,contact__c,AccountId,Program__r.Account__c,Contact__r.RecordTypeId,Contact__r.Linked_In_Status__c 
         from Opportunity where id IN:oppids_check_ctct_rectype or id IN:Update_accountId or id IN:linkedin_Status])
        {
            if(!oppids_check_ctct_rectype.Isempty()&& oppids_check_ctct_rectype.contains(o.Id) && o.Contact__r.RecordTypeId!=ctct_ext_hsng_recid)
            {
                o.AddError('Opportunity and Contact Record Types are not same for Housing External Opportunity : '+o.Id);
            }
            System.DEbug(Update_accountId.contains(o.Id)+'3====='+!Update_accountId.Isempty()+'======'+o.Program__r.Account__c);
            if(!Update_accountId.Isempty()&& Update_accountId.contains(o.Id) && o.Program__r.Account__c!=null)
            {
                //o.AccountId=o.Program__r.Account__c;
                Trigger.newMap.get(o.Id).AccountId=o.Program__r.Account__c;
                
                
            }
            if(!linkedin_Status.isEmpty()&&linkedin_Status.contains(o.Id))
            {
                Trigger.newMap.get(o.Id).Linked_In_Status_New__c=o.Contact__r.Linked_In_Status__c==null?'Not on Linked In':o.Contact__r.Linked_In_Status__c;
            }
        }
            
     }
     //End: extrec 7/14/2014
     
     
     
}