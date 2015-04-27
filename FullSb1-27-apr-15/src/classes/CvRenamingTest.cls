/**
 * Test unit to cover code in CvRenaming class
 * @category:Testing Logic
 * @author: PhanithChhun
 * @createdDate: 28-Aug-2014
 */
@isTest
public class CvRenamingTest {
	
	private static User u;
	private static Attachment attA, attB;
	
	
	/**
	 * Initialize testing data
	 */
	private static void setUpData(){
		Contact contact_item = new Contact(FirstName='test',LastName='test');
        insert contact_item;
        
		Profile pro = [select id from Profile where Name =: CvRenaming.USER_PRO_HULT_CAREER_POINT limit 1];
	 	u = new User(alias = 'cr', email = 'CvRenaming@test.com', emailencodingkey = 'UTF-8', 
                            FirstName = 'CvRenaming' , lastname='U', languagelocalekey = 'en_US',
                            localesidkey = 'en_US', profileid = pro.Id, timezonesidkey = 'America/Los_Angeles', CommunityNickname = 'u2',
                            isActive = true, username = 'CvRenaming@test.com', ContactId = contact_item.Id);
        
        attA = new Attachment();
        attA.Name = 'testA';
        attA.Body = Blob.valueOf('test');
        attA.ParentId = contact_item.Id;
        insert attA;
        
        ts2__Job__c job_item = new ts2__Job__c(
        		Name='test',
                ts2__Contact__c=contact_item.Id,
                ts2__Employment_Type__c='Intership',
                Availability__c='Next 3 months',
                Industry__c='Consalting',
                Work_Authorization__c='Cannot sponsor visa – Candidate must already have a legal status to work in the country',
                Function__c='Administration',
                Years_of_Work_Experience__c='2-3 years',
                Candidate_Industries__c='NGO/Social/Government',
                Candidate_Fucntions__c='Tech',
                Type__c='Internship'
        	);
        insert job_item;
        
        ts2__Application__c application_item = new ts2__Application__c(
            ts2__Candidate_Contact__c=contact_item.Id,
            ts2__Job__c=job_item.Id,
            ts2__Application_Status__c='Active',
            ts2__Stage__c='Application'
        );
        insert application_item;
        
        attB = new Attachment();
        attB.Name = 'testB';
        attB.Body = Blob.valueOf('test');
        attB.ParentId = application_item.Id;
	}
	
	/**
     * start testing logic to cover code
     */
	private static testMethod void testStartPayment(){
		setUpData();
		Test.startTest();
        	insert attB;
        	System.assertEquals(attB.Name, [Select Name From Attachment Where Id =: attA.Id].Name);
        Test.stopTest(); 	
	}
}