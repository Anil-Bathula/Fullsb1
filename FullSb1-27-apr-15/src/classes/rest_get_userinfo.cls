@RestResource(UrlMapping='/event_api/get_user_info/*')
global with sharing class rest_get_userinfo  
{
/*
	Developer  : Harsha Simha
	Date	   : 2/10/2015
	Test Class : Rest_eventApp_test 
	Synopsis   : Returns the current user information in REST Call from third party.
*/   
    @httpget
	global static ret_response get_user_info()
    {
    	ret_response resp=new ret_response();
		resp.iserror=false;
		string uid;
		Restrequest req=restcontext.Request;
		
		try
		{		
			map<string,string> param=new map<String,string>();
			param=req.params;
			if(!param.IsEmpty())
			{
				if(param.containsKey('userid'))
				{
					uid=(string)param.get('userid');					
					if(uid!=null)
					{system.debug('=========='+uid);
						list<user> usr=[select id,Name,FirstName,LastName,Email from user where id=:uid];
						if(!usr.IsEmpty())
						{
							user_info u=new user_info();
							u.userid=usr[0].Id;
							u.firstname=usr[0].firstname;
							u.lastname=usr[0].lastname;
							u.emailid=usr[0].Email;
							resp.userinfo=u;
						}
						else
						{
							resp.iserror=true;
							resp.error_details='No records returned with this user id : '+uid;
						}
					}
					else
					{
						resp.iserror=true;
						resp.error_details='"userid" should contain a value.';
					}
				}
				else
				{
					resp.iserror=true;
					resp.error_details='"userid" is not passed as a parameter';
				}	
			}
			else
			{
				resp.iserror=true;
				resp.error_details='No parameters are passed';
			}
		}
		catch(Exception e)
		{
			resp.iserror=true;
			resp.error_details='Exception '+e;
		}
		
		if(resp.iserror)
		{
			//Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get user info',req.httpMethod , uid ,req.requesturi, req.params+''   );	
		}
		
		return resp;
    }
    
	global class ret_response
	{
		global boolean iserror;
        global String error_details;
        global user_info userinfo;
	}
	private class user_info
	{
		private string userid;
		private string firstname;
		private string lastname;
		private string emailid;
	}
}