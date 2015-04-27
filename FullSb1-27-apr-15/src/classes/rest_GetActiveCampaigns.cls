/************************
Modified By : Sambit Pattanaik
For: SFSUP-948 (Correction of 'DUB '=>'AS' to 'DUB '=>'MEA' in regions_map)
************************/
@RestResource(UrlMapping='/event_api/all_activecampaigns/*')
global with sharing class rest_GetActiveCampaigns 
{
/*
    Developer  : Harsha Simha
    Date       : 1/22/2015
    Test Class : Rest_eventApp_test 
    Synopsis   : Returns all the active campaigns comes under given user region in REST Call from third party.

    Changes    :  By Harsha on 3/26/2015
    Synopsis   : (SFSUP-1007)Default include Global Region Campaigns and all campaigns end date >= today
                 And Exclude Webinar subtypes.
*/    
    @Httpget
    global static ret_response getAllactivecampaigns() 
    {
        Map<string,string> regions_map=new map<String,string>{'ASI'=>'AS','BOS'=>'NA','DUB'=>'MEA','EU-LDN'=>'EU','EU-LUZ'=>'EU','GBL'=>'Global','LAM'=>'LA','LDN'=>'EU','LN-PG'=>'EU','LDN-UG'=>'EU','MEA'=>'MEA','NAM'=>'NA','NYC'=>'NA','SFO '=>' NA','SHA'=>'AS','NAM-BOS'=>'NA','NAM-SFO'=>'NA'};
        ret_response resp=new ret_response();
        resp.iserror=false;
        Restrequest req=restcontext.Request;
        map<string,string> param=new map<String,string>();
        param=req.params;
        if(!param.Isempty())
        {
            
            integer i=1;
            try{
            if(param.containsKey('date_offset'))
                i=Integer.valueOf(param.get('date_offset'));    
            }
            catch(Exception ex){i=1;}
            
            if(param.containsKey('userid'))
            {
                list<user> u=new list<user>();
                u=[select id,Name,Regional_Division__c from USer where id=:param.get('userid')];
                if(u.IsEmpty())
                {
                    resp.iserror=true;
                    resp.error_details='No user exist with this user id';
                }
                else
                {
                    if(u[0].Regional_Division__c==null)
                    {
                        resp.iserror=true;
                        resp.error_details='User Regional Division is Blank in SFDC';
                    }
                    else
                    {   
                        try
                        {
                            string reg=regions_map.ContainsKey(u[0].Regional_Division__c)?regions_map.get(u[0].Regional_Division__c):'';
                            /*if(!regions_map.ContainsKey(u[0].Regional_Division__c))
                            {
                                resp.iserror=true;
                                resp.error_details='Region value not matched in the given list';
                            }
                            else
                            {
                                reg=regions_map.get(u[0].Regional_Division__c);                                
                            }*/
                                string event_rectypeid=RecordTypeHelper.getRecordTypeId('Campaign', 'Event');
                                list<campaigns> camps=new list<campaigns>();
                                date sday=system.today().addDays(-i);
                                date eday=system.today().addDays(-1);
                                system.debug(event_rectypeid+'=============='+sday+'----------'+reg);
                                for(Campaign camp:[select id,name,StartDate,Region__c,Number_of_Registered__c,Number_of_Attended__c,Country__c,Country__r.Name,
                                Program__c,Campaign_Sub_Type__c from campaign where (StartDate>=:sday or EndDate>=:eday) and (Region__c=:reg or Region__c='Global') and 
                                                   RecordTypeId=:event_rectypeid and Campaign_Sub_Type__c!='Webinar'])
                                {
                                    campaigns c=new campaigns();
                                    c.campaign_id=camp.id;
                                    c.name=camp.Name;
                                    c.startdate=camp.StartDate; 
                                    c.region=camp.Region__c;
                                    c.registered_count=''+camp.Number_of_Registered__c;
                                    c.attended_count=''+camp.Number_of_Attended__c;
                                    c.program=camp.Program__c;
                                    c.country_id=camp.Country__c;
                                    c.country_name=camp.Country__r.Name;
                                    c.event_type=camp.Campaign_Sub_Type__c;
                                    camps.add(c);
                                }
                                resp.campaigns=camps;
                            
                        }
                        catch(Exception e)
                        {
                            resp.iserror=true;
                            resp.error_details=''+e;
                        }
                    }
                }
            }
            else
            {
                resp.iserror=true;
                resp.error_details='userid is not passed in the request';
            }
        }
        else
        {
            resp.iserror=true;
            resp.error_details='No parameters passed in the request';
        }
        
        if(resp.iserror)
        {
            Rest_Create_ErrorLogs.create_log(''+req, resp.error_details, 'Get Active Campaigns',req.httpMethod , 'Get Active Campaigns',req.requesturi, req.params+''   );  
        }       
        return resp;
    }
    
    global class ret_response
    {

        global boolean iserror;
        global String error_details;
        global List<campaigns> campaigns;

    }
    
    private class campaigns
    {
        private string campaign_id;
        private string name;
        private date startdate; 
        private string region;  
        private string registered_count;
        private string attended_count;
        private string event_type;
        private string program;
        private string country_id;
        private string country_name;        
    }
}