/*
Author : Premanath Reddy
pupose : Test class for Set_FeeUniqueId Trigger,UpdateCurrency and Opp_changeFees_inFin Trigger
*/

@isTest
private class Fees_Test{
    static testmethod void methodname(){
        Test.Starttest();
        
        String recdtypeid1=RecordTypeHelper.getRecordTypeId('Opportunity','Confirmation & CAX-D');
        
        Program__c objPgm=new program__c();
        objPgm.Name='Bachelor of Business Administration-UK-London';
        objPgm.Campus__c='London';
        objPgm.Program_pre_parsed__c='BBA';
        insert objPgm;  
        
        Program__c objPgm1=new program__c();
        objPgm1.Name='MBA-China-Shanghai';
        objPgm1.Campus__c='Shanghai';
        objPgm1.Program_pre_parsed__c='MBA';
        insert objPgm1;
        
        Fees__c fee=new Fees__c();
        fee.Program_Name__c=objPgm.id;
        fee.Year__c='2015';
        insert fee;
        
        Opportunity op=new opportunity();
        op.Name='firstname';
        op.StageName='Confirmed';
        op.Start_Term__c='January 2013';
        op.CloseDate=System.today();
        op.Program__c=objPgm.id;
        op.Primary_Campus__c='Boston'; 
        op.RecordTypeId =  recdtypeid1;   
        insert op;  
        System.debug('Test==1==>'+op.Primary_Campus__c);     
        
        /*op.Program__c=objPgm1.id;
        op.Primary_Campus__c='Shanghai';
        op.Start_Term__c='September 2015';
        update op;*/
        
       // System.debug('Test==>'+op.Primary_Campus__c);
        //Test.stopTest();
       
        
        opportunity_Finance__c f=new Opportunity_finance__c();        
        f.Opportunity__c=op.id;
        f.CurrencyIsoCode='USD';
        f.Go_Ed_Loan_Amount__c=200;
        f.Go_Ed_Loan_Amount_First_Rate_USD__c=200;
        f.fees__c=null;
        insert f;
        
      /*  opportunity_Finance__c fs=new Opportunity_finance__c();        
        fs.Opportunity__c=op.id;
        fs.CurrencyIsoCode='USD';
        fs.Go_Ed_Loan_Amount__c=200;
        fs.Go_Ed_Loan_Amount_First_Rate_USD__c=200;        
        fs.fees__c=fee.id;
        fs.Housing_Accommodation__c='No accommodation';
        insert fs;
        fs.Housing_Accommodation__c='Shanghai - Single Room - 8 Months - Free';        
        Update fs;
        fs.Housing_Accommodation__c='Shanghai Hult Accommodation – 8 Months';
        update fs;
        fs.Housing_Accommodation__c='Shanghai Hult Accommodation – 12 Months' ;
        update fs;
        fs.Housing_Accommodation__c='Shanghai Accommodation with dependent for 8 months';
        update fs;
        fs.Housing_Accommodation__c='Shanghai Accommodation with dependent for 12 months';
        update fs;
        fs.Housing_Accommodation__c='Free accommodation with dependent – 8 months';
        Update fs;
        fs.Housing_Accommodation__c='Shanghai Accommodation Family';
        update fs;
        fs.Housing_Accommodation__c='HH - Twin Studios - Double';
        update fs;        
        fs.Housing_Accommodation__c='HH - Super Twin - Double';
        update fs;
        fs.Housing_Accommodation__c='HH - Twin Plus - Double';
        update fs;
        fs.Housing_Accommodation__c='HH - Study Twin - Double';
           update fs;
        fs.Housing_Accommodation__c='HH - Assam Studio - Single';
           update fs;
        fs.Housing_Accommodation__c='HH - Studios Vista - Single';
           update fs; 
        fs.Housing_Accommodation__c='HH - Studios Vista - Single';
           update fs; 
        fs.Housing_Accommodation__c='HH - Studios Premium 15 -16 - Single';
           update fs;
        fs.Housing_Accommodation__c='HH - Studios Premium 11-14 - Single';
            update fs;
        fs.Housing_Accommodation__c='HH - Club Studio Deluxe - Single';
           update fs;  
        fs.Housing_Accommodation__c='HH - Classic Studio Deluxe - Single';
            update fs;
        fs.Housing_Accommodation__c='HH - Club Studio - Single';
            update fs;  
        fs.Housing_Accommodation__c='HH - Classic Studio - Single';
            update fs;  
        fs.Housing_Accommodation__c='HH - Solo - Single';
           update fs;
        fs.Housing_Accommodation__c='HH East – 12 Months';
           update fs;
        */
        //List<EmailTemplate> et = [SELECT id FROM EmailTemplate WHERE Name = 'GoEd Loan Status Confirmed Campus Change' limit 1];
        
        op.Program__c=objPgm1.id;
        op.Primary_Campus__c='Shanghai';
        op.Start_Term__c='September 2015';
        update op;
        System.debug('Test==>'+op.Primary_Campus__c);
        Test.stopTest();
        
    }
}