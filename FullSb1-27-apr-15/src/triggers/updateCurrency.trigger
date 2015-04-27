// Trigger for update Currency of Finance Object when the campus changed.
/*************************************************************************
Trigger  : UpdateCurrency
Purpose  :To send Email to 3 users when a primary program is changed and 
stage name is confirmed and Admissions Endorsed Confirmed and Go_Ed_Loan_Amount__c>0
And also update isocurrency code of opportunity on finance record.
Developer :Anil.B
Modified by: Anil.B on 15/11/2013---JIRA No:::SFSUP-672.
Test class:Fees_Test

Modified by shs on 7/3/2014 for SFSUP-745

Modified:  Harsha 8/8/2014 to set opportunity currency as program currency. (alias: set_curr)
            for this added before update to trigger & added condition before update : updates opp currency, after update updates fin currency. 
            
Modified:  Harsha 23/9/2014  Mail:: FW: Campus Change 1200880, GbolahanAminu
Can you please remove Chris & Ambjorn from these emails and add Thomas and Sid instead- Thanks a lot, Best, Elias

Modified:  Harsha 21/1/2015 Fixed Bug: When Opportunity is created currency iso code will not set as trigger fires on before update and checks is primary campus changed 
Condition, but for few cases on insert only program is set. This causing issue.
Modified:  Anil.B On 02/02/2015 Added condition to update Currencyisocode when a start term is changed.

Modifications : By Harsha 4/17/2015 
  				Removed all code that self update opp with isocode and moved it to workflow2trigger
				Removed code that updates finance and moved it to updateFinance_FromOpportunity
				Only included mail sending part.
*************************************************************************/
trigger updateCurrency on Opportunity (after update) {

    List<Opportunity_Finance__c> oppFinNew = new List<Opportunity_Finance__c>();        
    map<id,String>smap=new map<id,string>();
    Set<Id> sobjectSetOfIds = new Set<Id>();
    
    for(Opportunity opp:trigger.new){
        if(opp.Primary_Campus__c!=trigger.oldmap.get(opp.id).Primary_Campus__c)
        {
            If(RecordTypeHelper.isapplicationprocessrecordtype(opp.RecordTypeId) && opp.StageName=='Confirmed'||
               opp.StageName=='Admissions Endorsed Confirmed'||opp.StageName=='Conditionally Confirmed'||
               opp.StageName=='Soft Rejected Confirmed'){
            	sobjectSetOfIds.add(opp.id);            
            }
        }
    }
    
    if(!sobjectSetOfIds.IsEmpty()){
        List<Opportunity_Finance__c> opfin=[select id,Name,Go_Ed_Loan_Amount__c,opportunity__r.id,Program__c,Opportunity__c,Student_ID__c from Opportunity_Finance__c where Go_Ed_Loan_Amount__c >0 and Opportunity__c in:sobjectSetOfIds ];
        if(!opfin.isEmpty()){
            List<EmailTemplate> et = [SELECT id FROM EmailTemplate WHERE Name = 'GoEd Loan Status Confirmed Campus Change'];
            System.debug(et+'<--((((((((->'+et.size());
            List<messaging.Singleemailmessage> lstMail=new list<messaging.Singleemailmessage>();
            if(et.IsEmpty())
            {
                String str='Some One has Changed or Deleted the email template with name : GoEd Loan Status Confirmed Campus Change'+'<br></br>'+
                'Please Check this template and correct it'+'<br></br>'+
                +'<br></br><br></br><br></br>'+
                'Thanks'+'<br></br>'+'\n'+
                'Hult';
                
                 messaging.Singleemailmessage mail=new messaging.Singleemailmessage();            
                 list<string> unames  =new list<string>();
                 for(Admin_Mails__c usrs:Admin_Mails__c.getall().values() )
                 {
                     unames.add(usrs.name);
                 }
                 if(unames.IsEmpty())
                 {
                     unames.add('sfdc.admin@email.hult.edu');
                 }
                 mail.setToAddresses(unames);//mail.setToAddresses(new String[] {'anil.bathula@hult.edu','Harsha.Simha@hult.edu','meghan.shoemaker@hult.edu','daniel.mora@ef.com'});
                mail.setSenderDisplayName('Hult');
                mail.setSubject('Changed or Deleted The Email Template with name:GoEd Loan Status Confirmed Campus Change' );
                mail.setHtmlBody(str);
                lstMail.add(mail);
            }
            else
            {
                for(integer i=0;i<opfin.size();i++){  
                
                    /*List<string>s =new List<String>{'anil.bathula@hult.edu','Premanath.reddy@hult.edu'};                   
                    String Subject='Campus Change ' + opfin[i].Student_ID__c +','+ opfin[i].Applicant__c//opportunity__r.Contact__r.Name;
                    String str='The campus program has changed to '+opfin[i].Program__c+'<br></br>'+
                    'Please review the Application '+opfin[i].Opportunity__c + ' and Finance Page'+'<br></br> '+
                    +'<br></br><br></br><br></br>'+
                    'Thanks'+'<br></br>'+'\n'+
                    'Hult';*/
                    
                    messaging.Singleemailmessage mail=new messaging.Singleemailmessage();                 
                    mail.setSenderDisplayName('Hult');
                    list<string> goed_users  =new list<string>();
                     for(Goed_Emails__c usrs:Goed_Emails__c.getall().values() )
                     {
                         goed_users.add(usrs.name);
                     }
                     if(goed_users.IsEmpty())
                     {
                         goed_users.add('sfdc.admin@email.hult.edu');
                     }
                     mail.setToAddresses(goed_users);//mail.setToAddresses(new String[] {'Elias.Abrahamsson@goed.com','siddharth.raturi@goed.com','thomas.holmberg@goed.com'});                     
                    mail.setTargetObjectId('003U000000Qaw0f');
                    mail.setSaveAsActivity(false);                       
                    mail.setTemplateId(et[0].Id);
                    mail.setWhatId(opfin[i].Id);
                    lstMail.add(mail);  
                }
            }
            If(staticFlag.Update_Currency)
            {
                staticFlag.Update_Currency = false;
                if(!lstmail.IsEmpty()){
                    try{ 
                        messaging.sendEmail(lstmail);
                    }
                    catch(DMLException e){ 
                        system.debug('ERROR SENDING EMAIL:'+e); 
                    } 
                }
            } 
                
        } 
    }   
}