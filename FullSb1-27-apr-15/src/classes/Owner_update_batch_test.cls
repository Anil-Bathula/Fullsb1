@isTest(seealldata=true)
private class Owner_update_batch_test {
/*
Developer 	: Harsha Simha S
Synopsis  	: Test class for Lead_owner_updater(86%) ,owner_updater(73%)
Created Date: 3/20/2015 
*/
    static testmethod void test_for_Owner_update_batches()
    {
        map<string,string> uids=new map<string,string>();
        map<string,string> ruids=new map<string,string>();
        list<user> users=[select id,Name,username,Email from user where isActive=true and IsPortalEnabled=false limit 5];
       
        uids.put(users[0].id,users[1].id);
        ruids.put(users[0].username,users[1].username);
        
        Country__c objCountry = TestDataUtil.createCountry();
        Database.insert(objCountry);
        
        Department__c objDept = TestDataUtil.createDepartment();
        Database.insert(objDept);
        
        Program__c objPro = TestDataUtil.createProgram(objCountry.Id, objDept.Id);
        objPro.campus__c='London';
        objPro.Program_pre_Parsed__c='MBA';
            Database.insert(objPro);
        
        Account objAcc = TestDataUtil.createAccount();
        Database.insert(objAcc);
        
        List<Lead> objLead =new List<Lead>();
        Lead l1 = TestDataUtil.createLead(objCountry.Id,objPro.Id);
        l1.Do_Not_Route__c=true;
        l1.Email='Owner_update_batch_test@lead1.com';
        l1.Applicant_Email__c='Owner_update_batch_test@lead1.com';
        l1.OwnerId=users[0].Id;
            objLead.add(l1);
        
        Lead l2 = TestDataUtil.createLead(objCountry.Id,objPro.Id);
        l2.Do_Not_Route__c=true;
		l2.Email='Owner_update_batch_test@lead2.com';
        l2.Applicant_Email__c='Owner_update_batch_test@lead2.com';        
        l2.OwnerId=users[0].Id;
        objLead.add(l2);
        
        insert objlead;
        
        
        List<contact> objCon =new List<contact>();
        Contact c1 = TestDataUtil.createContact(objPro.id);
        c1.Do_Not_Route__c=true;
        c1.Email='Owner_update_batch_test@ctct1.com';
        c1.Applicant_Email__c='Owner_update_batch_test@ctct1.com';
        objCon.add(c1);
        
        Contact c2 = TestDataUtil.createContact(objPro.id);
        c2.Do_Not_Route__c=true;
        c2.Email='Owner_update_batch_test@ctct2.com';
        c2.Applicant_Email__c='Owner_update_batch_test@ctct2.com';
        objCon.add(c2);
		
        insert objcon;
        test.startTest();
        	lead_owner_updater lo_upd=new lead_owner_updater(uids);        
            lo_upd.testrecs.add(l1.id);
            lo_upd.testrecs.add(l2.id);
            database.executebatch(lo_upd,20);
        	
        	Owner_updater o_upd=new Owner_updater(uids,ruids);        
            o_upd.testrecs.add(c1.id);
        	o_upd.testrecs.add(c2.id);
          //  o_upd.lst_objects.add(c3.id);
            database.executebatch(o_upd,20);
        test.stopTest();
        
    }  
}