@RestResource(UrlMapping='/event_api/allcountries/*')
global with sharing class rest_getcountries 
{
/*
	Developer  : Harsha Simha
	Date	   : 1/22/2015
	Test Class : Rest_eventApp_test 
	Synopsis   : Returns all the active Countries in REST Call from third party.
*/
	@HttpGet
	global static ret_response getallCountries()
	{
		ret_response resp=new ret_response();
		resp.iserror=false;
		Restrequest req=restcontext.Request;
		
		try{
			list<countries> lst_ctry=new list<countries>();
			for(Country__c ctry:[select id,name from Country__c])
			{
				countries c=new countries();
				c.country_id=ctry.Id;
				c.country_name=ctry.Name;
				lst_ctry.add(c);
			}
			resp.countries=lst_ctry;
		}
		catch(Exception e)
		{
			resp.iserror=true;
			resp.error_details=''+e;
		}
		if(resp.iserror)
		{
			Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get All Countries',req.httpMethod , 'Get All Countries' ,req.requesturi, req.params+''   );	
		}
		return resp;
	}
	
	global class ret_response
    {

        global boolean iserror;
        global String error_details;
        global List<countries> countries;

    }
    
    private class countries
	{
		private string country_id;
		private string country_name;		
	}
}