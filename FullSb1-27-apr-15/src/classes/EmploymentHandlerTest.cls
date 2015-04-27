/**
 * Test class for EmploymentHandler will cover business logic and expected result
 * @create date: 30/07/2014
 * @category: test logic
 * @author: Phanith Chhun
 */
@isTest
public class EmploymentHandlerTest {
	private static User u;
	private static Employment_Survey__c employSur;
	private static Employment_Survey__c employSur2;
	
	/**
     * Initialize Testing Data
     */
    private static void setUpData(){
        //Create user
        Profile pro = [select id from Profile where Name = 'System Administrator' limit 1];
        u = new User(alias = 'u2', email = 'EmploymentHandler@test.com', emailencodingkey = 'UTF-8', 
                            FirstName = 'EmploymentHandler' , lastname = 'U', languagelocalekey = 'en_US',
                            localesidkey = 'en_US', profileid = pro.Id, timezonesidkey = 'America/Los_Angeles', CommunityNickname = 'u2',
                            isActive = true, username = 'EmploymentHandler@test.com');
        insert u;
        
        City__c cty = new City__c();
        cty.Name = 'test';
        insert cty;
        
        City__c cty2 = new City__c();
        cty2.Name = 'test2';
        insert cty2;
        
        Account acc = New Account();
        acc.Name = 'test';
        acc.City__c = cty.id;
        insert acc;
        
        Contact cont = new Contact();
        cont.LastName = 'test';
        cont.AccountId = acc.Id;
        cont.ESPrevious_Job_Title__c = 'test';
        cont.City__c = cty.Id;
        cont.Secondary_Email__c = 'test@test.com';
        cont.GMASS_Undergraduate_Major__c = 'test';
        cont.MobilePhone = 'test';
        cont.Most_recent_function_linkedin__c = 'test';
        cont.Most_recent_industry_linkedin__c = 'test';
        cont.ESAnnual_Compensation_excl_bonus_in_US__c = 10;
        cont.ESPrevious_Job_Start_Date__c = System.today();
        cont.ESPrevious_Job_Title__c = 'test';
        cont.ESPrevious_Job_Company_Name__c = 'test';
        cont.ESPrevious_Job_Company__c = acc.Id;
        insert cont;
        
        employSur = new Employment_Survey__c();
        employSur.Student__c = cont.Id;
        employSur.Previous_Job_Title__c = '!test';
        employSur.Local_City__c = cty2.Id;
        employSur.Previous_Job_Company_Name__c = 'test';
        employSur.Personal_Email__c = '!test@test.com';
        employSur.Undergraduate_Major__c = '!test';
        employSur.Mobile_Phone__c = '!test';
        employSur.Most_recent_function_experience__c = '!test';
        employSur.Most_recent_industry_experience__c = '!test';
        employSur.Annual_Compensation_excl_bonus_in_US__c = 20;
        employSur.Previous_Job_Start_Date__c = null;
        employSur.Previous_Job_Title__c = '!test';
        employSur.Previous_Job_Company_Name__c = '!test';
        employSur.Previous_Job_Company__c = null;
        employSur.What_are_you_doing_now__c = 'test';
        employSur.Ownership_Type__c = 'test';
        employSur.City__c = cty.Id;
        employSur.Company_Size__c = '1';
        employSur.Industry__c = 'test';
        employSur.Job_Function__c = 'test';
        employSur.Job_City__c = cty.Id;
        employSur.Job_Industry__c = 'test';
        employSur.Work_Authorisation_Status_for_Offer__c = 'test';
        employSur.Offer_Received_Date__c = System.today();
        employSur.Offer_Accepted_Date__c = System.today();
        employSur.Employment_Start_Date__c = System.today();
        ts2__Job__c job = EmploymentHandler.createNonTsJob(employSur);
        insert job;
        ts2__Application__c ap = EmploymentHandler.createNonTsApp(employSur);
        ap.ts2__Job__c = job.Id;
    	insert ap;
    	employSur.TS_Application__c = ap.Id;
    	
        employSur2 = new Employment_Survey__c();
        employSur2.Student__c = cont.Id;
        employSur2.Previous_Job_Title__c = '!test';
        employSur2.Local_City__c = cty2.Id;
        employSur2.Previous_Job_Company_Name__c = 'test';
        employSur2.Personal_Email__c = '!test@test.com';
        employSur2.Undergraduate_Major__c = '!test';
        employSur2.Mobile_Phone__c = '!test';
        employSur2.Most_recent_function_experience__c = '!test';
        employSur2.Most_recent_industry_experience__c = '!test';
        employSur2.Annual_Compensation_excl_bonus_in_US__c = 20;
        employSur2.Previous_Job_Start_Date__c = null;
        employSur2.Previous_Job_Title__c = '!test';
        employSur2.Previous_Job_Company_Name__c = '!test';
        employSur2.Previous_Job_Company__c = null;
        employSur2.Name_of_Bus__c = 'test';
        employSur2.Job_Title_Bus__c = 'test';
        employSur2.Salary_if_any_in_USD__c = 100;
        employSur2.Start_Date__c = System.today();
        employSur2.What_are_you_doing_now__c = EmploymentHandler.WORKING_FOR_FAMILY_BUS;
        ts2__Job__c job2 = EmploymentHandler.createNonTsJob(employSur2);
        insert job2;
        ts2__Application__c ap2 = EmploymentHandler.createNonTsApp(employSur2);
        ap2.ts2__Job__c = job2.Id;
    	insert ap2;
        employSur2.TS_Application__c = ap2.Id;
    }
    
    /**
     * Test Method for IndividualTeamDataController
     */
    public static testmethod void testEmploymentHandlerTest() {
        setUpData();
        Test.startTest();
            System.runAs(u) {
				insert employSur;
				employSur.Status__c = EmploymentHandler.STATUS_PUBLISH;
				employSur.Offer_Received_Date__c = System.today();
		        employSur.Offer_Accepted_Date__c = System.today();
		        employSur.Employment_Start_Date__c = System.today();
				update employSur;
				
				insert employSur2;
				employSur2.Status__c = EmploymentHandler.STATUS_PUBLISH;
				employSur2.Offer_Received_Date__c = System.today();
		        employSur2.Offer_Accepted_Date__c = System.today();
		        employSur2.Employment_Start_Date__c = System.today();
				update employSur2;
            }
        Test.stopTest();
        
    }
}