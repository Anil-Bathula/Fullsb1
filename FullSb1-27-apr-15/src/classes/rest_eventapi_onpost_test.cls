@isTest(seeAlldata=true)
public class rest_eventapi_onpost_test {
/*
	Developer  : Harsha Simha
	Date	   : 3/1/2015	
	Synopsis   : Test Class for all the POST MEthods in Rest_Event_API .
*/
    public static testMethod void test_update_campaignmemberstatus() 
    {    
        /* Test class for 
         * 			update CampaginMemberStatus for a Campaign.         
		*/
        list<campaign> camps=[select id from campaign where RecordTypeId=:RecordTypeHelper.getRecordTypeId('Campaign', 'Event') limit 1];
        string campid,camp_mem;
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
            insert cm_lst;
        	camp_mem=cm_lst[0].Id;
        }
        
        string body='{"campaignid":"'+campid+'", "campaignmemberid" : "'+camp_mem+'", "status": "Attended"}';
        Restrequest req=new Restrequest();
        Restresponse res=new Restresponse();
        req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/update_campaignmember_status';
        req.httpMethod = 'POST';
        req.requestBody=Blob.valueOf(body); 
        RestContext.request = req;
        RestContext.response = res; 
        Test.startTest();//for success ca;;
            Rest_Update_campaignmemberStatus.ret_response resp= Rest_Update_campaignmemberStatus.update_camp_mem(); 
        	
        	req.requestBody=Blob.valueOf(''); 
        	RestContext.request = req;
        	resp= Rest_Update_campaignmemberStatus.update_camp_mem(); 
        
        	body='{"campaignid":"", "campaignmemberid" : "'+camp_mem+'", "status": "Attended"}';
        	req.requestBody=Blob.valueOf(''); 
        	RestContext.request = req;
        	resp= Rest_Update_campaignmemberStatus.update_camp_mem(); 
        	
        	body='{"campaignid:"", "campaignmemberid" : "'+camp_mem+'", "status": "Attended"}';
        	req.requestBody=Blob.valueOf(''); 
        	RestContext.request = req;
        	resp= Rest_Update_campaignmemberStatus.update_camp_mem(); 
        Test.stopTest();
        
