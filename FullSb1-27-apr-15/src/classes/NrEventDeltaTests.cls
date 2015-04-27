@IsTest 
public class  NrEventDeltaTests {

    @isTest(SeeAllData=true)
    static  void callingGetFinanceIdToFieldDeltasReturnsExpectedDeltasCollection() {
        if (isInPackagingOrg() ) {
        
    
            // Arrange 
            
            // housekeeing 
            Contact applicant = new Contact(FirstName='Crow',LastName='Balls');
            insert applicant;
            Id applicantId = applicant.Id;
            Id journalId =  createJournal ( applicantId , 'Balls said the crow' );
            
            delete  Database.query(  ' SELECT Id FROM EventLines__c ');
            delete  Database.query(  ' SELECT Id FROM Event__c ');
            
            String field01 = 'Activity_Fee__c';
            String field02 = 'Deposit_Paid__c';
            String field03 = 'Adjustment_Amount__c';
            String field04 = '{!BALANCING}';
            
            Decimal latestValueA01 = 8.26; 
            Decimal latestValueA02 = 16.72; 
            Decimal latestValueA03 = 32.58;  
            
            Decimal previousValueA01 = 8.33; 
            Decimal previousValueA02 = 9.44; 
            Decimal previousValueA03 = 11.55; 
            
            Decimal currentValueA01 = 1.21; 
            Decimal currentValueA02 = 2.32; 
            Decimal currentValueA03 = 3.43;
            
            
            
            Decimal latestValueB01 = 10.12; 
            Decimal latestValueB02 = 23.97; 
            Decimal latestValueB03 = 141.56;  
            
            Decimal previousValueB01 = 20.31; 
            Decimal previousValueB02 = 41.46; 
            Decimal previousValueB03 = 82.32; 
            
            Decimal currentValueB01 = 4.54; 
            Decimal currentValueB02 = 5.65; 
            Decimal currentValueB03 = 6.76; 
            
            
            
            Decimal latestValueC01 = 3.11; 
            Decimal latestValueC02 = 6.91; 
            Decimal latestValueC03 = 9.51;  
            
            Decimal previousValueC01 = 7.11; 
            Decimal previousValueC02 = 4.16; 
            Decimal previousValueC03 = 2.12; 
            
            Decimal currentValueC01 = 7.87; 
            Decimal currentValueC02 = 8.98; 
            Decimal currentValueC03 = 9.09;  
            
            
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            List<String> fields2  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            fields2.add(field01);
            fields2.add(field02);
            fields2.add(field03); 
            fields2.add(field04); 
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields2) ;
            
            
            //// List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
            List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines)  ;
            
            Map<String, Object> previousAFieldToValue = new Map<String, Object>(); 
            previousAFieldToValue.put(field01 , previousValueA01); 
            previousAFieldToValue.put(field02 , previousValueA02);
            previousAFieldToValue.put(field03 , previousValueA03);
            
            Map<String, Object> previousBFieldToValue = new Map<String, Object>(); 
            previousBFieldToValue.put(field01 , previousValueB01); 
            previousBFieldToValue.put(field02 , previousValueB02);
            previousBFieldToValue.put(field03 , previousValueB03);
            
            
            Map<String, Object> previousCFieldToValue = new Map<String, Object>(); 
            previousCFieldToValue.put(field01 , previousValueC01); 
            previousCFieldToValue.put(field02 , previousValueC02);
            previousCFieldToValue.put(field03 , previousValueC03);
            
            Map<String, Object> latestAFieldToValue = new Map<String, Object>(); 
            latestAFieldToValue.put(field01 , latestValueA01); 
            latestAFieldToValue.put(field02 , latestValueA02);
            latestAFieldToValue.put(field03 , latestValueA03);
            
            Map<String, Object> latestBFieldToValue = new Map<String, Object>(); 
            latestBFieldToValue.put(field01 , latestValueB01); 
            latestBFieldToValue.put(field02 , latestValueB02);
            latestBFieldToValue.put(field03 , latestValueB03);
            
            Map<String, Object> latestCFieldToValue = new Map<String, Object>(); 
            latestCFieldToValue.put(field01 , latestValueC01); 
            latestCFieldToValue.put(field02 , latestValueC02);
            latestCFieldToValue.put(field03 , latestValueC03);
            
            
            Map<String, Object> currentAFieldToValue = new Map<String, Object>(); 
            currentAFieldToValue.put(field01 , currentValueA01); 
            currentAFieldToValue.put(field02 , currentValueA02);
            currentAFieldToValue.put(field03 , currentValueA03);
            
            Map<String, Object> currentBFieldToValue = new Map<String, Object>(); 
            currentBFieldToValue.put(field01 , currentValueB01); 
            currentBFieldToValue.put(field02 , currentValueB02);
            currentBFieldToValue.put(field03 , currentValueB03);
            
            Map<String, Object> currentCFieldToValue = new Map<String, Object>(); 
            currentCFieldToValue.put(field01 , currentValueC01); 
            currentCFieldToValue.put(field02 , currentValueC02);
            currentCFieldToValue.put(field03 , currentValueC03);       
            
            
            
            Id  financeAId =  createFinance (previousAFieldToValue) ;
            Id  financeBId =  createFinance (previousBFieldToValue) ;
            Id  financeCId =  createFinance (previousCFieldToValue) ;
            List<Id> financeIds = new List<Id> {financeAId, financeBId, financeCId};
                
                String financePreviousSerialized =  NrEventDelta.getSerializedEvt003Collection(new List<Id>{financeAId, financeBId, financeCId }, fieldNames);
            List<SObject> financePreviousCollection = (List<SObject>) json.deserialize(financePreviousSerialized,List<SObject>.class) ;
            List<SObject> financeLatestCollection   = (List<SObject>) json.deserialize(financePreviousSerialized,List<SObject>.class) ;
            List<SObject> financeCurrentCollection   = (List<SObject>) json.deserialize(financePreviousSerialized,List<SObject>.class) ;
            Map<Id, SObject> financeIdToFinancePrevious = new Map<Id, SObject>(financePreviousCollection);
            Map<Id, SObject> financeIdToFinanceLatest   = new Map<Id, SObject>(financeLatestCollection);
            Map<Id, SObject> financeIdToFinanceCurrent  = new Map<Id, SObject>(financeCurrentCollection);      
            
