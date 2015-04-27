@RestResource(UrlMapping='/event_api/update_lead_contact/*')
global with sharing class Rest_update_campaignmember 
{
/*
	Developer  : Harsha Simha
	Date	   : 2/5/2015
	Test Class : rest_eventapi_onpost_test 
	Synopsis   : updates campaign member associated Lead or Contact with values passed in REST Call from third party.
*/ 
    @HttpPost
	global static ret_response update_camp_mem() 
	{
		Restrequest req=restContext.Request;		
		map<string,object> param=new map<String,object>();
		ret_response resp=new ret_response();
		resp.iserror=false;
		boolean flag=false;
		string leadorcontactid;
		
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
					System.debug(param.containsKey('leadorcontact_id') +'--'+param.containsKey('firstname') +'--'+ param.containsKey('lastname') +'--'+ Param.containsKey('programid')+'--'+
					Param.containsKey('city') +'--'+ param.containsKey('state') +'--'+ param.ContainsKey('country_id')+'--'+param.containsKey('phone'));
						
					if(param.containsKey('leadorcontact_id') && param.containsKey('firstname') && param.containsKey('lastname') && 
						Param.containsKey('programid') && param.containsKey('phone') && 
						Param.containsKey('country_id') && Param.containsKey('city') && param.containsKey('state') )
					{
						if(param.get('leadorcontact_id') ==null || param.get('firstname') ==null || param.get('lastname') ==null || 
						 Param.get('programid') ==null || param.get('phone') ==null || Param.get('country_id') ==null || 
						Param.get('city') ==null || param.get('state') ==null )
						{
							resp.iserror=true;
							resp.error_details='Request contains null values for few of the required parameters.';
						}
						else
						{
							try
							{
								leadorcontactid=(string)param.get('leadorcontact_id');
								if(leadorcontactid.startswith('003'))
								{//Contact.
									list<contact> con=[select id,Name from contact where id=:leadorcontactid];
									if(!con.IsEmpty())
									{
										con[0].FirstName=(string)param.get('firstname');
										con[0].LastName=(string)param.get('lastname');
										con[0].Phone=(string)param.get('phone');
										con[0].Program_Primary__c=(string)Param.get('programid');
										con[0].Country_Of_Residence__c=(string)Param.get('country_id') ;
										con[0].MailingCity=(string)Param.get('city');
										con[0].Mailingstate=(string)param.get('state');
										update con[0];
									}
									else
									{
										resp.iserror=true;
										resp.error_details='No Contact record exist with this id'+leadorcontactid;
									}
									
								}
								else if(leadorcontactid.startswith('00Q'))
								{//lead
									list<Lead> lead=[select id,Name from Lead where id=:leadorcontactid];
									if(!lead.IsEmpty())
									{
										lead[0].FirstName=(string)param.get('firstname');
										lead[0].LastName=(string)param.get('lastname');
										lead[0].Phone=(string)param.get('phone');
										lead[0].Program_Primary__c=(string)Param.get('programid');
										lead[0].Country_Of_Residence__c=(string)Param.get('country_id') ;
										lead[0].City=(string)Param.get('city');
										lead[0].State=(string)param.get('state');
										update lead[0];
									}
									else
									{
										resp.iserror=true;
										resp.error_details='No Lead record exist with this id'+leadorcontactid;
									}
								}
								else
								{
									resp.iserror=true;
									resp.error_details='Given id is not either lead or contact id.';
								}	
							}
							catch(Exception e)
							{
								resp.iserror=true;
								resp.error_details=''+e;
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
				resp.error_details='Pass required values in the request body';
			}
		}
		
		if(resp.iserror)
		{
			Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Update Lead or Contact',req.httpMethod , leadorcontactid,req.requesturi, req.params+''   );	
		}
		return resp;
	}
	
	global class ret_response
	{
		global boolean iserror;
        global String error_details;
        global Lead_or_ctct leadorcontact;
        //global List<campmems> campaignmembers;
	}
	
	private class Lead_or_ctct
	{
		private string leadorcontact_id;
		private string firstname;
		private string lastname;
		private string programid;
		private string phone;
		private string country_id;		
		private string city;
		private string state;
	}
}