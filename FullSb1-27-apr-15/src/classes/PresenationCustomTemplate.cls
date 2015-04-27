public with sharing class PresenationCustomTemplate {
	private Id presenationId = ApexPages.currentPage().getParameters().get('id');
	private JSPresent__Presentation__c presentation {get;set;}
	private String attachmentNameTemplate;

	public List<JSPresent__Presentation_List__c> presentationList {get;set;}
	public Integer plSize {get;set;}

	public Map<Id,String> mapNative {get; private set;}
	public Map<Id,String> mapWorkingProficiency {get;private set;}
	public Map<Id,String> mapIndustryExperience {get;private set;}
	public Map<Id,String> mapFunctionExperience {get;private set;}
	public Map<Id,String> mapExperienceLocation {get;private set;}

	//================ Controllers
	public PresenationCustomTemplate(ApexPages.StandardController controller) {
		presentation = [SELECT Id,Name,JSPresent__Job_Order__c FROM JSPresent__Presentation__c WHERE Id =: presenationId LIMIT 1];
	}

	public PresenationCustomTemplate() {

	}

	//================ Methods
	public void preparePresentationList() {
		presentationList = [
			SELECT JSPresent__Contact__r.FirstName, JSPresent__Contact__r.LastName, JSPresent__Contact__r.Secondary_Email__c, JSPresent__Contact__r.Email,
				JSPresent__Contact__r.Current_Phone__c, JSPresent__Contact__r.Current_Location__c, JSPresent__Contact__r.Hult_Campus__c, JSPresent__Contact__r.Program_formatted_for_letters__c,
				JSPresent__Contact__r.Experience_Industry_LinkedIn__c , JSPresent__Contact__r.Experience_Function_LinkedIn__c , JSPresent__Contact__r.Work_Experience_Years__c,
				JSPresent__Contact__r.Native_Languages__c, JSPresent__Contact__r.Languages__c, JSPresent__Contact__r.ts2__Executive_summary__c, JSPresent__Application__r.Account_Name__c,
				JSPresent__Application__r.Job_Title__c, JSPresent__Contact__r.Experience_Location_Countries__c
			FROM JSPresent__Presentation_List__c
			WHERE JSPresent__Presentation__c =: presenationId ORDER BY JSPresent__Sort_Order__c NULLS LAST, JSPresent__Contact__r.LastName
		];
		plSize = presentationList.size();
		mapWorkingProficiency = new Map<Id,String>();
		mapIndustryExperience = new Map<Id,String>();
		mapFunctionExperience = new Map<Id,String>();
		mapNative = new Map<Id,String>();
		mapExperienceLocation = new Map<Id,String>();
		for (JSPresent__Presentation_List__c plItem :presentationList) {
			//Fill up the mapWorkingProficiency map
			String strWorkingProficiency = '';
			if (!String.isBlank(plItem.JSPresent__Contact__r.Languages__c)) {
				strWorkingProficiency = plItem.JSPresent__Contact__r.Languages__c.replace(';','; ');
			}
			mapWorkingProficiency.put(plItem.Id,strWorkingProficiency);

			//Fill up the mapIndustryExperience
			String strIndustryExperience = '';
			if (!String.isBlank(plItem.JSPresent__Contact__r.Experience_Industry_LinkedIn__c )) {
				strIndustryExperience = plItem.JSPresent__Contact__r.Experience_Industry_LinkedIn__c.replace(';','; ');
			}
			mapIndustryExperience.put(plItem.Id,strIndustryExperience);

			//Fill up the mapFunctionExperience
			String strFunctionExperience = '';
			if (!String.isBlank(plItem.JSPresent__Contact__r.Experience_Function_LinkedIn__c )) {
				strFunctionExperience = plItem.JSPresent__Contact__r.Experience_Function_LinkedIn__c .replace(';','; ');
			}
			mapFunctionExperience.put(plItem.Id,strFunctionExperience);

			//Fill up the mapNative
			String strNative = '';
			if (!String.isBlank(plItem.JSPresent__Contact__r.Native_Languages__c)) {
				strNative = plItem.JSPresent__Contact__r.Native_Languages__c.replace(';','; ');
			}
			mapNative.put(plItem.Id,strNative);

			//Fill up the mapExperienceLocation
			String strExperienceLocation = '';
			System.debug('### 1 : '+plItem.JSPresent__Contact__r.Experience_Location_Countries__c);
			if (!String.isBlank(plItem.JSPresent__Contact__r.Experience_Location_Countries__c)) {
				strExperienceLocation = plItem.JSPresent__Contact__r.Experience_Location_Countries__c.replace(';','; ');
			}
			System.debug('### strExperienceLocation : '+strExperienceLocation);
			mapExperienceLocation.put(plItem.Id,strExperienceLocation);
			System.debug('### mapExperienceLocation : '+mapExperienceLocation);
		}

	}

	public PageReference createPDF() {
		String url = Page.TransitionalPageTemplate.getUrl()+'?Id='+presenationId;
		PageReference templatePage = new PageReference(url);

		//Account Name - Job Title - Date.pdf
		String dateStr = System.now().format('(MM dd yyyy)');

		List<ts2__Job__c> relatedJob = [SELECT Name,ts2__Account__r.Name FROM ts2__Job__c WHERE Id =: presentation.JSPresent__Job_Order__c LIMIT 1];
		if (relatedJob.isEmpty()) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, 'There is no related Job for this Presentation.'));
			return NULL;
		}
		attachmentNameTemplate = relatedJob[0].ts2__Account__r.Name + ' - ' + relatedJob[0].Name + ' - ' + dateStr;


		Attachment attachmentPDF = New Attachment();
		if (!System.Test.isRunningTest()) {
			attachmentPDF.Body = templatePage.getContentasPdf();
		} else {
			attachmentPDF.Body = Blob.valueOf('test');
		}
		attachmentPDF.Name = attachmentNameTemplate + '.pdf';
		attachmentPDF.ParentId = presenationId;
		try {
			insert attachmentPDF;
			ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.CONFIRM, 'The ' + attachmentPDF.Name + ' was successfully added.'));
		} catch (Exception e) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR, e.getMessage()));
		}
		return NULL;
	}

}