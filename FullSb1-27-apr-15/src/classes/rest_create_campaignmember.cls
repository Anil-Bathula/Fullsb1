@RestResource(UrlMapping='/event_api/create_campaignmember/*')
global with sharing class rest_create_campaignmember 
{
/*
	Developer  : Harsha Simha
	Date	   : 1/30/2015
	Test Class : rest_eventapi_onpost_test 
	Synopsis   : creates campaign member under a campaign with values passed in REST Call from third party.

	Changes	   : By Harsha on 3/26/2015 
	Synopsis   : (SFSUP-1008)on lead create set LEad source =camp.Marketing source(default val= Event_App_mobile..)
    
	Changes	   : By Harsha on 3/27/2015  
	Synopsis   : (SFSUP-1009)Updates campaign member Event_App_Interaction_Time__c with current Time.
*/    
	@httpPost
	global static ret_response create_Campaignmember()
	{
		Restrequest req=restContext.Request;		
		map<string,object> param=new map<String,object>();
		ret_response resp=new ret_response();
		resp.iserror=false;
		boolean flag=false;
		string campaignid;
		
		try
		{
			String temp=req.requestBody.toString();
			system.debug(temp);			
			param= (Map<String, Object>)JSON.deserializeUntyped(temp);
		}
		catch(Exception e)
		{
			flag=true;
			resp.iserror=true;
			resp.error_details=''+e;
		}
		
		
		if(!flag)
		{
			if(!param.isEmpty())
			{
				try				
				{
					System.debug(param.containsKey('campaignid') +'--'+ param.containsKey('firstname') +'--'+ param.containsKey('lastname') +'--'+ 
						param.containsKey('email') +'--'+ Param.containsKey('programid')+'--'+Param.containsKey('program_name') +'--'+ Param.containsKey('country_id') +'--'+ 
						Param.containsKey('city') +'--'+ param.containsKey('state') +'--'+ param.ContainsKey('start_term'));
						//&& Param.containsKey('city') && param.containsKey('state') && param.containsKey('phone')
					if(param.containsKey('campaignid') && param.containsKey('firstname') && param.containsKey('lastname') && 
						param.containsKey('email') && Param.containsKey('programid') && Param.containsKey('program_name') &&
						Param.containsKey('country_id') && param.ContainsKey('start_term') )
					{
						if(param.get('campaignid') ==null || param.get('firstname') ==null || param.get('lastname') ==null || 
						param.get('email') ==null || Param.get('programid') ==null || Param.get('program_name') ==null || param.get('phone') ==null || Param.get('country_id') ==null || 
						param.get('start_term')==null)
						{
							resp.iserror=true;
							resp.error_details='Request contains null values for few of the required parameters.';
						}
						else
						{
							campaignid=(string)param.get('campaignid');
							string Email=(string)param.get('email');
							List<Lead> leads=[select id,Name,isconverted,company,ConvertedContactId,Applicant_Email__c,Program_Primary__r.Name from LEad where Applicant_Email__C=:Email];
							List<Contact> ctcts=[select id,Name,FirstName,LastName,Applicant_Email__c,start_term__c from Contact where Applicant_Email__C=:Email];
							if(!leads.Isempty() &&!ctcts.Isempty())
							{								
								//record exist.
								//create campaignmember.
								boolean temp=false;
								string sterm=(String)param.get('start_term');
								
								for(contact c:ctcts)
								{
									if(!temp && c.start_Term__C.equalsignorecase(sterm))
									{
										temp=true;
										resp=camp_member((string)param.get('campaignid'),c);
									}
								}
								if(!temp)
								{
									resp.iserror=true;
									resp.error_details='Already existing contacts does not have the given start term.'+sterm;
								}
																
							}
							else if(!leads.Isempty() && ctcts.Isempty())
							{
								if(!leads[0].IsConverted)
								{
									try
									{
										//contact c=leadconvert(leads[0]);
										lead_convert_response r=leadconvert(leads[0]);
										if(r.iserror)
										{
											resp.iserror=r.iserror;
											resp.error_details=r.error_details;
										}
										else
										{
											resp=camp_member((string)param.get('campaignid'),r.contact);								
										}
									}
									catch(Exception e)
									{
										resp.iserror=true;
										resp.error_details=''+e;
									}
								}
								else
								{
									List<Contact> ctct=[select id,Name,FirstName,LastName,Applicant_Email__c,start_term__c from Contact where id=:leads[0].ConvertedContactId and start_Term__c=:(string)param.get('start_term')];
									if(!ctct.IsEmpty())
									{
										resp=camp_member((string)param.get('campaignid'), ctct[0]);
									}
									else
									{
										resp.iserror=true;
										resp.error_details='contact not exist for this converted lead';										
										//contact not exist for this converted lead
									}
								}
								
							}
							else if(leads.Isempty() && !ctcts.Isempty())
							{
								//record already exist
								//create campaignmember.
								//resp=camp_member((string)param.get('campaignid'),ctcts[0]);	
								boolean temp=false;
								string sterm=(String)param.get('start_term');
								for(contact c:ctcts)
								{
									if(!temp && c.start_Term__C.equalsIgnorecase(sterm))
									{
										temp=true;
										resp=camp_member((string)param.get('campaignid'),c);
									}
								}
								if(!temp)
								{
									resp.iserror=true;
									resp.error_details='Already existing contacts does not have the given start term.'+sterm;
								}
							}
							else if(leads.Isempty() && ctcts.Isempty())
							{ 
								Lead l=new lead();
								l.FirstName=(string)param.get('firstname');
								l.LastName=(string)param.get('lastname');
								l.Email=(string)param.get('email');
								l.Applicant_Email__c=(string)param.get('email');
								l.Program_Primary__c=(string)Param.get('programid');
								l.company=(string)Param.get('program_name');
								l.Country_Of_Residence__c=(string)Param.get('country_id') ;
								l.Phone=(string)param.get('phone');
								l.City=(string)Param.get('city');
								l.State=(string)param.get('state');
                                try{
                                    Campaign camp=[select id,Name,Marketing_Source__c from campaign where id=:campaignid];
									l.leadsource=camp.Marketing_Source__c==null?'Event_API_Mobile':camp.Marketing_Source__c;
                                }
                                catch(Exception ex)
                                {
                                    l.leadsource='Event_API_Mobile';
                                }
                                l.start_Term__c=(string)param.get('start_term');								
								try
								{ 
									system.debug('======='+l);
									insert l;
									lead_convert_response r=leadconvert(l);
									if(r.iserror)
									{
										resp.iserror=r.iserror;
										resp.error_details=r.error_details;
									}
									else
									{
										resp=camp_member((string)param.get('campaignid'),r.contact);								
									}
								}
								catch(Exception e)
								{
									resp.IsError=true;
									resp.error_details=''+e;
								}
								//create lead and convert.
								//create campaignmember.
							}							
						}
					}
					else
					{
						resp.iserror=true;
						resp.error_details='Request does not contain required values.';
					}
				}	
				catch(Exception e)
				{
					resp.iserror=true;
					resp.error_details=''+e; 
				}
			}
			else
			{
				resp.iserror=true;
				resp.error_details='Pass campaignid and CampaignMemberid in the request body';
			}
		}/*
		else
		{
			resp.iserror=true;
			resp.error_details='Pass CampaignMemberid as a parameter in the request';
		}*/
		
		if(resp.iserror)
		{
			Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Create CampaignMember',req.httpMethod , campaignid,req.requesturi, req.requestBody.tostring()  );	
		}	
		
		return resp;
	}
	
	global static ret_response camp_member(string campid,Contact c)
	{	
		ret_response r_resp=new ret_response();
		r_resp.iserror=false;
		
		List<CampaignMember> campmem=[select id,campaignId,Status,LeadId,ContactId from CampaignMember where campaignid=:campid and Contactid=:c.Id];
		if(!campmem.IsEmpty())
		{
			campaignmem c_m=new campaignmem();
			c_m.Campaignmember_id=campmem[0].id;
			if(campmem[0].LeadId!=null)
				c_m.Leadorcontact_Id=campmem[0].LeadId;
			else if(campmem[0].ContactId!=null)
				c_m.Leadorcontact_Id=campmem[0].ContactId;
							
			c_m.campaign_id=campmem[0].CampaignId;
			c_m.status=campmem[0].status;
				
			r_resp.campaignmember=c_m;
		}
		else
		{
			campaignmem c_m=new campaignmem();
			try
			{
				CampaignMember cm=new CampaignMember();
				cm.status='Walk In';
				cm.ContactId=c.Id;
				cm.campaignId=campid;
                cm.Event_App_Interaction_Time__c=System.now();
				insert cm;				
				
				c_m.Campaignmember_id=cm.id;
				c_m.Leadorcontact_Id=c.Id;		
				c_m.campaign_id=campid;
				c_m.status=cm.status;
				
				r_resp.campaignmember=c_m;				
				
				try
				{
					Task task = new Task();
		            task.WhoId = c.Id;
		           // task.RecordTypeId = landingPageRecTypeId;
		            task.First_Name__c = c.FirstName;
		            task.Last_Name__c = c.lastName;
		            task.Campaign__c = campid;
		            task.Contact_Email__c =c.Applicant_Email__c;
					task.Subject = 'Event Signup';
					insert task;		
				}
				catch(Exception ex)
				{
					r_resp.iserror=true;
					r_resp.error_details='Campaign member created, but error occured while creating task'+ex;
					r_resp.campaignmember=c_m;
				}		
				
			}
			catch(Exception e)
			{
				r_resp.iserror=true;
				r_resp.error_details=''+e;
			}
		}
		return r_resp;
	}
	
	global static lead_convert_response leadconvert(Lead lead) {
                
        lead_convert_response rsp=new lead_convert_response();
        rsp.iserror=false;
        try{        
                system.debug('---------'+lead);
	        Account account = [
	            select OwnerId
	              from Account
	             where Name = :lead.company and RecordTypeId=:RecordTypeHelper.getRecordTypeId('Account','Candidate')  
	             limit 1
	        ];
	        
	        Database.LeadConvert leadConvert = new Database.LeadConvert();
	        leadConvert.setAccountId(account.Id);
	        leadConvert.setConvertedStatus('Qualified');
	        leadConvert.setDoNotCreateOpportunity(false);
	        leadConvert.setLeadId(lead.Id);
	        leadConvert.setOwnerId(account.OwnerId);
	        leadConvert.setSendNotificationEmail(false);
	        
	        // Run the conversion
	        
	        Database.LeadConvertResult leadConvertResult = Database.convertLead(leadConvert, false);
	        System.debug('---------'+leadConvertResult );
	        contact c=new contact();
	        if(leadConvertResult.isSuccess())
	        {
		        // Update information on the new opportunity
		        Opportunity opportunity = new Opportunity(Id = leadConvertResult.getOpportunityId());
		        opportunity.Contact__c = leadConvertResult.getContactId();
		        opportunity.Program__c = lead.Program_Primary__r.Id;
		        try
		        {
		        	update opportunity;
		        }
		        catch(Exception e)
		        {
		        	system.debug(''+e);
		        }
	        	c=[select id,Name,FirstName,LastName,Applicant_Email__c,start_term__c from Contact where id=:leadConvertResult.getContactId()];
	        	rsp.contact=c;
	        }
	        else
	        {
	        	rsp.iserror=true;
	        	rsp.error_details=''+leadConvertResult.getErrors();
	        }
        }
        catch(Exception e)
        {
        	rsp.iserror=true;
        	rsp.error_details=''+e;
        }
        return rsp;
    }
	global class ret_response
	{
		global boolean iserror;
        global String error_details;
        global campaignmem campaignmember;
        //global List<campmems> campaignmembers;
	}
	global class lead_convert_response
	{
		global boolean iserror;
        global String error_details;
        global Contact contact;
        //global List<campmems> campaignmembers;
	}
	private class campaignmem
	{
		private string campaignmember_id;
		private string campaign_id;
		private string leadorcontact_id;		
		private string status;
	}
}