/**
 Change Log
 -------------------------------------------------------------------------------------------------------------------
    Date                Owner               Comment
 -------------------------------------------------------------------------------------------------------------------
    30-July-2012     Niket Chandane     Added test class to check the dynamic routing
    1 -Aug -2012     Niket Chandane     Code Coverage 82 %
    
    Modified By : Anil.B on 11/11/2014 to delete this field Sub_region__c removed this field from query

 */
 
@isTest
public class Contact_DynamicRoutingTest {
    
    public static Contact_DynamicRouting Con_DynamicroteController;
    
    static testMethod void Contact_DynamicRoutingUnitTest() {
        test.startTest();
        User objUser = TestDataUtil.createUser('test-user@fakeemail.com','testx');
        Database.insert(objUser);
        
        Country__c objCountry = TestDataUtil.createCountry();
        Database.insert(objCountry);
        
        Requirement__c objReq = TestDataUtil.createRequirement(objCountry.Id);
        Database.insert(objReq); 
        
        Department__c objDept = TestDataUtil.createDepartment();
        Database.insert(objDept);
        
        Program__c objPro = TestDataUtil.createProgram(objCountry.Id, objDept.Id);
        Database.insert(objPro);
        
        Routing_Table__c objRouting = TestDataUtil.createRoutingTable(objDept.id, 'High', 'test-user@fakeemail.com');
        Database.insert(objRouting);
        
        Account objAcc = TestDataUtil.createAccount();
        Database.insert(objAcc);
        
        Contact objCon = TestDataUtil.createContact(objPro.id);
        Database.insert(objCon);
        
        Apexpages.Standardcontroller objStdCtrl = new Apexpages.Standardcontroller(objCon);
        Con_DynamicroteController = new Contact_DynamicRouting(objStdCtrl);
        Con_DynamicroteController.execute();
        
        List<Contact> lstCon = [select Name, Age_Range__c, Apply_Routing_Type__c, Department_Name_Primary__c, Department_Name_Secondary__c, Department_Name_Third__c, 
                                Country_Of_Residence_Name__c, Country_Of_Residence__c, Do_Not_Route__c, MailingPostalCode, MailingCity, MailingCountry, MailingState, 
                                OwnerId, OtherPostalCode, OtherCity, OtherCountry, OtherState, Program_Primary__c, Program_Secondary__c, Program_Third__c, Region__c,
                                Work_Load__c,RecordTypeId from Contact where Id =: objCon.Id];
        
        Contact_DynamicRouting.applyRoutingDynamicRouting(lstCon);
        test.stopTest();                
    }
    
    static testMethod void Contact_DynamicRoutingUnitNegativeTest(){
        test.startTest();
        Contact_DynamicRouting.applyRoutingDynamicRouting(new List<Contact>{});
        Contact_DynamicRouting.applyRoutingDynamicRouting(new List<Routing_Table__c> {}, new List<Contact>{}, '');
        test.stopTest();
    }
    
    static testMethod void Contact_DynamicRoutingZipCodeTest(){
        test.startTest();
        
        User objUser = TestDataUtil.createUser('testuser@fakeemail.com','test');
        Database.insert(objUser);
        /*
        User objUser2 = TestDataUtil.createUser('test2user@fakeemail.com','test2');
        Database.insert(objUser2);
        
        User objUser3 = TestDataUtil.createUser('test3user@fakeemail.com','test3');
        Database.insert(objUser3);
        */
        
        Country__c objCountry = TestDataUtil.createCountry();
        Database.insert(objCountry);
        
        Requirement__c objReq = TestDataUtil.createRequirement(objCountry.Id);
        Database.insert(objReq); 
        
        Department__c objDept = TestDataUtil.createDepartment();
        Database.insert(objDept);
        
        Program__c objPro = TestDataUtil.createProgram(objCountry.Id, objDept.Id);
        Database.insert(objPro);
        
        Routing_Table__c objRouting = TestDataUtil.createZipRoutingTable(objDept.id, 'High', 'testuser@fakeemail.com');
        Database.insert(objRouting);
        
        //Routing_Table__c objRouting2 = TestDataUtil.createZipRoutingTable(objDept.id, 'High', 'test2user@fakeemail.com');
        //Database.insert(objRouting2);
        
        //Routing_Table__c objRouting3 = TestDataUtil.createZipRoutingTable(objDept.id, 'High', 'test3user@fakeemail.com');
        //Database.insert(objRouting3);
        
        List<Routing_Table__c> lstRoutingTable = [Select Id,Name,Routed_To__c from Routing_Table__c];
        set<string> testunameslist=new set<string>();
        for(Routing_Table__c r:lstRoutingTable){testunameslist.add(r.Routed_to__c);}
        map<String,Integer> MapUser = new Map<String,Integer>();
        Integer iCount =0;
        for(User objU : [Select Name,Email,Id,username from User where username in :testunameslist limit 2000])
        {iCount++;
            MapUser.put(objU.Id,iCount);
        }
        
        Contact_DynamicRouting.retrieveOwnerName(MapUser,lstRoutingTable);
        
        Account objAcc = TestDataUtil.createAccount();
        Database.insert(objAcc);
        
        Contact objCon = TestDataUtil.createZipContact(objPro.id);
        Database.insert(objCon);
        
        Apexpages.Standardcontroller objStdCtrl = new Apexpages.Standardcontroller(objCon);
        Con_DynamicroteController = new Contact_DynamicRouting(objStdCtrl);
        Con_DynamicroteController.execute();
        
         List<Contact> lstCon = [select Name, Age_Range__c, Apply_Routing_Type__c, Department_Name_Primary__c, Department_Name_Secondary__c, Department_Name_Third__c, 
                                Country_Of_Residence_Name__c, Country_Of_Residence__c, Do_Not_Route__c, MailingPostalCode, MailingCity, MailingCountry, MailingState, 
                                OwnerId, OtherPostalCode, OtherCity, OtherCountry, OtherState, Program_Primary__c, Program_Secondary__c, Program_Third__c, Region__c,
                                 Work_Load__c,RecordTypeId from Contact where Id =: objCon.Id];
        
        Contact_DynamicRouting.applyRoutingDynamicRouting(lstCon);
        
        lstCon[0].MailingPostalCode='11111';
        Contact_DynamicRouting.applyRoutingDynamicRouting(lstCon);
        
        test.stopTest();
    }
    
}