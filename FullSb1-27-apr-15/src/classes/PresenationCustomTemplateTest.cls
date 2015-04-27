@isTest
private class PresenationCustomTemplateTest {

    static testMethod void PresenationCustomTemplateTest() {
        User usr = [SELECT Name FROM User WHERE isActive = true AND Email != NULL AND Profile.Name = 'System Administrator' LIMIT 1];
        Test.StartTest();
        System.runAs(usr) {
            Account account_item = new Account(Name='TestAcc');
            insert account_item;
            Contact contact_item = new Contact(FirstName='test',LastName='test');
            insert contact_item;
            ts2__Job__c job_item = new ts2__Job__c(
                Name='test',
                ts2__Account__c=account_item.Id,
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
            JSPresent__Presentation__c presentation = new JSPresent__Presentation__c(
                JSPresent__Presentation_Status__c='To Be Reviewed',
                JSPresent__Job_Order__c = job_item.Id
            );
            insert presentation;
            JSPresent__Presentation_List__c presentationListObject = new JSPresent__Presentation_List__c(
                JSPresent__Presentation__c=presentation.Id,
                JSPresent__Job_Order__c=job_item.Id,
                JSPresent__Contact__c=contact_item.Id,
                JSPresent__Status__c='To Be Presented',
                JSPresent__Sort_Order__c=1
            );
            insert presentationListObject;

            ApexPages.currentPage().getParameters().put('Id',presentation.Id);
            PresenationCustomTemplate controller = new PresenationCustomTemplate(new ApexPages.StandardController(presentation));
            PresenationCustomTemplate controller_empty = new PresenationCustomTemplate();
            controller.createPDF();
            controller.preparePresentationList();
            System.assertEquals([SELECT Id FROM Attachment WHERE ParentId = : presentation.Id].size(), 1);
        }
        Test.stopTest();
    }
}