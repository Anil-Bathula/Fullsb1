public with sharing class Rest_Create_ErrorLogs 
{
/*
	Developer  : Harsha Simha
	Date	   : 1/28/2015
	Test Class : Rest_eventApp_test 
	Synopsis   : This method creates an error record for any Runtime exceptions/criteria not met in REST_event API callout.
*/  
    @future
	public static void create_log(string req,string errormsg,string event,string method,string rec_info,string endpoint, string req_body )
	{
		Rest_Event_API_Logs__c log=new Rest_Event_API_Logs__c();
		log.EndPoint__c=endpoint;
		log.Error__c=errormsg;
		log.Event__c=event;
		log.Method__c=method;
		log.Related_Record_Id__c=rec_info;
		log.Request__c=req;
		log.Request_Param_or_Body__c=req_body;
		insert log;
	}
	
}