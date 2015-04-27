@isTest(seeAlldata=true)
public class Rest_eventApp_test {
/*
	Developer  : Harsha Simha
	Date	   : 3/1/2015	
	Synopsis   : Test Class for all the GET MEthods in Rest_Event_API .
*/
    static testMethod void test_get_pgms_ctry_n_errlogs() 
    {
        /* Test class for 
         * 			Get All Programs
         * 			Get All Countries
         * 			Create Error Logs
		*/
        Restrequest req=new Restrequest();
        Restresponse res=new Restresponse();
        req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/allprograms';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        Test.startTest();
            Rest_getPrograms.ret_response resp= Rest_getPrograms.getAllPrograms(); 
        	
        	// for Get All Countries
        	req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/allcountries';
        	RestContext.request = req;
        	rest_getcountries.ret_response ctry_resp= rest_getcountries.getallCountries();
            
        	boolean iserr=ctry_resp.iserror;	
          	string err=ctry_resp.error_details;
             
        //	rest_getcountries.countries =new rest_getcountries.countries();
        	
        	//For Error Logs
        	Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get All Programs','GET' , 'Get All Programs' ,req.requesturi, req.params+''); 
        
        
        Test.stopTest();
    }
    static testMethod void test_get_camps_user_pickvals() 
    {
        /* Test class for 
         * 			Get Active Campaigns
         * 			Get UserInfo
         * 			Get PickList Values
		*/
        Restrequest req=new Restrequest();
        Restresponse res=new Restresponse();
        req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/all_activecampaigns';
        req.httpMethod = 'GET';
        req.addParameter('date_offset', '10');
        req.addParameter('userid', UserInfo.getUserId());
        RestContext.request = req;
        RestContext.response = res;
        Test.startTest();
            rest_GetActiveCampaigns.ret_response resp= rest_GetActiveCampaigns.getAllactivecampaigns(); 
        	
        	//For Get user info
        	req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/get_user_info';
			RestContext.request = req;
        	rest_get_userinfo.ret_response  usr_resp= rest_get_userinfo.get_user_info();
        	
        	//For Get user info
        	req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/get_picklist_values';
			req.addParameter('type', 'event_type');
        	RestContext.request = req;
        	rest_getpicklist_values.ret_response  pick_resp= rest_getpicklist_values.get_picklist_values();
        
        	req.addParameter('type', 'start_term');
            RestContext.request = req;
        	rest_getpicklist_values.ret_response  pick_resp1= rest_getpicklist_values.get_picklist_values();
        
        Test.stopTest();
    }
    static testMethod void test_getall_campaignmembers() 
    {
        /* Test class for 
         * 			Get All CampaignMembers
		*/
        list<campaign> camps=[select id from campaign where RecordTypeId=:RecordTypeHelper.getRecordTypeId('Campaign', 'Event') limit 1];
        string campid;
        try{campid=camps[0].Id;
        }catch(Exception e){}
        
        if(campid!=null)
        {
            List<CampaignMember> cm_lst=new List<CampaignMember>();
            for(Lead l:[select id,NAme from Lead where isconverted=false limit 2])
            {
                CampaignMember cm=new CampaignMember();
                cm.LeadId=l.Id;
                cm.campaignid=campid;
                cm_lst.add(cm);
            }
            for(contact c:[select id,NAme from contact limit 2])
            {
                CampaignMember cm=new CampaignMember();
                cm.ContactId=c.Id;
                cm.campaignid=campid;
                cm_lst.add(cm);
            }
            
            insert cm_lst;
        } 
        
        Restrequest req=new Restrequest();
        Restresponse res=new Restresponse();
        req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/all_campaignmembers';
        req.httpMethod = 'GET';
        req.addParameter('campaignid',campid);
        //req.addParameter('userid', UserInfo.getUserId());
        RestContext.request = req;
        RestContext.response = res; 
        Test.startTest();
            rest_getall_campaignmembers.ret_response resp= rest_getall_campaignmembers.getallcampaignmembers(); 
        Test.stopTest();
    }
    

}