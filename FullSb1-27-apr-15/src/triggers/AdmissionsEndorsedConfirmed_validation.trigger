/*
Author          : Premanath Reddy
created Date    : 11/9/2012    
Purpouse        : It will give validation Errors where Changing Application Sub-Stage from ‘AEC Quality – Low – missing test date/proof of test’
                  and where at least one of the entries in Exams does not have a date greater or equal to 'Accepted Date’  
                  in the field “Planned Test Date” should receive an error message when any user with a profile 
                  other than Operations-AAM attempts to change.
                  
Changes         : by SHS on 5/6/2013
                : Removed query on user to get Profile name and used record type helper.  
                  added profiles 2,5,6 and admin in if condition (i.e exclude these profiles from AEC Quality - Low - Missing test date/proof of test date validate)        
                           
Modified By     :Anil.B---15/11/2013----JIRA NO :::SFSUP-672                 
Modified By     :SHS -7/2/2014   -- SFSUP-745
                 And commented code that copies opp stage name to Contact & placed that code in SyncOpportunitycontactfields trigger.                   
Modified Prem 	: SFSUP-767

Modifications   : SHS --- 4/16/2015 
 				  There are 2 for loops and 2 SOQL with diff. conditions , I made all of them into 1 query & 1 iteration.
*/
trigger AdmissionsEndorsedConfirmed_validation on Opportunity (before update)
{
	set<id> opps_substage_change=new set<id>();
    set<id> opps_stage_change=new set<id>();
	for(Opportunity opp:Trigger.New){
        if(!RecordTypeHelper.isapplicationprocessrecordtype(opp.RecordTypeId))
            continue;
        if(Trigger.NewMap.get(opp.id).Application_Substage__c!=Trigger.oldMap.get(opp.id).Application_Substage__c
        && Trigger.oldMap.get(opp.id).Application_Substage__c=='AEC Quality - Low - Missing test date/proof of test')
        {
            opps_substage_change.add(opp.id);
        }
		if(Trigger.NewMap.get(opp.id).StageName!=Trigger.oldMap.get(opp.id).StageName 
        && (Trigger.NewMap.get(opp.id).StageName=='Admissions Endorsed Confirmed'||Trigger.NewMap.get(opp.id).StageName=='Conditionally Confirmed'||Trigger.NewMap.get(opp.id).StageName=='Soft Rejected Confirmed'))
        {
			opps_stage_change.add(opp.id);
        }
	}
	if(!opps_substage_change.IsEmpty() || !opps_stage_change.IsEmpty() ){
		Map<id,id> varmap=new Map<id,id>();
        for(Exam__c e : [Select id,Planned_Test_Date__c,Application__c,Application__r.Accepted_Date__c From Exam__c 
        Where Application__c in:opps_stage_change or Application__c in:opps_substage_change]){
			if(e.Planned_Test_Date__c >=e.Application__r.Accepted_Date__c){
				varmap.put(e.Application__c,e.id);
            }			
		}
		
		if(!varmap.IsEmpty()){
			for(Opportunity opp:Trigger.New)
			{
				if(opps_substage_change.Contains(opp.Id))
				{
					String s;
					s= RecordTypeHelper.getprofilename(Userinfo.getProfileId());
					if(s!='Operations-AAM' && s!='Sales-Recruiter and Converter' && s!='Sales-Product Head' && 
					s!='Sales-Global Product Head' && s!='Sales-Regional Head' && s!='System Administrator'){
						if(varmap.get(opp.id)==null){
								Trigger.newMap.get(opp.Id).addError('A Planned Test Date must be'+
								' entered in the relevant field under Exams before you can change the sub-stage'+
								' from AEC – Quality – Low –missing test date/proof of test');                        
						}
						else{
								opp.Test_date_proof_of_test_not_submitted__c=false;
						}
						
					}
				}
				if(opps_stage_change.contains(opp.Id)){
					if(varmap.get(opp.id)==null){
                        opp.Product_Head_interview_has_not_happened__c=false;
                        opp.Test_date_proof_of_test_not_submitted__c=True;
                        opp.Application_Substage__c='AEC Quality - Low - Missing test date/proof of test';
                    }
                    else{
                    /* the checkbox ‘Product Head interview has not happened’ will be marked as True and substage is 
					"AEC Quality - Low" when the Exam Date should have.*/
                        opp.Test_date_proof_of_test_not_submitted__c=false;
                        opp.Application_Substage__c='AEC Quality - Low';
                        opp.Product_Head_interview_has_not_happened__c=True;
                    }
				}
				
			}
		}
	}
}