            for (Id financeId : financeIdToFinanceLatest.keySet()) {
                
                SObject financeLatest  = financeIdToFinanceLatest.get(financeId);
                SObject financeCurrent  = financeIdToFinanceCurrent.get(financeId);  
                
                for (String fieldName : previousAFieldToValue.keySet()) {
                    if (financeId == financeAId) {
                        financeLatest.put(fieldName, latestAFieldToValue.get(fieldName) );
                        financeCurrent.put(fieldName, currentAFieldToValue.get(fieldName) );
                    }
                    if (financeId == financeBId) {
                        financeLatest.put(fieldName, latestBFieldToValue.get(fieldName) );
                        financeCurrent.put(fieldName, currentBFieldToValue.get(fieldName) );
                    }
                    if (financeId == financeCId) {
                        financeLatest.put(fieldName, latestCFieldToValue.get(fieldName) );
                        financeCurrent.put(fieldName, currentCFieldToValue.get(fieldName) );
                    }
                }
                
                financeIdToFinanceLatest.put(financeId,financeLatest);
                financeIdToFinanceCurrent.put(financeId,financeCurrent);
            }
            
            
            // Current represents latest state of finance objects
            update financeIdToFinanceCurrent.values();
            
            // delete finance versions, so we can create scenarios
            delete  Database.query(  ' SELECT Id FROM FinanceVersion__c ');
            
            
            //at this point, we have:
            //  - 3 finance records Id:( A, B, C ) with "current values"  
            //  - each finance Id has previous, latest and current versions in memory
            // an available journal Id for test purposes
            // no financeVersions
            
            // assume
            // CHANGE-EVENT-OCCURRED = (A, B, C) finance records have changed in some way 
            
            //   for A, assume  
            //   - Batched 
            //   - zero finance changes since batching and before CHANGE-EVENT-OCCURRED  
            
            //   for B, assume 
            //   - Batched 
            //   - one finance change  since batching and before CHANGE-EVENT-OCCURRED  
            
            //  for C - assume 
            //   - No Version record (therefore never Batched )
            //   - zero finance changes before CHANGE-EVENT-OCCURRED  
            
            
            Type t = Type.forName('FinanceVersion__c' );
            
            Sobject financeVersionA  =  (SObject) t.newInstance();
            financeVersionA.put('Finance__c', financeAId ); 
            financeVersionA.put('Journal__c', journalId );    
            financeVersionA.put('LatestVersion__c', json.serialize(financeIdToFinanceLatest.get(  financeAId)) );
            financeVersionA.put('PriorVersion__c', null);
            insert financeVersionA;
            Id financeVersionAId =  financeVersionA.Id;  
            
            
            Sobject financeVersionB  =  (SObject) t.newInstance();
            financeVersionB.put('Finance__c', financeBId ); 
            financeVersionB.put('Journal__c', null );    
            financeVersionB.put('LatestVersion__c', json.serialize(financeIdToFinanceLatest.get(  financeBId)));
            financeVersionB.put('PriorVersion__c' , json.serialize(financeIdToFinancePrevious.get(financeBId)));
            insert financeVersionB;
            Id financeVersionBId =  financeVersionB.Id;
            
            NrEventDelta.upsertFinanceVersions( financeIds );
            
            Map<id , string> eventIdToEventType = new Map<id , string>();
            for (Id financeId : financeIds) {
                eventIdToEventType.put(financeId, 'EVT-003');
            }
            
            // Act 
            Map<Id, Map<String,Decimal>> financeIdToFieldDeltas =  NrEventDelta.getFinanceIdToFieldDeltas( eventIdToEventType);
          
