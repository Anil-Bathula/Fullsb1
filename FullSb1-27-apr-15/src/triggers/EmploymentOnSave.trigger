trigger EmploymentOnSave on Employment_Survey__c (after insert, after update) {
    if(trigger.isAfter && trigger.isInsert){
    	EmploymentHandler.updateContact(trigger.new);
    	EmploymentHandler.checkUpdatedEmploymentSurvey(null, trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate) EmploymentHandler.checkUpdatedEmploymentSurvey(trigger.old, trigger.new);
}