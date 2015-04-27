/**
 * Feature #1386: Employment Survey Estimate
 * @createdDate: 18-July-2014
 * @author: PhanithChhun 
 * @description: Hult - Employment Survey Design v0.8.docx -- 5.1.1, 5.2, 5.4, 6.1, 6.2, 6.2.1, 6.2.2, 6.2.3
 * Change log:
 *  -Feature #1463, Phanith 10-Oct-2014 Employment Survey Design v21.docx - Remove 6.1
 *	-Feature #1463, Phanith 22-Oct-2014 Employment Survey Design v21.docx - Remove 5.2, 5.4 
 */
public without sharing class EmploymentHandler {
	public final static String ES_TYPE_TS = 'TS';
	public final static String ES_TYPE_NON_TS = 'Non TS';
	public final static String ES_TYPE_PREVIOUS_EMP = 'Previous Employment';
	public final static String WORKING_INTERN_FOR_COM = 'Working as an intern for a company';
	public final static String WORKING_INTERN_AT_COM = 'Working as an intern at a company';
	public final static String YES_RECEIVED_OFFER_NO_ACCEPT = 'Yes, have received an offer but will not accept it';
	public final static String YES_SEEKING_WITHDRAW_BY_COM = 'Yes, I am seeking, my offer was withdrawn by company';
	public final static String OFFER_EXT_WITHDRAW_OFFER = 'Offer Extended/client later withdrew offer';
	public final static String OFFER_EXT_CANDIDATE_REJ = 'Offer extended/candidate rejected';
	public final static String WORKING_FOR_FAMILY_BUS = 'Working for my family business';
	public final static String HAVE_ACCEPTED_OFFER = 'I have already accepted an offer';
	public final static String FAMILY_BUS = 'Family Business';
	public final static String START_BUS = 'Starting a business';
	public final static String STATUS_PUBLISH = 'Publish';
	public final static String HAVE_OFFER_BUT_UNDECIDED = 'Have an offer but undecided';
	
	private final static ID COR_REL_ACC_RECTYPE_ID;
	private final static ID HULT_JOB_LABS_UID;
	private final static ID FULL_TIME_JOB_RECTYPE_ID;
	private final static ID INTERNSHIP_JOB_RECTYPE_ID;
	private final static ID FULL_TIME_APP_RECTYPE_ID;
	private final static ID INTERNSHIP_APP_RECTYPE_ID;
	private final static ID FULL_TIME_INTV_RECTYPE_ID;
	private final static ID INTERNSHIP_INTV_RECTYPE_ID;
	private final static ID FULL_TIME_PLCMNT_RECTYPE_ID;
	private final static ID INTERNSHIP_PLCMNT_RECTYPE_ID;
	
	static{
		if(COR_REL_ACC_RECTYPE_ID == null){
			COR_REL_ACC_RECTYPE_ID = Schema.SObjectType.Account.RecordTypeInfosByName.get('Corporate Relations Account').RecordTypeId;
		}
		if(HULT_JOB_LABS_UID == null){
			HULT_JOB_LABS_UID = [Select Id From User Where Name = 'Hult Joblabs'].Id;
		}
		if(FULL_TIME_JOB_RECTYPE_ID == null){
			FULL_TIME_JOB_RECTYPE_ID = Schema.SObjectType.ts2__Job__c.RecordTypeInfosByName.get('Full Time').RecordTypeId;
		}
		if(INTERNSHIP_JOB_RECTYPE_ID == null){
			INTERNSHIP_JOB_RECTYPE_ID = Schema.SObjectType.ts2__Job__c.RecordTypeInfosByName.get('Internship').RecordTypeId;
		}
		if(FULL_TIME_APP_RECTYPE_ID == null){
			FULL_TIME_APP_RECTYPE_ID = Schema.SObjectType.ts2__Application__c.RecordTypeInfosByName.get('Full Time').RecordTypeId;
		}
		if(INTERNSHIP_APP_RECTYPE_ID == null){
			INTERNSHIP_APP_RECTYPE_ID = Schema.SObjectType.ts2__Application__c.RecordTypeInfosByName.get('Internship').RecordTypeId;
		}
		if(FULL_TIME_INTV_RECTYPE_ID == null){
			FULL_TIME_INTV_RECTYPE_ID = Schema.SObjectType.ts2__Interview__c.RecordTypeInfosByName.get('Full Time').RecordTypeId;
		}
		if(INTERNSHIP_INTV_RECTYPE_ID == null){
			INTERNSHIP_INTV_RECTYPE_ID = Schema.SObjectType.ts2__Interview__c.RecordTypeInfosByName.get('Internship').RecordTypeId;
		}
		if(FULL_TIME_PLCMNT_RECTYPE_ID == null){
			FULL_TIME_PLCMNT_RECTYPE_ID = Schema.SObjectType.ts2__Placement__c.RecordTypeInfosByName.get('Full Time').RecordTypeId;
		}
		if(INTERNSHIP_PLCMNT_RECTYPE_ID == null){
			INTERNSHIP_PLCMNT_RECTYPE_ID = Schema.SObjectType.ts2__Placement__c.RecordTypeInfosByName.get('Internship').RecordTypeId;
		}
	}
	
	private static Set<String> empsContactIsUpdated;
	
	/**
	 * 5.1.1. Updates to the Contact record: check Employment_Survey__c on save
	 * This method is invoked by trigger EmploymentOnSave (after insert)
	 */
	public static void updateContact(List<Employment_Survey__c> lnew){
		empsContactIsUpdated = new Set<String>();
		Set<String> conIds = new Set<String>();
		for(Employment_Survey__c empSurv : lnew){
			if(empSurv.Student__c != null) conIds.add(empSurv.Student__c);
		}
		Map<Id, Contact> mContact = new Map<Id, Contact>([  Select Id, City__c , Secondary_Email__c,
			 												GMASS_Undergraduate_Major__c, MobilePhone,
			 												Most_recent_function_linkedin__c, Most_recent_industry_linkedin__c,
			 												ESAnnual_Compensation_excl_bonus_in_US__c, ESPrevious_Job_Start_Date__c, 
			 												ESPrevious_Job_Title__c, ESPrevious_Job_Company_Name__c, ESPrevious_Job_Company__c
															From Contact Where Id IN: conIds]);
		
		Map<Id, Contact> updContList = new Map<Id, Contact>();
		for(Employment_Survey__c empSurv : lnew){
			if(empSurv.Student__c == null) continue;
			Contact cont = mContact.get(empSurv.Student__c);
			//Check contact is updated
			if(
				empSurv.Previous_Job_Title__c != cont.ESPrevious_Job_Title__c ||
				empSurv.Previous_Job_Company_Name__c != cont.ESPrevious_Job_Company_Name__c ||
				empSurv.Previous_Job_Company__c != cont.ESPrevious_Job_Company__c ||
				empSurv.Previous_Job_Start_Date__c != cont.ESPrevious_Job_Start_Date__c ||
				empSurv.Annual_Compensation_excl_bonus_in_US__c != cont.ESAnnual_Compensation_excl_bonus_in_US__c
			){
				empsContactIsUpdated.add(empSurv.Id);
			}
			// Update contact info
			if(empSurv.Local_City__c != cont.City__c){
				cont.City__c = empSurv.Local_City__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Personal_Email__c  != cont.Secondary_Email__c){
				cont.Secondary_Email__c = empSurv.Personal_Email__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Undergraduate_Major__c != cont.GMASS_Undergraduate_Major__c){
				cont.GMASS_Undergraduate_Major__c = empSurv.Undergraduate_Major__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Mobile_Phone__c != cont.MobilePhone){
				cont.MobilePhone = empSurv.Mobile_Phone__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Most_recent_function_experience__c != cont.Most_recent_function_linkedin__c){
				cont.Most_recent_function_linkedin__c = empSurv.Most_recent_function_experience__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Most_recent_industry_experience__c != cont.Most_recent_industry_linkedin__c){
				cont.Most_recent_industry_linkedin__c = empSurv.Most_recent_industry_experience__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Annual_Compensation_excl_bonus_in_US__c != cont.ESAnnual_Compensation_excl_bonus_in_US__c){
				cont.ESAnnual_Compensation_excl_bonus_in_US__c = empSurv.Annual_Compensation_excl_bonus_in_US__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Previous_Job_Start_Date__c != cont.ESPrevious_Job_Start_Date__c){
				cont.ESPrevious_Job_Start_Date__c = empSurv.Previous_Job_Start_Date__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Previous_Job_Title__c != cont.ESPrevious_Job_Title__c){
				cont.ESPrevious_Job_Title__c = empSurv.Previous_Job_Title__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Previous_Job_Company_Name__c != cont.ESPrevious_Job_Company_Name__c){
				cont.ESPrevious_Job_Company_Name__c = empSurv.Previous_Job_Company_Name__c;
				updContList.put(cont.Id, cont);
			}
			if(empSurv.Previous_Job_Company__c != cont.ESPrevious_Job_Company__c){
				cont.ESPrevious_Job_Company__c = empSurv.Previous_Job_Company__c;
				updContList.put(cont.Id, cont);
			}
		}
		if(!updContList.isEmpty()) update updContList.values();
	}
	
	/**
	 * V-19 Update
	 * Basically they want to change the logic so that the code does not run on create but on edit and 
	 * only when a new picklist field called "Status__c" is set to "Publish" and 
	 * the field "Are_you_currently_looking_for_a_job__c" is not "Have an offer but undecided"
	 * This method is invoked by trigger EmploymentOnSave (after update)
	 */
	public static void checkUpdatedEmploymentSurvey(List<Employment_Survey__c> lold, List<Employment_Survey__c> lnew){
		List<Employment_Survey__c> listToApplied = new List<Employment_Survey__c>();
		if(lold != null){
			for(Integer i = 0; i < lnew.size(); i++){
				Employment_Survey__c newEmp = lnew[i];
				Employment_Survey__c oldEmp = lold[i];
				if(
					(oldEmp.Status__c != STATUS_PUBLISH && newEmp.Status__c == STATUS_PUBLISH && newEmp.Are_you_currently_looking_for_a_job__c != HAVE_OFFER_BUT_UNDECIDED) || 
					(oldEmp.Are_you_currently_looking_for_a_job__c == HAVE_OFFER_BUT_UNDECIDED && newEmp.Are_you_currently_looking_for_a_job__c != HAVE_OFFER_BUT_UNDECIDED && newEmp.Status__c == STATUS_PUBLISH)	
				){
					listToApplied.add(newEmp);
				}
			}
		}else{
			for(Employment_Survey__c newEmp : lnew){
				if(newEmp.Status__c == STATUS_PUBLISH && newEmp.Are_you_currently_looking_for_a_job__c != HAVE_OFFER_BUT_UNDECIDED){
					listToApplied.add(newEmp);
				}
			}
		}
		if(listToApplied.isEmpty()) return;
		//createSobjectRecords(listToApplied);
		//checkWhatDoingNow(listToApplied);
		//checkNonTsCase(listToApplied);
		checkTsCase(listToApplied);
	}
	
	/**
	 * 5.2.	When the “Employment Survey” is saved, the some records need to be created
	 * This method is invoked by trigger EmploymentOnSave (after insert)
	 
	public static void createSobjectRecords(List<Employment_Survey__c> lnew){
		Map<Id, Account> mCreateAcc = new Map<Id, Account>();
		Map<Id, ts2__Job__c> mCreateJob = new Map<Id, ts2__Job__c>();
		Map<Id, ts2__Application__c> mCreateApp = new Map<Id, ts2__Application__c>();
		Map<Id, ts2__Interview__c> mCreateInter = new Map<Id, ts2__Interview__c>();
		Map<Id, ts2__Placement__c> mCreatePlacement = new Map<Id, ts2__Placement__c>();
		
		for(Employment_Survey__c empSurv : lnew){
			if(empSurv.Previous_Job_Company_Name__c  != null && empSurv.Previous_Job_Company__c == null){
				Account acc = createJobComAccount(empSurv);
				if(acc != null) mCreateAcc.put(empSurv.Id, acc);
			}
			if( empSurv.Previous_Job_Company__c != null || 
				empSurv.Previous_Job_Company_Name__c  != null ||
				empSurv.Previous_Job_Title__c != null ||
				empSurv.Previous_Job_Start_Date__c != null ||
				empSurv.Annual_Compensation_excl_bonus_in_US__c != null
			){
				ts2__Job__c job = createJobComJob(empSurv);
				if(job != null) mCreateJob.put(empSurv.Id, job);
				ts2__Application__c app = createJobComApp(empSurv);
				if(app != null) mCreateApp.put(empSurv.Id, app);
				ts2__Interview__c interv = createJobComInterview(empSurv);
				if(interv != null) mCreateInter.put(empSurv.Id, interv);
				ts2__Placement__c plc = createJobComPlacement(empSurv);
				if(plc != null) mCreatePlacement.put(empSurv.Id, plc);
			}
		}
		
		if(!mCreateAcc.isEmpty()) insert mCreateAcc.values();
		if(!mCreateJob.isEmpty()){
			//assign account previously created
			for(String empSurvId : mCreateJob.keySet()){
				ts2__Job__c job = mCreateJob.get(empSurvId);
				job.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : job.ts2__Account__c;
			}
			insert mCreateJob.values();
		}
		if(!mCreateApp.isEmpty()){
			//assign account, job previously created
			for(String empSurvId : mCreateApp.keySet()){
				ts2__Application__c app = mCreateApp.get(empSurvId);
				app.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : app.ts2__Job__c;
				app.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : app.ts2__Account__c;
			}
			insert mCreateApp.values();
		}
		if(!mCreateInter.isEmpty()){
			//assign account, job, application previously created
			for(String empSurvId : mCreateInter.keySet()){
				ts2__Interview__c interv = mCreateInter.get(empSurvId);
				interv.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : interv.ts2__Job__c;
				interv.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : interv.ts2__Account__c;
				interv.ts2__Related_Application__c = mCreateApp.containsKey(empSurvId) ? mCreateApp.get(empSurvId).Id : interv.ts2__Related_Application__c;
			}
			insert mCreateInter.values();
		}
		if(!mCreatePlacement.isEmpty()){
			//assign account, job, application previously created
			for(String empSurvId : mCreatePlacement.keySet()){
				ts2__Placement__c plcmnt = mCreatePlacement.get(empSurvId);
				plcmnt.ts2__Client__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : plcmnt.ts2__Client__c;
				plcmnt.ts2__Related_Application__c = mCreateApp.containsKey(empSurvId) ? mCreateApp.get(empSurvId).Id : plcmnt.ts2__Related_Application__c;
				plcmnt.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : plcmnt.ts2__Job__c;
			}
			insert mCreatePlacement.values();
		}
	}
	
	
	private static Account createJobComAccount(Employment_Survey__c empSurv){
		Account acc = new Account(
			RecordTypeId = COR_REL_ACC_RECTYPE_ID,
			Name = empSurv.Previous_Job_Company_Name__c,
			OwnerId = HULT_JOB_LABS_UID,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return acc;
	}
	
	private static ts2__Job__c createJobComJob(Employment_Survey__c empSurv){
		ts2__Job__c job = new ts2__Job__c(
			RecordTypeId = FULL_TIME_JOB_RECTYPE_ID,
			Name = empSurv.Previous_Job_Title__c,
			ES_Type__c = ES_TYPE_PREVIOUS_EMP,
			OwnerId = HULT_JOB_LABS_UID,
			ts2__Estimated_Start_Date__c = empSurv.Previous_Job_Start_Date__c,
			ES_Record__c = true,
			ts2__Account__c = empSurv.Previous_Job_Company__c,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return job;
	}
	
	private static ts2__Application__c createJobComApp(Employment_Survey__c empSurv){
		ts2__Application__c app = new ts2__Application__c(
			RecordTypeId = FULL_TIME_APP_RECTYPE_ID,
			ts2__Candidate_Contact__c = empSurv.Student__c,
			ts2__Application_Status__c = 'Hired',
			ts2__Stage__c = 'Placement',
			ts2__App_Status__c = 'Offer made',
			ts2__Account__c = empSurv.Previous_Job_Company__c,
			ES_Type__c = ES_TYPE_PREVIOUS_EMP,
			ES_Record__c = true,
			ts2__Internally_Applied__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return app;
	}
	
	private static ts2__Interview__c createJobComInterview(Employment_Survey__c empSurv){
		ts2__Interview__c intv = new ts2__Interview__c(
			RecordTypeId = FULL_TIME_INTV_RECTYPE_ID,
			ts2__Account__c = empSurv.Previous_Job_Company__c,
			ts2__Candidate__c = empSurv.Student__c,
			ES_Type__c = ES_TYPE_PREVIOUS_EMP,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return intv;
	}
	
	private static ts2__Placement__c createJobComPlacement(Employment_Survey__c empSurv){
		ts2__Placement__c plcmnt = new ts2__Placement__c(
			RecordTypeId = FULL_TIME_PLCMNT_RECTYPE_ID,
			ES_Type__c = ES_TYPE_PREVIOUS_EMP,
			ts2__Employee__c = empSurv.Student__c,
			ts2__Salary__c = empSurv.Annual_Compensation_excl_bonus_in_US__c,
			ts2extams__Substatus__c = 'Started',
			CurrencyIsoCode = 'USD',
			ts2__Start_Date__c = empSurv.Previous_Job_Start_Date__c,
			ts2__Client__c  = empSurv.Previous_Job_Company__c,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return plcmnt;
	}
	*/
	
	/**
	 * 5.4.	If ‘What are you doing now?’ is ‘Family Business’ OR ‘Starting a Business’ OR ‘Working as an intern at a company’
	 * This method is invoked by trigger EmploymentOnSave (after insert)
	
	public static void checkWhatDoingNow(List<Employment_Survey__c> lnew){
		Map<Id, Account> mCreateAcc = new Map<Id, Account>();
		Map<Id, ts2__Job__c> mCreateJob = new Map<Id, ts2__Job__c>();
		Map<Id, ts2__Application__c> mCreateApp = new Map<Id, ts2__Application__c>();
		Map<Id, ts2__Interview__c> mCreateInter = new Map<Id, ts2__Interview__c>();
		Map<Id, ts2__Placement__c> mCreatePlacement = new Map<Id, ts2__Placement__c>();
		for(Employment_Survey__c empSurv : lnew){
			String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
			if(	whatdoing != FAMILY_BUS.toLowercase() && 
				whatdoing != START_BUS.toLowercase() && 
				whatdoing != WORKING_FOR_FAMILY_BUS.toLowercase() &&
				whatdoing != WORKING_INTERN_AT_COM.toLowercase()) continue;
			if(empSurv.Name_of_Bus__c != null && empSurv.Company_Bus__c == null){
				Account acc = createComBusAccount(empSurv);
				if(acc != null) mCreateAcc.put(empSurv.Id, acc);
			}
			
			ts2__Job__c job = createComBusJob(empSurv);
			if(job != null) mCreateJob.put(empSurv.Id, job);
			ts2__Application__c app = createComBusApp(empSurv);
			if(app != null) mCreateApp.put(empSurv.Id, app);
			ts2__Interview__c interv = createComBusInterview(empSurv);
			if(interv != null) mCreateInter.put(empSurv.Id, interv);
			ts2__Placement__c plc = createComBusPlacement(empSurv);
			if(plc != null) mCreatePlacement.put(empSurv.Id, plc);
		}
		
		if(!mCreateAcc.isEmpty()) insert mCreateAcc.values();
		if(!mCreateJob.isEmpty()){
			//assign account previously created
			for(String empSurvId : mCreateJob.keySet()){
				ts2__Job__c job = mCreateJob.get(empSurvId);
				job.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : job.ts2__Account__c;
			}
			insert mCreateJob.values();
		}
		if(!mCreateApp.isEmpty()){
			//assign account, job previously created
			for(String empSurvId : mCreateApp.keySet()){
				ts2__Application__c app = mCreateApp.get(empSurvId);
				app.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : app.ts2__Job__c;
				app.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : app.ts2__Account__c;
			}
			insert mCreateApp.values();
		}
		if(!mCreateInter.isEmpty()){
			//assign account, job, application previously created
			for(String empSurvId : mCreateInter.keySet()){
				ts2__Interview__c interv = mCreateInter.get(empSurvId);
				interv.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : interv.ts2__Job__c;
				interv.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : interv.ts2__Account__c;
				interv.ts2__Related_Application__c = mCreateApp.containsKey(empSurvId) ? mCreateApp.get(empSurvId).Id : interv.ts2__Related_Application__c;
			}
			insert mCreateInter.values();
		}
		if(!mCreatePlacement.isEmpty()){
			//assign account, job, application previously created
			for(String empSurvId : mCreatePlacement.keySet()){
				ts2__Placement__c plcmnt = mCreatePlacement.get(empSurvId);
				plcmnt.ts2__Client__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : plcmnt.ts2__Client__c;
				plcmnt.ts2__Related_Application__c = mCreateApp.containsKey(empSurvId) ? mCreateApp.get(empSurvId).Id : plcmnt.ts2__Related_Application__c;
				plcmnt.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : plcmnt.ts2__Job__c;
			}
			insert mCreatePlacement.values();
		}
	}
	
	 
	private static Account createComBusAccount(Employment_Survey__c empSurv){
		Account acc = new Account(
			RecordTypeId = COR_REL_ACC_RECTYPE_ID,
			Name = empSurv.Name_of_Bus__c,
			OwnerId = HULT_JOB_LABS_UID,
			ES_Record__c = true,
			Industry = empSurv.Industry_Bus__c,
			City__c = empSurv.City_Bus__c,
			Type = empSurv.Type__c,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return acc;
	}
	
	private static ts2__Job__c createComBusJob(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		ts2__Job__c job = new ts2__Job__c(
			RecordTypeId = whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? INTERNSHIP_JOB_RECTYPE_ID : FULL_TIME_JOB_RECTYPE_ID,
			Name = empSurv.Job_Title_Bus__c,
			ES_Type__c = whatdoing == WORKING_FOR_FAMILY_BUS.toLowerCase() ? FAMILY_BUS : (whatdoing == START_BUS.toLowercase() ? START_BUS : (whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? 'Internship' : '')),
			OwnerId = HULT_JOB_LABS_UID,
			ES_Record__c = true,
			ts2__Account__c = empSurv.Company_Bus__c,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate,
			Duration_of_Internship_months__c = empSurv.Expected_Length__c
		);
		return job;
	}
	
	private static ts2__Application__c createComBusApp(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		ts2__Application__c app = new ts2__Application__c(
			RecordTypeId = whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? INTERNSHIP_APP_RECTYPE_ID : FULL_TIME_APP_RECTYPE_ID,
			ts2__Candidate_Contact__c = empSurv.Student__c,
			ts2__Application_Status__c = 'Hired',
			ts2__Stage__c = 'Placement',
			ts2__Status__c = 'Accepted',
			ts2__App_Status__c = 'Offer made',
			ts2__Account__c = empSurv.Company_Bus__c,
			ES_Type__c = whatdoing == WORKING_FOR_FAMILY_BUS.toLowerCase() ? FAMILY_BUS : (whatdoing == START_BUS.toLowercase() ? START_BUS : (whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? 'Internship' : '')),
			ES_Record__c = true,
			ts2__Internally_Applied__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return app;
	}
	
	private static ts2__Interview__c createComBusInterview(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		ts2__Interview__c intv = new ts2__Interview__c(
			RecordTypeId = whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? INTERNSHIP_INTV_RECTYPE_ID : FULL_TIME_INTV_RECTYPE_ID,
			ts2__Account__c = empSurv.Company_Bus__c,
			ts2__Candidate__c = empSurv.Student__c,
			ES_Type__c = whatdoing == WORKING_FOR_FAMILY_BUS.toLowerCase() ? FAMILY_BUS : (whatdoing == START_BUS.toLowercase() ? START_BUS : (whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? 'Internship' : '')),
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return intv;
	}
	
	private static ts2__Placement__c createComBusPlacement(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		ts2__Placement__c plcmnt = new ts2__Placement__c(
			RecordTypeId = whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? INTERNSHIP_PLCMNT_RECTYPE_ID : FULL_TIME_PLCMNT_RECTYPE_ID,
			ES_Type__c = whatdoing == WORKING_FOR_FAMILY_BUS.toLowerCase() ? FAMILY_BUS : (whatdoing == START_BUS.toLowercase() ? START_BUS : (whatdoing == WORKING_INTERN_AT_COM.toLowercase() ? 'Internship' : '')),
			ts2__Employee__c = empSurv.Student__c,
			ts2__Salary__c = empSurv.Salary_if_any_in_USD__c,
			CurrencyIsoCode = 'USD',
			ts2__Start_Date__c = empSurv.Start_Date__c,
			ts2__Client__c  = empSurv.Company_Bus__c,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate,
			ts2extams__Substatus__c = 'Started'
		);
		return plcmnt;
	}
	 */
	 
	/**
	 * 6.1.	Non-TS Case
	 * This method is invoked by trigger EmploymentOnSave (after insert)
	 * 
	public static void checkNonTsCase(List<Employment_Survey__c> lnew){
		
		return false;
		Map<Id, Account> mCreateAcc = new Map<Id, Account>();
		Map<Id, ts2__Job__c> mCreateJob = new Map<Id, ts2__Job__c>();
		Map<Id, ts2__Application__c> mCreateApp = new Map<Id, ts2__Application__c>();
		Map<Id, ts2__Interview__c> mCreateInter = new Map<Id, ts2__Interview__c>();
		Map<Id, ts2__Placement__c> mCreatePlacement = new Map<Id, ts2__Placement__c>();
		for(Employment_Survey__c empSurv : lnew){
			if( empSurv.TS_Application__c == null && 
				!empSurv.Can_t_find_on_TS__c &&
				empSurv.Job_Title__c != null && 
				(empSurv.Offer_Company__c != null || empSurv.Offer_Company_Name__c != null)){
				
				if(empSurv.Offer_Company__c == null && empSurv.Offer_Company_Name__c != null){
					Account acc = createNonTsAccount(empSurv);
					if(acc != null) mCreateAcc.put(empSurv.Id, acc);
				}
				
				ts2__Job__c job = createNonTsJob(empSurv);
				if(job != null) mCreateJob.put(empSurv.Id, job);
				ts2__Application__c app = createNonTsApp(empSurv);
				if(app != null) mCreateApp.put(empSurv.Id, app);
				ts2__Interview__c interv = createNonTsInterview(empSurv);
				if(interv != null) mCreateInter.put(empSurv.Id, interv);
				ts2__Placement__c plc = createNonTsPlacement(empSurv);
				if(plc != null) mCreatePlacement.put(empSurv.Id, plc);
			}
		}
		
		if(!mCreateAcc.isEmpty()) insert mCreateAcc.values();
		if(!mCreateJob.isEmpty()){
			//assign account previously created
			for(String empSurvId : mCreateJob.keySet()){
				ts2__Job__c job = mCreateJob.get(empSurvId);
				job.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : job.ts2__Account__c;
			}
			insert mCreateJob.values();
		}
		if(!mCreateApp.isEmpty()){
			//assign account, job previously created
			for(String empSurvId : mCreateApp.keySet()){
				ts2__Application__c app = mCreateApp.get(empSurvId);
				app.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : app.ts2__Job__c;
				app.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : app.ts2__Account__c;
			}
			insert mCreateApp.values();
		}
		if(!mCreateInter.isEmpty()){
			//assign account, job, application previously created
			for(String empSurvId : mCreateInter.keySet()){
				ts2__Interview__c interv = mCreateInter.get(empSurvId);
				interv.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : interv.ts2__Job__c;
				interv.ts2__Account__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : interv.ts2__Account__c;
				interv.ts2__Related_Application__c = mCreateApp.containsKey(empSurvId) ? mCreateApp.get(empSurvId).Id : interv.ts2__Related_Application__c;
			}
			insert mCreateInter.values();
		}
		if(!mCreatePlacement.isEmpty()){
			//assign account, job, application previously created
			for(String empSurvId : mCreatePlacement.keySet()){
				ts2__Placement__c plcmnt = mCreatePlacement.get(empSurvId);
				plcmnt.ts2__Client__c = mCreateAcc.containsKey(empSurvId) ? mCreateAcc.get(empSurvId).Id : plcmnt.ts2__Client__c;
				plcmnt.ts2__Related_Application__c = mCreateApp.containsKey(empSurvId) ? mCreateApp.get(empSurvId).Id : plcmnt.ts2__Related_Application__c;
				plcmnt.ts2__Job__c = mCreateJob.containsKey(empSurvId) ? mCreateJob.get(empSurvId).Id : plcmnt.ts2__Job__c;
			}
			insert mCreatePlacement.values();
		}
	}
	
	private static Account createNonTsAccount(Employment_Survey__c empSurv){
		Account acc = new Account(
			RecordTypeId = COR_REL_ACC_RECTYPE_ID,
			Name = empSurv.Offer_Company_Name__c,
			OwnerId = HULT_JOB_LABS_UID,
			CR_Ownership_Type__c = empSurv.Ownership_Type__c,
			Industry = empSurv.Industry__c,
			City__c = empSurv.City__c,
			CR_Company_Size__c = empSurv.Company_Size__c,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return acc;
	}
	*/
	public static ts2__Job__c createNonTsJob(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		ts2__Job__c job = new ts2__Job__c(
			RecordTypeId = FULL_TIME_JOB_RECTYPE_ID,
			Name = empSurv.Job_Title__c,
			Function__c = empSurv.Job_Function__c,
			Job_Industry__c = empSurv.Job_Industry__c,
			City__c = empSurv.Job_City__c,
			Work_Authorization__c = empSurv.Work_Authorisation_Status_for_Offer__c,
			OwnerId = HULT_JOB_LABS_UID,
			ts2__Estimated_Start_Date__c = empSurv.Employment_Start_Date__c,
			ES_Record__c = true,
			ES_Type__c = ES_TYPE_NON_TS,
			ts2__Account__c = empSurv.Offer_Company__c,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return job;
	}
	
	public static ts2__Application__c createNonTsApp(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		String lookingforjob = empSurv.Are_you_currently_looking_for_a_job__c == null ? '' : empSurv.Are_you_currently_looking_for_a_job__c.toLowercase();
		ts2__Application__c app = new ts2__Application__c(
			RecordTypeId = FULL_TIME_APP_RECTYPE_ID,
			ts2__Candidate_Contact__c = empSurv.Student__c,
			ts2__Application_Status__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() ||
			 	lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Rejected' : 'Hired',
			ts2__Status__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() ||
			 	lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Rejected' : 'Accepted',
			ts2__Reject_Reason__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() ? OFFER_EXT_CANDIDATE_REJ :
			 	lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? OFFER_EXT_WITHDRAW_OFFER : null,
			ts2__Stage__c = 'Placement', 
			ts2__Account__c = empSurv.Offer_Company__c,
			ES_Record__c = true,
			ES_Type__c = ES_TYPE_NON_TS,
			ts2__Internally_Applied__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate,
			ts2__App_Status__c = lookingforjob == HAVE_ACCEPTED_OFFER.toLowercase() ? 'Hired' : ''
		);
		return app;
	}
	/*
	private static ts2__Interview__c createNonTsInterview(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		ts2__Interview__c intv = new ts2__Interview__c(
			RecordTypeId = FULL_TIME_INTV_RECTYPE_ID,
			ts2__Account__c = empSurv.Offer_Company__c,
			ts2__Candidate__c = empSurv.Student__c,
			ES_Type__c = ES_TYPE_NON_TS,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return intv;
	}
	
	private static ts2__Placement__c createNonTsPlacement(Employment_Survey__c empSurv){
		String whatdoing = empSurv.What_are_you_doing_now__c == null ? '' : empSurv.What_are_you_doing_now__c.toLowercase();
		String lookingforjob = empSurv.Are_you_currently_looking_for_a_job__c == null ? '' : empSurv.Are_you_currently_looking_for_a_job__c.toLowercase();
		ts2__Placement__c plcmnt = new ts2__Placement__c(
			RecordTypeId = FULL_TIME_PLCMNT_RECTYPE_ID,
			ES_Type__c = ES_TYPE_NON_TS,
			ts2__Employee__c = empSurv.Student__c,
			ts2__Client__c  = empSurv.Offer_Company__c,
			Offered_Date__c = empSurv.Offer_Received_Date__c,
			Offer_Accepted_Date__c = empSurv.Offer_Accepted_Date__c,
			ts2__Start_Date__c = empSurv.Employment_Start_Date__c,
			CurrencyIsoCode = 'USD',
			Local_Comp_Signing_Bonus__c = empSurv.Comp_Signing_Bonus__c,
			Local_Comp_Base__c = empSurv.Comp_Base__c,
			Local_Comp_Stock_Options__c = empSurv.Comp_Stock_Options__c,
			Local_Comp_Other_Guaranteed_Comp__c = empSurv.Comp_Other_guaranteed_comp__c,
			HCP_Currency__c  = empSurv.HCP_Currencies_Lookup__c,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate,
			ts2extams__Substatus__c = lookingforjob == HAVE_ACCEPTED_OFFER.toLowercase() ? 'Offer Accepted' : (lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowerCase() || lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT ? 'Offer Made' : '') 
		);
		return plcmnt;
	}
	*/
	 
	/**
	 * 6.2. TS Case (Identified) 
	 * This method is invoked by trigger EmploymentOnSave (after insert)
	 */
	public static void checkTsCase(List<Employment_Survey__c> lnew){
		List<Employment_Survey__c> lFixedEmp = new List<Employment_Survey__c>();
		Map<Id, ts2__Interview__c> existingInter = new Map<Id, ts2__Interview__c>();
		Map<Id, ts2__Placement__c> existingPlacement = new Map<Id, ts2__Placement__c>();
		Set<Id> appIds = new Set<Id>();
		for(Employment_Survey__c empSurv : lnew){
			if(empSurv.TS_Application__c == null) continue;
			lFixedEmp.add(empSurv);
			appIds.add(empSurv.TS_Application__c);
		}
		for(ts2__Interview__c inter : [Select Id, ts2__Related_Application__c From ts2__Interview__c Where ts2__Related_Application__c IN: appIds order by CreatedDate]){
			existingInter.put(inter.ts2__Related_Application__c, inter);
		}
		for(ts2__Placement__c plcm : [Select Id, Local_Comp_Other_guaranteed_comp__c, Local_Comp_Stock_Options__c, Local_Comp_Base__c,
										Local_Comp_Signing_Bonus__c, HCP_Currency__c, ts2extams__Substatus__c, ts2__Related_Application__c, 
										Offered_Date__c, Offer_Accepted_Date__c, ts2__Start_Date__c, CurrencyIsoCode, 
										Signing_Bonus__c, ts2__Salary__c, Comp_Stock_Options__c, Comp_Other_guaranteed_comp__c From ts2__Placement__c Where ts2__Related_Application__c IN: appIds order by CreatedDate]){
			existingPlacement.put(plcm.ts2__Related_Application__c, plcm);
		}
		Map<Id, ts2__Application__c> mAppInfo = new Map<Id, ts2__Application__c>([Select Id, RecordTypeId, 
				ts2__Job__c, ts2__Account__c, ts2__Candidate_Contact__c From ts2__Application__c Where Id IN: appIds]);
		Map<Id, ts2__Interview__c> mCreateInter = new Map<Id, ts2__Interview__c>();
		Map<Id, ts2__Placement__c> mCreatePlacement = new Map<Id, ts2__Placement__c>();
		Map<Id, ts2__Application__c> mUpdateApp = new Map<Id, ts2__Application__c>();
		for(Employment_Survey__c empSurv : lFixedEmp){
			String appId = empSurv.TS_Application__c;
			ts2__Application__c app = mAppInfo.get(appId);
			if(app != null){
				updateTsApplication(empSurv, app, 'any');
				mUpdateApp.put(app.Id, app);
			}
			
			//6.2.1. Option 1: Application exists – No Interview or Placement 
			if(existingInter.get(appId) == null){
				mCreateInter.put(empSurv.Id, createTsInterview(empSurv, mAppInfo));
			}
			//6.2.2. Option 2: Application and Interview exists – No Placement
			if(existingPlacement.get(appId) == null){
				mCreatePlacement.put(empSurv.Id, createTsPlacement(empSurv, mAppInfo));
			}
			//6.2.3. Option 3: Application, Interview and Placement exist
			if(existingInter.get(appId) != null && existingPlacement.get(appId) != null){
				ts2__Placement__c newPlcmnt = createTsPlacement(empSurv, mAppInfo);
				ts2__Placement__c oldPlcmnt = existingPlacement.get(appId);
				newPlcmnt.Id = oldPlcmnt.Id;
				newPlcmnt.Old_Offer_Date__c = oldPlcmnt.Offered_Date__c;
				newPlcmnt.Old_Offer_Accepted_Date__c = oldPlcmnt.Offer_Accepted_Date__c;
				newPlcmnt.Old_Start_Date__c = oldPlcmnt.ts2__Start_Date__c;
				newPlcmnt.Old_HCP_Currency__c = oldPlcmnt.HCP_Currency__c;
				newPlcmnt.Old_Local_Comp_Signing_Bonus__c = oldPlcmnt.Local_Comp_Signing_Bonus__c;
				newPlcmnt.Old_Local_Comp_Base__c = oldPlcmnt.Local_Comp_Base__c;
				newPlcmnt.Old_Local_Comp_Stock_Options__c = oldPlcmnt.Local_Comp_Stock_Options__c;
				newPlcmnt.Old_Local_Comp_Other_guaranteed_comp__c = oldPlcmnt.Local_Comp_Other_guaranteed_comp__c;
				newPlcmnt.Old_Substatus__c = oldPlcmnt.ts2extams__Substatus__c;
				newPlcmnt.Old_CurrencyIsoCode__c = oldPlcmnt.CurrencyIsoCode;
				newPlcmnt.Old_Signing_Bonus__c = oldPlcmnt.Signing_Bonus__c;
				newPlcmnt.Old_Salary__c = oldPlcmnt.ts2__Salary__c;
				newPlcmnt.Old_Comp_Stock_Options__c = oldPlcmnt.Comp_Stock_Options__c;
				newPlcmnt.Old_Comp_Other_guaranteed_comp__c = oldPlcmnt.Comp_Other_guaranteed_comp__c;
				mCreatePlacement.put(empSurv.Id, newPlcmnt);
			}
		}
		
		if(!mCreateInter.isEmpty()){
			insert mCreateInter.values();
		}
		if(!mCreatePlacement.isEmpty()){
			upsert mCreatePlacement.values();
		}
		if(!mUpdateApp.isEmpty()){
			update mUpdateApp.values();
		}
	}
	
	private static ts2__Interview__c createTsInterview(Employment_Survey__c empSurv, Map<Id, ts2__Application__c> mAppInfo){
		ts2__Application__c appInfo = mAppInfo.get(empSurv.TS_Application__c);
		ts2__Interview__c intv = new ts2__Interview__c(
			RecordTypeId = appInfo.RecordTypeId == FULL_TIME_APP_RECTYPE_ID ? FULL_TIME_INTV_RECTYPE_ID : INTERNSHIP_INTV_RECTYPE_ID,
			ts2__Related_Application__c = appInfo.Id,
			ts2__Job__c = appInfo.ts2__Job__c,
			ts2__Account__c = appInfo.ts2__Account__c,
			ts2__Candidate__c = appInfo.ts2__Candidate_Contact__c,
			ES_Record__c = true,
			ES_Type__c = ES_TYPE_TS,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate
		);
		return intv;
	}
	
	private static ts2__Placement__c createTsPlacement(Employment_Survey__c empSurv, Map<Id, ts2__Application__c> mAppInfo){
		String lookingforjob = empSurv.Are_you_currently_looking_for_a_job__c == null ? '' : empSurv.Are_you_currently_looking_for_a_job__c.toLowercase();
		ts2__Application__c appInfo = mAppInfo.get(empSurv.TS_Application__c);
		ts2__Placement__c plcmnt = new ts2__Placement__c(
			RecordTypeId = appInfo.RecordTypeId == FULL_TIME_APP_RECTYPE_ID ? FULL_TIME_PLCMNT_RECTYPE_ID : INTERNSHIP_PLCMNT_RECTYPE_ID,
			ES_Type__c = ES_TYPE_TS,
			ts2__Job__c  = appInfo.ts2__Job__c,
			ts2__Employee__c = appInfo.ts2__Candidate_Contact__c,
			ts2__Related_Application__c = appInfo.Id,
			ts2__Client__c = appInfo.ts2__Account__c,
			Offered_Date__c = empSurv.Offer_Received_Date__c,
			Offer_Accepted_Date__c = empSurv.Offer_Accepted_Date__c,
			ts2__Start_Date__c = empSurv.Employment_Start_Date__c,	
			CurrencyISOCode = 'USD',
			Local_Comp_Signing_Bonus__c = empSurv.Comp_Signing_Bonus__c,
			Local_Comp_Base__c = empSurv.Comp_Base__c,
			Local_Comp_Stock_Options__c = empSurv.Comp_Stock_Options__c,
			Local_Comp_Other_Guaranteed_Comp__c = empSurv.Comp_Other_guaranteed_comp__c,
			HCP_Currency__c  = empSurv.HCP_Currencies_Lookup__c,
			ES_Record__c = true,
			CS_Advisor__c = empSurv.OwnerId,
			CS_Advisor_Timestamp__c = empSurv.CreatedDate,
			ts2extams__Substatus__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() || lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Offer Made' : (lookingforjob == HAVE_ACCEPTED_OFFER.toLowercase() ? 'Offer Accepted' : '')
		);
		return plcmnt;
	}
	
	//caseNumber {'6.2.1', '6.2.2', '6.2.3'}, any caseNumber will do the same update
	private static void updateTsApplication(Employment_Survey__c empSurv, ts2__Application__c app, String caseNumber){
		//Future: caseNumber will be used to update idividual information
		String lookingforjob = empSurv.Are_you_currently_looking_for_a_job__c == null ? '' : empSurv.Are_you_currently_looking_for_a_job__c.toLowercase();
		app.ts2__Application_Status__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() || lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Rejected' : (lookingforjob == HAVE_ACCEPTED_OFFER.toLowercase() ? 'Hired' : 'Active');
		app.ts2__Status__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() || lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Rejected' : 'Accepted';
		app.ts2__App_Status__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() || lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Offer/Rejected' : (lookingforjob == HAVE_ACCEPTED_OFFER.toLowercase() ? 'Hired' : 'Offer Made');
		app.ts2__Reject_Reason__c = lookingforjob == YES_RECEIVED_OFFER_NO_ACCEPT.toLowercase() ? 'Offer extended/candidate rejected' : (lookingforjob == YES_SEEKING_WITHDRAW_BY_COM.toLowercase() ? 'Offer Extended/client later withdrew offer' : '');
		app.ts2__Stage__c = 'Placement';
	}
}