            // Assemble
            Decimal actualDeltaA01  = null; 
            Decimal actualDeltaA02  = null; 
            Decimal actualDeltaA03  = null;                     
            Decimal actualDeltaB01  = null; 
            Decimal actualDeltaB02  = null; 
            Decimal actualDeltaB03  = null;                           
            Decimal actualDeltaC01  = null; 
            Decimal actualDeltaC02  = null; 
            Decimal actualDeltaC03  = null;
            for (Id financeId : financeIdToFieldDeltas.keySet()) {
                Map<String,Decimal> fieldNameToDelta = financeIdToFieldDeltas.get(financeId);
                Decimal delta01 = fieldNameToDelta.get(field01.toLOwerCase());     
                Decimal delta02 = fieldNameToDelta.get(field02.toLOwerCase());     
                Decimal delta03 = fieldNameToDelta.get(field03.toLOwerCase());
                if (financeId == financeAId) {
                    actualDeltaA01  =  delta01;
                    actualDeltaA02  =  delta02;
                    actualDeltaA03  =  delta03;
                } 
                if (financeId == financeBId) {
                    actualDeltaB01  =  delta01;
                    actualDeltaB02  =  delta02;
                    actualDeltaB03  =  delta03;
                } 
                if (financeId == financeCId) {
                    actualDeltaC01  =  delta01;
                    actualDeltaC02  =  delta02;
                    actualDeltaC03  =  delta03;
                }   
            }
            
            
            // Assert
            Decimal expectedDeltaA01 = currentValueA01 - latestValueA01  ;
            Decimal expectedDeltaA02 = currentValueA02 - latestValueA02  ;
            Decimal expectedDeltaA03 = currentValueA03 - latestValueA03  ;
            Decimal expectedDeltaB01 = currentValueB01 - previousValueB01;
            Decimal expectedDeltaB02 = currentValueB02 - previousValueB02;
            Decimal expectedDeltaB03 = currentValueB03 - previousValueB03;
            Decimal expectedDeltaC01 = currentValueC01 - 0;
            Decimal expectedDeltaC02 = currentValueC02 - 0;
            Decimal expectedDeltaC03 = currentValueC03 - 0;
            System.assertEquals( expectedDeltaA01 , actualDeltaA01  );
            System.assertEquals( expectedDeltaA02 , actualDeltaA02  );
            System.assertEquals( expectedDeltaA03 , actualDeltaA03  );
            System.assertEquals( expectedDeltaB01 , actualDeltaB01  );
            System.assertEquals( expectedDeltaB02 , actualDeltaB02  );
            System.assertEquals( expectedDeltaB03 , actualDeltaB03  );
            System.assertEquals( expectedDeltaC01 , actualDeltaC01  );
            System.assertEquals( expectedDeltaC02 , actualDeltaC02  );
            System.assertEquals( expectedDeltaC03 , actualDeltaC03  );
            
        }
    }
    
    
    
    @isTest(SeeAllData=true)
    static  void callingGetUpsertableFinanceVersionsReturnsExpectedUpsertableCollection() {
        if (isInPackagingOrg() ) {
            // Arrange 
            
            // housekeeing 
            Contact applicant = new Contact(FirstName='Crow',LastName='Balls');
            insert applicant;
            Id applicantId = applicant.Id;
            Id journalId =  createJournal ( applicantId , 'Balls said the crow' );
    
            delete  Database.query(  ' SELECT Id FROM EventLines__c ');
            delete  Database.query(  ' SELECT Id FROM Event__c ');
            
            String field01 = 'Activity_Fee__c';
            String field02 = 'Deposit_Paid__c';
            String field03 = 'Adjustment_Amount__c';
            
            Decimal latestValueA01 = 8.26; 
            Decimal latestValueA02 = 16.72; 
            Decimal latestValueA03 = 32.58;  
            
            Decimal previousValueA01 = 8.33; 
            Decimal previousValueA02 = 9.44; 
            Decimal previousValueA03 = 11.55; 
            
            Decimal currentValueA01 = 1.21; 
            Decimal currentValueA02 = 2.32; 
            Decimal currentValueA03 = 3.43;
            
            
            
            Decimal latestValueB01 = 10.12; 
            Decimal latestValueB02 = 23.97; 
            Decimal latestValueB03 = 141.56;  
            
            Decimal previousValueB01 = 20.31; 
            Decimal previousValueB02 = 41.46; 
            Decimal previousValueB03 = 82.32; 
    
            Decimal currentValueB01 = 4.54; 
            Decimal currentValueB02 = 5.65; 
            Decimal currentValueB03 = 6.76; 
            
            
            
            Decimal latestValueC01 = 3.11; 
            Decimal latestValueC02 = 6.91; 
            Decimal latestValueC03 = 9.51;  
            
            Decimal previousValueC01 = 7.11; 
            Decimal previousValueC02 = 4.16; 
            Decimal previousValueC03 = 2.12; 
             
            Decimal currentValueC01 = 7.87; 
            Decimal currentValueC02 = 8.98; 
            Decimal currentValueC03 = 9.09;  
               
               
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields) ;
            
            //// List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
            
            List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines)  ;
     
            Map<String, Object> previousAFieldToValue = new Map<String, Object>(); 
            previousAFieldToValue.put(field01 , previousValueA01); 
            previousAFieldToValue.put(field02 , previousValueA02);
            previousAFieldToValue.put(field03 , previousValueA03);
    
            Map<String, Object> previousBFieldToValue = new Map<String, Object>(); 
            previousBFieldToValue.put(field01 , previousValueB01); 
            previousBFieldToValue.put(field02 , previousValueB02);
            previousBFieldToValue.put(field03 , previousValueB03);
            
            
            Map<String, Object> previousCFieldToValue = new Map<String, Object>(); 
            previousCFieldToValue.put(field01 , previousValueC01); 
            previousCFieldToValue.put(field02 , previousValueC02);
            previousCFieldToValue.put(field03 , previousValueC03);
            
            Map<String, Object> latestAFieldToValue = new Map<String, Object>(); 
            latestAFieldToValue.put(field01 , latestValueA01); 
            latestAFieldToValue.put(field02 , latestValueA02);
            latestAFieldToValue.put(field03 , latestValueA03);
            
            Map<String, Object> latestBFieldToValue = new Map<String, Object>(); 
            latestBFieldToValue.put(field01 , latestValueB01); 
            latestBFieldToValue.put(field02 , latestValueB02);
            latestBFieldToValue.put(field03 , latestValueB03);
    
            Map<String, Object> latestCFieldToValue = new Map<String, Object>(); 
            latestCFieldToValue.put(field01 , latestValueC01); 
            latestCFieldToValue.put(field02 , latestValueC02);
            latestCFieldToValue.put(field03 , latestValueC03);
            
            
            Map<String, Object> currentAFieldToValue = new Map<String, Object>(); 
            currentAFieldToValue.put(field01 , currentValueA01); 
            currentAFieldToValue.put(field02 , currentValueA02);
            currentAFieldToValue.put(field03 , currentValueA03);
                 
            Map<String, Object> currentBFieldToValue = new Map<String, Object>(); 
            currentBFieldToValue.put(field01 , currentValueB01); 
            currentBFieldToValue.put(field02 , currentValueB02);
            currentBFieldToValue.put(field03 , currentValueB03);
            
            Map<String, Object> currentCFieldToValue = new Map<String, Object>(); 
            currentCFieldToValue.put(field01 , currentValueC01); 
            currentCFieldToValue.put(field02 , currentValueC02);
            currentCFieldToValue.put(field03 , currentValueC03);       
            
            
            
            Id  financeAId =  createFinance (previousAFieldToValue) ;
            Id  financeBId =  createFinance (previousBFieldToValue) ;
            Id  financeCId =  createFinance (previousCFieldToValue) ;
            List<Id> financeIds = new List<Id> {financeAId, financeBId, financeCId};
                       
            String financePreviousSerialized =  NrEventDelta.getSerializedEvt003Collection(new List<Id>{financeAId, financeBId, financeCId }, fieldNames);
            List<SObject> financePreviousCollection = (List<SObject>) json.deserialize(financePreviousSerialized,List<SObject>.class) ;
            List<SObject> financeLatestCollection   = (List<SObject>) json.deserialize(financePreviousSerialized,List<SObject>.class) ;
            List<SObject> financeCurrentCollection   = (List<SObject>) json.deserialize(financePreviousSerialized,List<SObject>.class) ;
            Map<Id, SObject> financeIdToFinancePrevious = new Map<Id, SObject>(financePreviousCollection);
            Map<Id, SObject> financeIdToFinanceLatest   = new Map<Id, SObject>(financeLatestCollection);
            Map<Id, SObject> financeIdToFinanceCurrent  = new Map<Id, SObject>(financeCurrentCollection);      
               
            for (Id financeId : financeIdToFinanceLatest.keySet()) {
     
                SObject financeLatest  = financeIdToFinanceLatest.get(financeId);
                SObject financeCurrent  = financeIdToFinanceCurrent.get(financeId);  
                
                for (String fieldName : previousAFieldToValue.keySet()) {
                    if (financeId == financeAId) {
                        financeLatest.put(fieldName, latestAFieldToValue.get(fieldName) );
                        financeCurrent.put(fieldName, currentAFieldToValue.get(fieldName) );
                    }
                    if (financeId == financeBId) {
                        financeLatest.put(fieldName, latestBFieldToValue.get(fieldName) );
                        financeCurrent.put(fieldName, currentBFieldToValue.get(fieldName) );
                    }
                    if (financeId == financeCId) {
                        financeLatest.put(fieldName, latestCFieldToValue.get(fieldName) );
                        financeCurrent.put(fieldName, currentCFieldToValue.get(fieldName) );
                    }
                }
                
                financeIdToFinanceLatest.put(financeId,financeLatest);
                financeIdToFinanceCurrent.put(financeId,financeCurrent);
            }
            
     
            // Current represents latest state of finance objects
            update financeIdToFinanceCurrent.values();
            
            // delete finance versions, so we can create scenarios
            delete  Database.query(  ' SELECT Id FROM FinanceVersion__c ');
    
            
            //at this point, we have:
            //  - 3 finance records Id:( A, B, C ) with "current values"  
            //  - each finance Id has previous, latest and current versions in memory
            // an available journal Id for test purposes
            // no financeVersions
    
            // assume
            // CHANGE-EVENT-OCCURRED = (A, B, C) finance records have changed in some way 
            
            //   for A, assume  
            //   - Batched 
            //   - zero finance changes since batching and before CHANGE-EVENT-OCCURRED  
     
            //   for B, assume 
            //   - Batched 
            //   - one finance change  since batching and before CHANGE-EVENT-OCCURRED  
            
            //  for C - assume 
            //   - No Version record (therefore never Batched )
            //   - zero finance changes before CHANGE-EVENT-OCCURRED  
     
    
            Type t = Type.forName('FinanceVersion__c' );
     
            Sobject financeVersionA  =  (SObject) t.newInstance();
            financeVersionA.put('Finance__c', financeAId ); 
            financeVersionA.put('Journal__c', journalId );    
            financeVersionA.put('LatestVersion__c', json.serialize(financeIdToFinanceLatest.get(  financeAId)) );
            financeVersionA.put('PriorVersion__c', null);
            insert financeVersionA;
            Id financeVersionAId =  financeVersionA.Id;  
    
            
            Sobject financeVersionB  =  (SObject) t.newInstance();
            financeVersionB.put('Finance__c', financeBId ); 
            financeVersionB.put('Journal__c', null );    
            financeVersionB.put('LatestVersion__c', json.serialize(financeIdToFinanceLatest.get(  financeBId)));
            financeVersionB.put('PriorVersion__c' , json.serialize(financeIdToFinancePrevious.get(financeBId)));
            insert financeVersionB;
            Id financeVersionBId =  financeVersionB.Id;
          
            // Act 
            List<Sobject>  actualUpsertableFinanceVersions 
                =  NrEventDelta.getUpsertableFinanceVersions( financeIds , fieldNames) ;
            
            // Assemble
            Id     actualFinanceIdA                = null;
            Id     actualJournalIdA                = null;
            String actualLatestVersionSerializedA  = null;
            String actualPriorVersionSerializedA   = null;    
            Id     actualFinanceIdB                = null;
            Id     actualJournalIdB                = null;
            String actualLatestVersionSerializedB  = null;
            String actualPriorVersionSerializedB   = null;
            Id     actualFinanceIdC                = null;
            Id     actualJournalIdC                = null;
            String actualLatestVersionSerializedC  = null;
            String actualPriorVersionSerializedC   = null; 
            
            for (Sobject actualFinanceVersion : actualUpsertableFinanceVersions  ) {
                Id     actualFinanceId                = (Id)     actualFinanceVersion.get('Finance__c'      );
                Id     actualJournalId                = (Id)     actualFinanceVersion.get('Journal__c'      );
                String actualLatestVersionSerialized  = (String) actualFinanceVersion.get('LatestVersion__c');
                String actualPriorVersionSerialized   = (String) actualFinanceVersion.get('PriorVersion__c' );
                
                if (actualFinanceId ==  financeAId) {
                    actualFinanceIdA                = actualFinanceId              ;
                    actualJournalIdA                = actualJournalId              ;
                    actualLatestVersionSerializedA  = actualLatestVersionSerialized;
                    actualPriorVersionSerializedA   = actualPriorVersionSerialized ; 
                }  
                
                if (actualFinanceId ==  financeBId) {
                    actualFinanceIdB                = actualFinanceId              ;
                    actualJournalIdB                = actualJournalId              ;
                    actualLatestVersionSerializedB  = actualLatestVersionSerialized;
                    actualPriorVersionSerializedB   = actualPriorVersionSerialized ;
                } 
                  
                if (actualFinanceId ==  financeCId) {
                    actualFinanceIdC                = actualFinanceId              ;
                    actualJournalIdC                = actualJournalId              ;
                    actualLatestVersionSerializedC  = actualLatestVersionSerialized;
                    actualPriorVersionSerializedC   = actualPriorVersionSerialized ; 
                } 
            }      
     
            
            // Assert        
            Id     expectedFinanceIdA                =  financeAId;
            Id     expectedJournalIdA                =  null;
            String expectedLatestVersionSerializedA  =  json.serialize(financeIdToFinanceCurrent.get(financeAId));
            String expectedPriorVersionSerializedA   =  json.serialize(financeIdToFinanceLatest.get(financeAId));   
                                                                     
            Id     expectedFinanceIdB                =  financeBId;
            Id     expectedJournalIdB                =  null;
            String expectedLatestVersionSerializedB  =  json.serialize(financeIdToFinanceCurrent.get(financeBId));
            String expectedPriorVersionSerializedB   =  json.serialize(financeIdToFinancePrevious.get(financeBId));
                                                                     
            Id     expectedFinanceIdC                =  financeCId;
            Id     expectedJournalIdC                =  null;
            String expectedLatestVersionSerializedC  =  json.serialize(financeIdToFinanceCurrent.get(financeCId)); 
            String expectedPriorVersionSerializedC   =  null; 
                         
            System.assertEquals( expectedFinanceIdA               , actualFinanceIdA                );             
            System.assertEquals( expectedJournalIdA               , actualJournalIdA                );   
            System.assertEquals( expectedLatestVersionSerializedA , actualLatestVersionSerializedA  );   
            System.assertEquals( expectedPriorVersionSerializedA  , actualPriorVersionSerializedA   );    
            System.assertEquals( expectedFinanceIdB               , actualFinanceIdB                );             
            System.assertEquals( expectedJournalIdB               , actualJournalIdB                );   
            System.assertEquals( expectedLatestVersionSerializedB , actualLatestVersionSerializedB  );   
            System.assertEquals( expectedPriorVersionSerializedB  , actualPriorVersionSerializedB   ); 
            System.assertEquals( expectedFinanceIdC               , actualFinanceIdC                );             
            System.assertEquals( expectedJournalIdC               , actualJournalIdC                );   
            System.assertEquals( expectedLatestVersionSerializedC , actualLatestVersionSerializedC  );   
            System.assertEquals( expectedPriorVersionSerializedC  , actualPriorVersionSerializedC   ); 
        }
    }
    
 
    static testMethod void callingGetEvt003FieldsReturnsExpectedFields() {
        if (isInPackagingOrg() ) {

            // Arrange
            String field01 = 'Activity_Fee__c';
            String field02 = 'Deposit_Paid__c';
            String field03 = 'Adjustment_Amount__c';
            
            
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields) ;
            //// List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
    
            // Act
            Set<String> actualEvt003Fields = new Set<String>(NrEventDelta.getEvt003Fields(eventLines)) ;
     
            // assemble
            Boolean flagField01 = actualEvt003Fields.contains(field01.toLowerCase());
            Boolean flagField02 = actualEvt003Fields.contains(field02.toLowerCase());
            Boolean flagField03 = actualEvt003Fields.contains(field03.toLowerCase());
            
            
            // Assert
            Integer expectedSize = 3;
            System.AssertEquals(expectedSize, actualEvt003Fields.size()  ); 
            System.AssertEquals(true  , flagField01 ); 
            System.AssertEquals(true  , flagField02 ); 
            System.AssertEquals(true  , flagField03 ); 
        }
    }
 
    static testMethod void callingGetEvt003SerializedReturnsExpectedSerializedEvt003() {
        if (isInPackagingOrg() ) {
            // Arrange
            String field01 = 'Activity_Fee__c';
            Decimal fieldValue01 = 10.12; 
            String field02 = 'Deposit_Paid__c';
            Decimal fieldValue02  = 23.97; 
            String field03 = 'Adjustment_Amount__c';
            Decimal fieldValue03 = 141.56; 
            
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields) ;
            
            ////List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
            
            List<String> evt003Fields =  NrEventDelta.getEvt003Fields(eventLines)  ;
       
            Map<String, Object> fieldToValue = new Map<String, Object>(); 
            fieldToValue.put(field01 , fieldValue01); 
            fieldToValue.put(field02 , fieldValue02);
            fieldToValue.put(field03 , fieldValue03 );
    
            Id  financeId =  createFinance (fieldToValue) ;
            List<Id> financeIds = new List<Id> {financeId};
       
            // Act
            String actualSerializedEvt003Collection = NrEventDelta.getSerializedEvt003Collection(financeIds, evt003Fields);
     
            // assemble
            List<SObject> actualEvt003Collection = (List<SObject>) json.deserialize(
                actualSerializedEvt003Collection, 
                List<SObject>.class
            );
            SObject actualEvt003 = (actualEvt003Collection.size() > 0) ? actualEvt003Collection[0] : null;
            Decimal actualFieldValue01 = null;
            Decimal actualFieldValue02 = null;
            Decimal actualFieldValue03 = null;
            if (actualEvt003 != null) {
                actualFieldValue01 = (Decimal) actualEvt003.get(field01);
                actualFieldValue02 = (Decimal) actualEvt003.get(field02);
                actualFieldValue03 = (Decimal) actualEvt003.get(field03);   
            }
            
            // Assert
            Decimal expectedFieldValue01 = fieldValue01 ;
            Decimal expectedFieldValue02 = fieldValue02 ;
            Decimal expectedFieldValue03 = fieldValue03 ;
            System.assert(actualEvt003 != null );
            System.AssertEquals(expectedFieldValue01   , actualFieldValue01  ); 
            System.AssertEquals(expectedFieldValue02   , actualFieldValue02  ); 
            System.AssertEquals(expectedFieldValue03   , actualFieldValue03  ); 
        }
    } 
   
    
    static testMethod void callingGetFieldNameToDeltaReturnsExpectedDeltas01() {
        if (isInPackagingOrg() ) {

            // Arrange
            String field01 = 'Activity_Fee__c';
            String field02 = 'Deposit_Paid__c';
            String field03 = 'Adjustment_Amount__c';
            
            Decimal latestValue01 = 10.12; 
            Decimal latestValue02 = 23.97; 
            Decimal latestValue03 = 141.56;  
            
            Decimal previousValue01 = 8.33; 
            Decimal previousValue02 = 9.44; 
            Decimal previousValue03 = 11.55; 
            
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields) ;
            
            //// List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
            List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines)  ;
     
            Map<String, Object> previousFieldToValue = new Map<String, Object>(); 
            previousFieldToValue.put(field01 , previousValue01); 
            previousFieldToValue.put(field02 , previousValue02);
            previousFieldToValue.put(field03 , previousValue03);
            
            Map<String, Object> latestFieldToValue = new Map<String, Object>(); 
            latestFieldToValue.put(field01 , latestValue01); 
            latestFieldToValue.put(field02 , latestValue02);
            latestFieldToValue.put(field03 , latestValue03);
    
            Id  financeId =  createFinance (previousFieldToValue) ;
    
            // Previous 
            SObject eventPrevious  =  ((List<Sobject>) NrEventDelta.deserializeSerializedEvt003Collection(
                NrEventDelta.getSerializedEvt003Collection(new List<Id>{financeId}, fieldNames)
            ))[0];
    
            // Latest
            SObject  eventLatest   = eventPrevious.clone(true);
            for (String fieldName : latestFieldToValue.keySet()) {
                eventLatest.put(fieldName, latestFieldToValue.get(fieldName) );
            }             
     
            
            // Act
            Map<String,Decimal> actualFieldNameToDelta =  NrEventDelta.getFieldNameToDelta(fieldNames, eventLatest,  eventPrevious);
          
      
            // assemble     
            Decimal actualDelta01 = actualFieldNameToDelta.get(field01.toLowerCase());
            Decimal actualDelta02 = actualFieldNameToDelta.get(field02.toLowerCase());
            Decimal actualDelta03 = actualFieldNameToDelta.get(field03.toLowerCase());             
     
            
            // Assert 
            Decimal expectedDelta01 = latestValue01 - previousValue01;
            Decimal expectedDelta02 = latestValue02 - previousValue02;
            Decimal expectedDelta03 = latestValue03 - previousValue03;  
            System.assertEquals(expectedDelta01,actualDelta01 );
            System.assertEquals(expectedDelta02,actualDelta02 );
            System.assertEquals(expectedDelta03,actualDelta03 ); 
        }
    } 

    static testMethod void callingGetFieldNameToDeltaReturnsExpectedDeltas02() {
        if (isInPackagingOrg() ) {

            // Arrange
            String field01 = 'Activity_Fee__c';
            String field02 = 'Deposit_Paid__c';
            String field03 = 'Adjustment_Amount__c';
            
            Decimal latestValue01 = 10.12; 
            Decimal latestValue02 = 23.97; 
            Decimal latestValue03 = 141.56;  
                Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields) ;
            
            //// List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
            List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines)  ;
     
            Map<String, Object> latestFieldToValue = new Map<String, Object>(); 
            latestFieldToValue.put(field01 , latestValue01); 
            latestFieldToValue.put(field02 , latestValue02);
            latestFieldToValue.put(field03 , latestValue03);
    
            Id  financeId =  createFinance (latestFieldToValue) ;
    
            // Latest
            SObject eventLatest  =  ((List<Sobject>) NrEventDelta.deserializeSerializedEvt003Collection(
                NrEventDelta.getSerializedEvt003Collection(new List<Id>{financeId}, fieldNames)
            ))[0];
    
            // Previous
            SObject  eventPrevious   = null;
     
            
            // Act
            Map<String,Decimal> actualFieldNameToDelta =  NrEventDelta.getFieldNameToDelta(fieldNames, eventLatest,  eventPrevious);
          
      
            // assemble     
            Decimal actualDelta01 = actualFieldNameToDelta.get(field01.toLowerCase());
            Decimal actualDelta02 = actualFieldNameToDelta.get(field02.toLowerCase());
            Decimal actualDelta03 = actualFieldNameToDelta.get(field03.toLowerCase());             
     
            
            // Assert 
            Decimal expectedDelta01 = latestValue01 - 0.00;
            Decimal expectedDelta02 = latestValue02 - 0.00;
            Decimal expectedDelta03 = latestValue03 - 0.00;
            System.assertEquals(expectedDelta01,actualDelta01 );
            System.assertEquals(expectedDelta02,actualDelta02 );
            System.assertEquals(expectedDelta03,actualDelta03 ); 
        }
    } 
 
    static testMethod void callingGetEvt003DeltasReturnsExpectedDeltas() {
        if (isInPackagingOrg() ) {

            // Arrange
            String field01 = 'Activity_Fee__c';
            String field02 = 'Deposit_Paid__c';
            String field03 = 'Adjustment_Amount__c';
            
            Decimal latestValueA01 = 8.26; 
            Decimal latestValueA02 = 16.72; 
            Decimal latestValueA03 = 32.58;  
            
            Decimal previousValueA01 = 8.33; 
            Decimal previousValueA02 = 9.44; 
            Decimal previousValueA03 = 11.55; 
           
            Decimal latestValueB01 = 10.12; 
            Decimal latestValueB02 = 23.97; 
            Decimal latestValueB03 = 141.56;  
            
            Decimal previousValueB01 = 20.31; 
            Decimal previousValueB02 = 41.46; 
            Decimal previousValueB03 = 82.32; 
    
            
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add(field01);
            fields.add(field02);
            fields.add(field03);
            List<id> eventLineIds = createEvent003Lines (  eventId,   glaId,  fields) ;
            
            /// List<EventLines__c> eventLines = [SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds ];
            String eventLinesQuery = 'SELECT Id, Name , SourceField__c FROM EventLines__c WHERE Id IN :eventLineIds';
            List<SObject> eventLines = database.query(eventLinesQuery);
            List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines)  ;
     
            Map<String, Object> previousAFieldToValue = new Map<String, Object>(); 
            previousAFieldToValue.put(field01 , previousValueA01); 
            previousAFieldToValue.put(field02 , previousValueA02);
            previousAFieldToValue.put(field03 , previousValueA03);
    
            Map<String, Object> previousBFieldToValue = new Map<String, Object>(); 
            previousBFieldToValue.put(field01 , previousValueB01); 
            previousBFieldToValue.put(field02 , previousValueB02);
            previousBFieldToValue.put(field03 , previousValueB03);
            
            Map<String, Object> latestAFieldToValue = new Map<String, Object>(); 
            latestAFieldToValue.put(field01 , latestValueA01); 
            latestAFieldToValue.put(field02 , latestValueA02);
            latestAFieldToValue.put(field03 , latestValueA03);
            
            Map<String, Object> latestBFieldToValue = new Map<String, Object>(); 
            latestBFieldToValue.put(field01 , latestValueB01); 
            latestBFieldToValue.put(field02 , latestValueB02);
            latestBFieldToValue.put(field03 , latestValueB03);
            
            
            Id  financeAId =  createFinance (previousAFieldToValue) ;
            Id  financeBId =  createFinance (previousBFieldToValue) ;
            
     
            // Previous 
            String serializedPreviousCollection = NrEventDelta.getSerializedEvt003Collection(new List<Id>{financeAId, financeBId}, fieldNames);
     
     
            // Latest
            List<Sobject> eventLatestCollection  =  (List<Sobject>) NrEventDelta.deserializeSerializedEvt003Collection( 
                serializedPreviousCollection
            );
            for (SObject eventLatest : eventLatestCollection) {
                Map<String, Object> latestFieldToValue = latestAFieldToValue;
                if (eventLatest.Id == financeBId) {
                    latestFieldToValue = latestBFieldToValue;
                }
      
                for (String fieldName : latestFieldToValue.keySet()) {
                    eventLatest.put(fieldName, latestFieldToValue.get(fieldName) );
                } 
            } 
            String serializedLatestCollection =  json.serialize(eventLatestCollection);
     
           
     
            // Act
            Map<Id, Map<String,Decimal>> actualEvt003Deltas = NrEventDelta.getEvt003Deltas( fieldNames,   serializedLatestCollection,   serializedPreviousCollection);
      
            
            // assemble 
            Map<String,Decimal> actualFieldNameToDeltaA = null;
            Map<String,Decimal> actualFieldNameToDeltaB = null;
            for (Id financeId : actualEvt003Deltas.keyset()) {
                if (financeId == financeAId) {
                    actualFieldNameToDeltaA = actualEvt003Deltas.get(financeId);
                }
                if (financeId == financeBId) {
                    actualFieldNameToDeltaB = actualEvt003Deltas.get(financeId);
                }     
            }
      
               
            Decimal actualDeltaA01 = null;
            Decimal actualDeltaA02 = null;
            Decimal actualDeltaA03 = null;
            Decimal actualDeltaB01 = null;
            Decimal actualDeltaB02 = null;
            Decimal actualDeltaB03 = null;
            if ((actualFieldNameToDeltaA != null) && (actualFieldNameToDeltaB != null)) {
                actualDeltaA01 = actualFieldNameToDeltaA.get(field01.toLowerCase());
                actualDeltaA02 = actualFieldNameToDeltaA.get(field02.toLowerCase());
                actualDeltaA03 = actualFieldNameToDeltaA.get(field03.toLowerCase());             
                actualDeltaB01 = actualFieldNameToDeltaB.get(field01.toLowerCase());
                actualDeltaB02 = actualFieldNameToDeltaB.get(field02.toLowerCase());
                actualDeltaB03 = actualFieldNameToDeltaB.get(field03.toLowerCase());   
            }
        
            // Assert 
            System.assert ((actualFieldNameToDeltaA != null) && (actualFieldNameToDeltaB != null));
      
            Decimal expectedDeltaA01 = latestValueA01 - previousValueA01;
            Decimal expectedDeltaA02 = latestValueA02 - previousValueA02;
            Decimal expectedDeltaA03 = latestValueA03 - previousValueA03;  
            Decimal expectedDeltaB01 = latestValueB01 - previousValueB01;
            Decimal expectedDeltaB02 = latestValueB02 - previousValueB02;
            Decimal expectedDeltaB03 = latestValueB03 - previousValueB03; 
            System.assertEquals(expectedDeltaA01,actualDeltaA01 );
            System.assertEquals(expectedDeltaA02,actualDeltaA02 );
            System.assertEquals(expectedDeltaA03,actualDeltaA03 ); 
            System.assertEquals(expectedDeltaB01,actualDeltaB01 );
            System.assertEquals(expectedDeltaB02,actualDeltaB02 );
            System.assertEquals(expectedDeltaB03,actualDeltaB03 );
        }
    }        
 
 
    static testMethod void canCreateEventLines( )  {
        if (isInPackagingOrg() ) {
            // arrange
            Id eventId =  createEvent003 () ;
            Id glaId = createGeneralLedgerAccount(   );
            List<String> fields  = new List<String>(); 
            fields.add('Activity_Fee__c'     );
            fields.add('Deposit_Paid__c'     );
            fields.add('Adjustment_Amount__c');
            
            // act 
            List<id> eventLines = createEvent003Lines (  eventId,   glaId,  fields) ;
     
            // assert
            System.assert(eventLines != null);
            System.assert(eventLines.size() == 3);    
        }
    }  
   
    static testMethod void canCreateFinance( )  {
        if (isInPackagingOrg() ) {
            // act 
            Map<String, Object> fieldToValue = new Map<String, Object>();   
            id financeId =  createFinance (fieldToValue) ;
            
            // assert
            System.assert(financeId != null);
        }
    }

     public static Id  createEvent003 () { 
        /// String eventName = 'EVT-003'; 
        /// Event__c event = new Event__c(Name = eventName);
        /// insert event;
        /// return event.Id;
        
        String eventName = 'EVT-003'; 
        SOBject event = getNewSobject('ffps_hult__Event__c');
        event.put('Name', eventName);
        insert event;
        return (Id) event.get('Id'); 
    }
    
    public static List<id> createEvent003Lines (Id eventId, Id glaId, List<String> fields) { 
        List<SOBject> eventLines = new List<SOBject>(); 
        for (String field : fields) {
            SOBject eventLine = getNewSobject('ffps_hult__EventLines__c');
            eventLine.put('SourceField__c', field);
            eventLine.put('Event__c', eventId); 
            eventLine.put('EL1__c', glaId); 
            eventLines.add(eventLine);
        }
        insert eventLines;
        
       return  new List<Id>((new Map<Id,Sobject>(eventLines)).keySet());    
    }   
    
    public static  id createApplicant (integer studentNumber   ) {
        string title           = 'Mr';
        string currencyCode    = 'USD';        
        string lastName        = 'first';
        string firstName       = 'last';
        Contact applicant  = new Contact ( LastName = lastName , FirstName = firstName ,  CurrencyIsoCode =  currencyCode , Title = title   );
        applicant.put('Student_ID__c', string.valueOf(studentNumber ));
        insert applicant  ;
        
        return  applicant.id;
    } 

    public static  id createProgram ( ) {
        String soName = (isInPackagingOrg()) ? 'ffps_hult__Program__c' : 'Program__c'; 
        SOBject program = getNewSobject(soName);
        program.put('Name' , 'a-program'  );
        insert program;
        return program.Id;
    }        

  public static  id createApplication (id applicantId , id  programId   ) {
      Contact applicant = [SELECT id, name, firstName , lastName FROM Contact WHERE id = :applicantId ];
      SObject  program = Database.query('SELECT id, name   FROM Program__c WHERE id = :programId');

      string stageName  ='Prospecting'; 
      Date closeDate = System.Today().AddDays(50);
      string name = applicant.firstName + ' ' + applicant.lastName +': ' + (string) program.get('name');    
      

      SOBject application = getNewSobject('Opportunity');
      application.put('StageName'  , stageName    );
      application.put('Name'       , name      );
      application.put('CloseDate'  , closeDate  );
      application.put('Contact__c' ,  applicantId  );
      application.put('Program__c' , programId  );    
      
      insert application   ;
      return  application.id;
  }
          
          
          
    public static id createFinance (Map<String, Object> fieldToValue) {

        Integer studentNumber = 56789012;
        Id applicantId = createApplicant (studentNumber);
        Id programId = createProgram ();
        Id applicantionId = createApplication ( applicantId ,   programId   );
        
        String soName = (isInPackagingOrg()) ? 'ffps_hult__Opportunity_Finance__c' : 'Opportunity_Finance__c';         
        SOBject finance = getNewSobject(soName);
        finance.put('Opportunity__c' , applicantionId    );
        for (String field : fieldToValue.keySet()) {
            finance.put(field, fieldToValue.get(field));      
        }
        
        insert finance ;
        
        return finance.id;
    } 
    
    public static  id createGeneralLedgerAccount(   )   {

        SOBject gla = getNewSobject('c2g__codaGeneralLedgerAccount__c');
        gla.put('c2g__Type__c' , 'Balance Sheet');
        gla.put('Name' , 'Vehicles');
        gla.put('c2g__ReportingCode__c' ,  '0100'  );
        insert gla  ;
        return  (Id) gla.get('Id');

        //// c2g__codaGeneralLedgerAccount__c gla  = new c2g__codaGeneralLedgerAccount__c ( c2g__Type__c = 'Balance Sheet' , Name = 'Vehicles' ,  c2g__ReportingCode__c =  '0100'    );
        //// insert gla  ;
        //// return  gla.id;

    } 
    
    
    public static id createJournal (id applicantId , string journalDescription  )
    {

           //// c2g__codaJournal__c journal = new c2g__codaJournal__c(
           //// ffgl__DeriveCurrency__c = true,   
           //// ffgl__DerivePeriod__c = true,
           //// c2g__JournalDescription__c = journalDescription,
           //// c2g__JournalDate__c =  date.newinstance(2013, 4, 17) );
           //// 
           //// journal.put(  'Applicant__c'  , applicantId  );
           //// 
           //// insert journal;
           //// return journal.id;
           
           
            SOBject journal = getNewSobject('c2g__codaJournal__c');
            
            journal.put(  'ffgl__DeriveCurrency__c'  , true  );
            journal.put(  'ffgl__DerivePeriod__c'  , true  );
            journal.put(  'c2g__JournalDescription__c'  , journalDescription  );
            journal.put(  'c2g__JournalDate__c'  , date.newinstance(2013, 4, 17)  );
            journal.put(  'Applicant__c'  , applicantId  );
            
            insert journal;
            return (Id) journal.get('Id');
    }
    
    public static SObject getNewSobject(String t) 
    {
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType st = gd.get(t);
        System.assert(st != null,'Type provided: "' + t + '" doesnt map to an sobject token in this org.');
        Sobject s = st.newSobject();
    
        return s;
    }
    
    
    public static Boolean isInPackagingOrg()
    {
        return UserInfo.getOrganizationId().contains('00DD0000000rIdn');
    }
    
}