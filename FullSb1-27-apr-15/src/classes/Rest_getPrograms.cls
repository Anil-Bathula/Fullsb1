@RestResource(UrlMapping='/event_api/allprograms/*')
global with sharing class Rest_getPrograms 
{
/*
	Developer  : Harsha Simha
	Date	   : 1/22/2015
	Test Class : Rest_eventApp_test 
	Synopsis   : Returns all the active programs in REST Call from third party.
*/
	@Httpget
	global static ret_response getAllPrograms() 
	{
		ret_response resp=new ret_response();
		resp.iserror=false;
		Restrequest req=restcontext.Request;
		
		try{
			list<programs> lst_pg=new list<programs>();
			for(Program__c pgms:[select id,name from Program__c where active__c = true])
			{
				programs pg=new programs();
				pg.Program_id=pgms.Id;
				pg.Program_Name=pgms.Name;
				lst_pg.add(pg);
			}
			resp.programs=lst_pg;
		}
		catch(Exception e)
		{
			resp.iserror=true;
			resp.error_details=''+e;
		}
		
		if(resp.iserror)
		{
			Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get All Programs',req.httpMethod , 'Get All Programs' ,req.requesturi, req.params+''   );	
		}
		return resp;
    }
    
    global class ret_response
    {

        global boolean iserror;
        global String error_details;
        global List<programs> programs;

    }
    private class programs
	{
		private string program_id;
		private string program_name;		
	}
    
}