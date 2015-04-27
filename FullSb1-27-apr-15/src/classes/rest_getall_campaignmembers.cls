@RestResource(UrlMapping='/event_api/all_campaignmembers/*')
global with sharing class rest_getall_campaignmembers 
{
/*
	Developer  : Harsha Simha
	Date	   : 1/27/2015
	Test Class : Rest_eventApp_test 
	Synopsis   : Returns all the campaignmembers for a given campaign in REST Call from third party.
*/     
	@httpget
	global static ret_response getallcampaignmembers()
	{
		ret_response resp=new ret_response();
		resp.iserror=false;
		string campid;
		Restrequest req=restcontext.Request;
		
		try
		{			
			map<string,string> param=new map<String,string>();
			param=req.params;
			
			if(!param.Isempty())
			{
				if(param.containsKey('campaignid'))
				{
					campid=param.get('campaignid');
					list<CampaignMember> campmems_lst=new list<CampaignMember>();
					//cities=[select id,Name,Country__C from City__c where country__C=:param.get('countryid')];CampaignMember.
					campmems_lst=[select id,CampaignId,status,LeadId,Lead.Program_Primary__c,Lead.Program_Primary__r.Name,Lead.FirstName,Lead.LastName,Lead.Phone,
								Lead.Email,Lead.City,Lead.State,Lead.Start_Term__c,Lead.Country_Of_Residence__c,Lead.Country_Of_Residence__r.Name,
								ContactId,Contact.Program_Primary__c,Contact.Program_Primary__r.Name,Contact.FirstName,Contact.LastName,Contact.Phone,
								 Contact.Email,Contact.MailingCity,Contact.MailingState,Contact.Start_Term__c,Contact.Country_Of_Residence__c,
								 Contact.Country_Of_Residence__r.Name from CampaignMember where CampaignId=:campid];
					//resp.campaignmembers=campmems_lst;					
					if(campmems_lst.IsEmpty())
					{
						resp.iserror=true;
						resp.error_details='There are no Campaign Members Exist for this Campaign or the Campaign id passed is incorrect.';
					}
					else
					{
						List<campmems> cm_lst=new List<campmems>();
						
						for(CampaignMember temp:campmems_lst)
						{
							campmems cm=new campmems();
							cm.Campaignmember_id=temp.Id;							
							if(temp.LeadId!=null)
							{
								cm.FirstName=temp.Lead.FirstName;
								cm.LastName=temp.Lead.LastName;
								cm.ProgramName=temp.Lead.Program_Primary__r.Name;
								cm.ProgramId=temp.Lead.Program_Primary__c;
								cm.Phone=temp.Lead.Phone;
								cm.Leadorcontact_Id=temp.LeadId;
								cm.status=temp.status;
								
								cm.email=temp.Lead.Email;
								cm.city=temp.Lead.City;
								cm.state=temp.Lead.State;
								cm.start_term=temp.Lead.Start_Term__c;
								cm.country_id=temp.Lead.Country_Of_Residence__c;
								cm.country_name=temp.Lead.Country_Of_Residence__r.Name;
							}
							else if(temp.ContactId!=null)
							{
								cm.FirstName=temp.Contact.FirstName;
								cm.LastName=temp.Contact.LastName;
								cm.ProgramName=temp.Contact.Program_Primary__r.Name;
								cm.ProgramId=temp.Contact.Program_Primary__c;
								cm.Phone=temp.Contact.Phone;
								cm.Leadorcontact_Id=temp.ContactId;
								cm.status=temp.status;
								
								cm.email=temp.Contact.Email;
								cm.city=temp.Contact.MailingCity;
								cm.state=temp.Contact.MailingState;
								cm.start_term=temp.Contact.Start_Term__c;
								cm.country_id=temp.Contact.Country_Of_Residence__c;
								cm.country_name=temp.Contact.Country_Of_Residence__r.Name;
							}
							cm_lst.add(cm);
						}
						resp.campaignmembers=cm_lst;
					}
				}
				else
				{
					resp.iserror=true;
					resp.error_details='Campaignid not passsed as a parameter';
				}
			}
			else
			{
				resp.iserror=true;
				resp.error_details='Pass Campaignid as a parameter in the request';
			}
		}
		catch(Exception e)
		{
			resp.iserror=true;
			resp.error_details=''+e;
		}
		
		if(resp.iserror)
		{
			Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get All CampaignMembers',req.httpMethod , campid,req.requesturi, req.params+''   );	
		}
		return resp;
	}
	
	global class ret_response
	{
		global boolean iserror;
        global String error_details;
        //global List<CampaignMember> campaignmembers;
        global List<campmems> campaignmembers;
	}
	private class campmems
	{
		private string campaignmember_id;
		private string firstname;
		private string lastname;
		private string programname;
		private string programid;
		private string phone;
		private string leadorcontact_id;		
		private string status;
		
		private string email;
		private string city;
		private string state;
		private string start_term;
		private string country_id;
		private string country_name;
	}
}