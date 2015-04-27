@RestResource(UrlMapping='/event_api/get_picklist_values/*')
global with sharing class rest_getpicklist_values 
{
/*
	Developer  : Harsha Simha
	Date	   : 2/10/2015
	Test Class : Rest_eventApp_test 
	Synopsis   : Returns all the picklist values for a given picklist field in REST Call from third party.
	
	Changes	   : Jira SFSUP-1010
	Developer  : Harsha Simha
	Date	   : 3/27/2015
	Synopsis   : updated Campaign subtype picklist values.
	
*/    
	@HttpGet
    global static ret_response get_picklist_values()
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
				if(param.containsKey('type'))
				{
					List<string> ret=new List<string>();
					string typ=param.get('type');
					if(typ!=null && (typ=='event_type' || typ=='start_term'))
					{
						//boolean temp=false;
						Schema.DescribeFieldResult fieldResult ;
						if(typ=='event_type' )						
						{
							/*temp=true;
					    	fieldResult=Campaign.Campaign_Sub_Type__c.getDescribe();							      
							*/ 
                            ret.add('121');
							ret.add('Accommodation Visit');
							ret.add('Campus Visit');
							ret.add('Educational Fair');
							ret.add('Experience Hult');
							ret.add('Info Session');
							ret.add('Meet and Greet');
							ret.add('Networking Event');
							ret.add('Open House');
                            ret.add('Partner Event');
                            ret.add('Visionary Speaker Series');
							
							resp.values=ret;
						}
						if(typ=='start_term')
						{
							Integer curr_year=system.today().year();
						    if(System.today().month()>9)
						        curr_year=system.today().year()+1;
						        
						        system.debug(curr_year);
						    Integer next_year=curr_year++;
						    Integer next_2year=next_year++;
						        
							fieldResult=Opportunity.Start_Term__c.getDescribe();
							
							List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
							for( Schema.PicklistEntry f : fieldResult.getPicklistValues())
							{
								if(f.isActive() && f.getValue()!=null && (f.getValue().contains(''+curr_year) || f.getValue().contains(''+next_year) || f.getValue().contains(''+next_2year)))
								{	
								//	if(System.today().month()>1 && f.getValue().contains('January '+curr_year)){}else{
										ret.add(f.getValue());//}
								}
							}
							resp.values=ret;

						}
						
					}
					else
					{
						resp.iserror=true;
						resp.error_details='required parameter type should contains either "event_type" or "start_term" as value.';
					}
				}
				else
				{
					resp.iserror=true;
					resp.error_details='required parameter "type" is not passed.';
				}
			}
			else
			{
				resp.iserror=true;
				resp.error_details='No parameters are passed ';
			}
		}
		catch(Exception e)
		{
			resp.iserror=true;
			resp.error_details='Exception : '+e;
		}
    	
    	if(resp.iserror)
		{
			Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get Picklist values',req.httpMethod , '' ,req.requesturi, req.params+''   );	
		}
		return resp;   	
    }
    
    global class ret_response
	{
		global boolean iserror;
        global String error_details;
        global list<string> values;
        //global List<campmems> campaignmembers;
	}
    
    
}