@RestResource(UrlMapping='/event_api/update_campaignmember_status/*')
global with sharing class Rest_Update_campaignmemberStatus 
{
/*
    Developer  : Harsha Simha
    Date       : 1/28/2015
    Test Class : rest_eventapi_onpost_test 
    Synopsis   : Updates campaign member status with value passed in REST Call from third party.
    
    Changes     : By Harsha on 4/15/2015  
    Synopsis   : (SFSUP-1009)Updates campaign member Event_App_Interaction_Time__c with current Time.
*/    
     @HttpPost
    global static ret_response update_camp_mem() 
    {
        Restrequest req=restContext.Request;        
        map<string,object> param=new map<String,object>();
        ret_response resp=new ret_response();
        resp.iserror=false;
        boolean flag=false;
        string campmemid;
        try{
            Blob b=req.requestBody;
            String temp=b.toString();
             system.debug(temp);
            
            param= (Map<String, Object>)JSON.deserializeUntyped(temp);
        }
        catch(Exception e)
        {
            flag=true;
            resp.iserror=true;
            resp.error_details=''+e;
        }
        
        
        //param=req.params;
        if(!flag)
        {   
            if(!param.Isempty())
            {
                if(param.containsKey('campaignid') && param.containsKey('campaignmemberid'))
                {
                    try
                    {
                        set<string> campstatus=new set<string>();
                        for(campaignMemberStatus cms:[Select Label, Id, CampaignId From CampaignMemberStatus where campaignid=:(string)param.get('campaignid')])
                        {
                            campstatus.add(cms.Label);
                        }
                        if(campstatus.Isempty())
                        {
                            resp.iserror=true;
                            resp.error_details='No Campaign Member Status exist for this campaign or campaign id passed is invalid.';
                        }
                        else
                        {
                            campmemid=(string)param.get('campaignmemberid');
                            list<campaignMember> campmem=[select id,status,Event_App_Interaction_Time__c from Campaignmember where id=:campmemid];
                            if(campmem.IsEmpty())
                            {
                                resp.iserror=true;
                                resp.error_details='Pass CampaignMemberid as a parameter in the request';
                            }
                            else
                            {
                                string stats=param.containsKey('status')?(string)param.get('status'):'Attended';
                                if(campstatus.contains(stats))
                                {   
                                    campmem[0].Status=stats;
                                    campmem[0].Event_App_Interaction_Time__c=System.now();
                                    update campmem[0];
                                    
                                    campaign_mem c=new campaign_mem();
                                    c.Campaignmember_id=campmem[0].Id;
                                    c.status=campmem[0].status;
                                    
                                    resp.campaignmember=c;
                                }
                                else
                                {
                                    resp.iserror=true;
                                    resp.error_details=stats+' is not a CampaignMember Status for this campaign.';
                                }
                            }
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
            }
            else
            {
                resp.iserror=true;
                resp.error_details='Pass CampaignMemberid as a parameter in the request';
            }
        }
        
        if(resp.iserror)
        {
            Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Update CampaignMember Status',req.httpMethod , campmemid,req.requesturi, req.requestBody.tostring()  );   
        }       
        return resp;
    }
    
    global class ret_response
    {
        global boolean iserror;
        global String error_details;
        global campaign_mem campaignmember;
        //global List<campmems> campaignmembers;
    }
    private class campaign_mem
    {
        private string campaignmember_id;
        private string status;      
    }
}