        Rest_Update_campaignmemberStatus.ret_response r=new Rest_Update_campaignmemberStatus.ret_response();
        boolean er=r.iserror;
        String erd=r.error_details;
        
    }
    
    static testMethod void test_create_campaignmember() 
    {   
        /* Test class for 
         * 			Create CampaginMember for a Campaign.
         * 			update CampaignMember Lead or Contact.
		*/
        rest_create_campaignmember.ret_response campmem=new rest_create_campaignmember.ret_response();
        boolean xc=campmem.iserror;
        rest_create_campaignmember.lead_convert_response lcampmem=new rest_create_campaignmember.lead_convert_response();
        boolean xc1=lcampmem.iserror;
        list<campaign> camps=[select id from campaign where RecordTypeId=:RecordTypeHelper.getRecordTypeId('Campaign', 'Event') limit 1];
        string campid,camp_mem;
        try{campid=camps[0].Id;
        }catch(Exception e){}
        string ctctid,leadid;
        string body1,body2;
        if(campid!=null)
        {
            List<CampaignMember> cm_lst=new List<CampaignMember>();
            for(contact c:[select id,NAme,Email from contact limit 1])
            {
                CampaignMember cm=new CampaignMember();
                cm.ContactId=c.Id;
                cm.campaignid=campid;
                cm_lst.add(cm);
            	body1='{"campaignid":"'+campid+'","firstname":"'+c.name+'","lastname":"'+c.name+'",'+
                    '"email":"'+c.Email+'","programid":"a0JU0000000BQxq","program_name":"EMBAm-UAE-Dubai",'+
                    '"phone":"8095055855","country_id":"a0AU0000000EBvL","city":"Bangalore","state":'+
                    '"Karnataka","start_term":"September2015"}';
            	ctctid=c.Id;
            }
            
            insert cm_lst;
        }
        
        list<lead> leads=[select id,Name,Email,Applicant_Email__c from Lead where company='MBA-Us-Boston' limit 2];
        string appemail='rest_create_campaignmembertest20@test.com';
        if(!leads.isEmpty())
        {
            rest_create_campaignmember.lead_convert_response resl=rest_create_campaignmember.leadconvert(leads[0]);
            leadid=leads[0].Id;
            appemail=leads[1].Applicant_email__c;
        }
        string body='{"campaignid":"'+campid+'","firstname":"fname","lastname":"lname","email":'+
            '"rest_create_campaignmembertest2@test.com","programid":"a0JU0000000BQxq","program_name":'+
            '"EMBAm-UAE-Dubai","phone":"8095055855","country_id":"a0AU0000000EBvL","city":'+
            '"Bangalore","state":"Karnataka","start_term":"September2015"}';
        
        body2='{"campaignid":"'+campid+'","firstname":"fname1","lastname1":"lname",'+
                '"email":"'+appemail+'","programid":"a0JU0000000BQxq",'+
                '"program_name":"EMBAm-UAE-Dubai","phone":"8095055855","country_id":"a0AU0000000EBvL"'+
                ',"city":"Bangalore","state":"Karnataka","start_term":"September2015"}';
        //for update lead or contact
        string bdy='{"leadorcontact_id":"'+leadid+'","firstname":"fname","lastname":"lname","programid"'+
                ':"a0JU0000000BQxq","phone":"8095055855","country_id":"a0AU0000000EBvL",'+
                '"city":"Bangalore","state":"Karnataka"}';
        	
       	string bdy1='{"leadorcontact_id":"'+ctctid+'","firstname":"fname","lastname":"lname",'+
                '"programid":"a0JU0000000BQxq","phone":"8095055855","country_id":"a0AU0000000EBvL"'+
                ',"city":"Bangalore","state":"Karnataka"}';
        Restrequest req=new Restrequest();
        Restresponse res=new Restresponse();
        req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/create_campaignmember';
        req.httpMethod = 'POST';
        req.requestBody=Blob.valueOf(body); 
        RestContext.request = req;
        RestContext.response = res; 
        
        Test.startTest();
        rest_create_campaignmember.ret_response resp=rest_create_campaignmember.create_campaignmember(); 
        	
        req.requestBody=Blob.valueOf(body1); 
        RestContext.request = req;
        resp=rest_create_campaignmember.create_campaignmember(); 
        
        req.requestBody=Blob.valueOf(body2); 
        RestContext.request = req;
        resp=rest_create_campaignmember.create_campaignmember();
        
        //Not passing any Values
        req.requestBody=Blob.valueOf(''); 
        RestContext.request = req;
        resp=rest_create_campaignmember.create_campaignmember(); 
        
        //passing Null Values
        body='{"campaignid":"","firstname":"fname1","lastname1":"lname",'+
                '"email":"","programid":"a0JU0000000BQxq",'+
                '"program_name":"EMBAm-UAE-Dubai","phone":"8095055855","country_id":"a0AU0000000EBvL"'+
                ',"city":"Bangalore","state":"Karnataka","start_term":"September2015"}';
        req.requestBody=Blob.valueOf(body); 
        RestContext.request = req;
        resp=rest_create_campaignmember.create_campaignmember(); 
        
        //passing wrong format - covers catch block
        body='{"campaignid:""""}';
        req.requestBody=Blob.valueOf(body); 
        RestContext.request = req;
        resp=rest_create_campaignmember.create_campaignmember(); 
        //--------------------------
        	
        req.requestBody=Blob.valueOf(bdy); 
        req.requestURI=URL.getSalesforceBaseUrl().toExternalForm() +'/services/apexrest/event_api/update_lead_contact';
        RestContext.request = req;
        Rest_update_campaignmember.ret_response rs=Rest_update_campaignmember.update_camp_mem();
        	
        req.requestBody=Blob.valueOf(bdy1); 
        	RestContext.request = req;
        	Rest_update_campaignmember.ret_response rs1=Rest_update_campaignmember.update_camp_mem();
        
        //Not passing any Values
        req.requestBody=Blob.valueOf(''); 
        RestContext.request = req;
        rs1=Rest_update_campaignmember.update_camp_mem();
        
        //passing Null Values
        bdy1='{"leadorcontact_id":"","firstname":"fname","lastname":"lname",'+
                '"programid":"a0JU0000000BQxq","phone":"8095055855","country_id":"a0AU0000000EBvL"'+
                ',"city":"Bangalore","state":"Karnataka"}';
        req.requestBody=Blob.valueOf(bdy1); 
        RestContext.request = req;
        rs1=Rest_update_campaignmember.update_camp_mem();
        
        //passing wrong format - covers catch block
        bdy1='{"campaignid:""""}';
        req.requestBody=Blob.valueOf(bdy1); 
        RestContext.request = req;
        rs1=Rest_update_campaignmember.update_camp_mem();
        Test.stopTest();
    }
}