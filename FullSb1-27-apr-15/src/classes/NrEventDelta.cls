global class NrEventDelta {
    
    global class NrEventDeltaException extends Exception {}
    
    global static Map<Id, Map<String,Decimal>> getFinanceIdToFieldDeltas(Map<id , string> eventIdToEventType) {
        
        String eventName = 'EVT-003';

        // derive financeIds collection
        // ( ie Ids that are of EVT-003 )
        List<Id> financeIds = new List<Id>();
        for (Id  eventId : eventIdToEventType.keySet()) {
            if ( (String) eventIdToEventType.get(eventId) == eventName) {
                financeIds.add(eventId);
            }
        }

        // from versions object,
        // derive latest and previous serialized collections:
        String query  = ' SELECT Id, Name, Finance__c, Journal__c, LatestVersion__c,  PriorVersion__c    '+ 
            ' FROM FinanceVersion__c '+ 
            ' WHERE Finance__c  IN :financeIds ';
        List<SObject> financeVersions = Database.query(query);
        List<String> latestVersions = new List<String>();
        List<String> priorVersions  = new List<String>();
        for (Sobject financeVersion : financeVersions) {
            String latestVersion = (String) financeVersion.get('LatestVersion__c');
            String priorVersion  = (String) financeVersion.get('PriorVersion__c');
            if (!String.isBlank(latestVersion)) {
                latestVersions.add(latestVersion);
            }
            if (!String.isBlank(priorVersion)) {
                priorVersions.add(priorVersion);
            }     
        }
        String serializedLatestCollection    =  (latestVersions.size() > 0) ? '[' + String.join( latestVersions , ',') + ']' : null; 
        String serializedPreviousCollection  =  (priorVersions.size() > 0)  ? '[' + String.join( priorVersions  , ',') + ']' : null;  

        // derive normaized field names: 
        /// List<EventLines__c> eventLines = [ 
        ///     SELECT Id, Name , SourceField__c 
        ///     FROM EventLines__c 
        ///     WHERE Event__r.Name = :eventName 
        /// ];
        String eventLinesQuery = 'SELECT Id, Name , ffps_hult__SourceField__c FROM ffps_hult__EventLines__c WHERE ffps_hult__Event__r.Name = :eventName'; 
        List<Sobject> eventLines =  database.query(eventLinesQuery);
        
        List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines);

        // derive map - resolved financeIds
        Map<Id, Map<String,Decimal>> financeIdToFieldDeltas =  getEvt003Deltas(fieldNames,  serializedLatestCollection,  serializedPreviousCollection);
        
        // also include map of un-resolved financeIds
        // with each field's delta set to zero
        for (Id financeId : financeIds) {  
            if (financeIdToFieldDeltas.get(financeId) == null) {
                Map<String,Decimal> fieldNameToDelta  = new Map<String,Decimal>();
                for (String  fieldName : fieldNames) {
                    fieldNameToDelta.put(fieldName, 0.00);
                }
                financeIdToFieldDeltas.put(financeId,fieldNameToDelta);
            }
        }
        
        return financeIdToFieldDeltas;
    }
    

    
    // TODO : write a test for this  :: BEG 
    global static  void  upsertFinanceVersions( List<Id> financeIds ) {
        String eventName = 'EVT-003'; 
        /// List<EventLines__c> eventLines = [ 
        ///     SELECT Id, Name , SourceField__c 
        ///     FROM EventLines__c 
        ///     WHERE Event__r.Name = :eventName 
        /// ];
        String eventLinesQuery = ' SELECT Id, Name , ffps_hult__SourceField__c   FROM ffps_hult__EventLines__c   WHERE ffps_hult__Event__r.Name = :eventName ';
        List<SObject> eventLines = Database.query(eventLinesQuery); 
        List<String> fieldNames =  NrEventDelta.getEvt003Fields(eventLines);
        List<SObject> upsertableFinanceVersions = getUpsertableFinanceVersions( financeIds,   fieldNames );
        
      
        
        List<SObject> insertFinanceVersions =  new List<SObject>();
        List<SObject> updateFinanceVersions =  new List<SObject>();
        for (SObject upsertableFinanceVersion : upsertableFinanceVersions) {
            if (upsertableFinanceVersion.Id == null) {
                insertFinanceVersions.add(upsertableFinanceVersion);
            } else {
                updateFinanceVersions.add(upsertableFinanceVersion); 
            }
        }
        insert  insertFinanceVersions;
        update  updateFinanceVersions;   
    }
    // TODO : write a test for this  :: END
    // 
    //   
         
    @testVisible
    global static  List<Sobject> getUpsertableFinanceVersions( List<Id> financeIds, List<String>  fieldNames ) {
        // finance versions   
        String query  = ' SELECT Id, Name, Finance__c, Journal__c, LatestVersion__c, PriorVersion__c    '+ 
                        ' FROM FinanceVersion__c '+ 
                        ' WHERE Finance__c  IN :financeIds ';
        List<SObject> financeVersions = Database.query(query);
        
        
        // current financeId to Finance object
        Map<Id, SObject> currentFinanceIdToFinance = new Map<Id, SObject>(
            deserializeSerializedEvt003Collection( getSerializedEvt003Collection( financeIds,  fieldNames))  
        );
        
        // initialise existing finance version Id collection ...
        Set<id> financeIdsFromFinanceVersion = new Set<id>();
        
        // initialise return collection
        Map<Id, Map<String, Object>> financeIdToAttributes = new  Map<Id, Map<String, Object>>();

        
        // iterate over : 
        // finance ids that have a corresponding  version record
        for (SObject financeVersion :  financeVersions) {
            Id financeVersionId = (Id) financeVersion.Id;
            Id financeId  =  (Id) financeVersion.get('Finance__c'); 
            Id journalId  = (Id) financeVersion.get('Journal__c'); 
            SObject currentFinance =  currentFinanceIdToFinance.get(financeId);
            String  serializedPrevious =  (String) financeVersion.get('PriorVersion__c');
            String  serializedLatest   =  (String) financeVersion.get('LatestVersion__c' );
            String  serializedCurrent  = (currentFinance != null) ? json.serialize(currentFinance) : null;
            
            financeIdsFromFinanceVersion.add(financeId);
            
            Map<String, Object> attributes =  new Map<String, Object>();
            attributes.put('financeVersionId', financeVersionId); 
            attributes.put('financeId', financeId);
            attributes.put('journalId', journalId);    
            attributes.put('serializedPrevious', serializedPrevious);
            attributes.put('serializedLatest', serializedLatest);
            attributes.put('serializedCurrent', serializedCurrent);
            financeIdToAttributes.put(financeId,attributes);
        }
        
        // iterate over : 
        // finance ids that have NO corresponding  version record
        for (Id financeId : financeIds) {
            Boolean isNewFinanceVersion = (!financeIdsFromFinanceVersion.contains(financeId));
            if (isNewFinanceVersion) {
                SObject currentFinance =  currentFinanceIdToFinance.get(financeId);
                String  serializedCurrent  = (currentFinance != null) ? json.serialize(currentFinance) : null;
                
                Map<String, Object> attributes =  new Map<String, Object>();
                attributes.put('financeVersionId', null); 
                attributes.put('financeId', financeId);
                attributes.put('journalId', null);    
                attributes.put('serializedPrevious', null);
                attributes.put('serializedLatest', null);
                attributes.put('serializedCurrent', serializedCurrent);
                financeIdToAttributes.put(financeId,attributes);
            }   
        }
 
 
        // derive upsertable collection of financeVersion records
        Type t = Type.forName('FinanceVersion__c' ); 
        List<SObject> upsertablefinanceVersions = new List<Sobject>();
        for (Id financeId : financeIdToAttributes.keySet()) {
            Map<String, Object> attributes = financeIdToAttributes.get(financeId);
            Id financeVersionId        = (Id) attributes.get('financeVersionId'); 
            Id journalId               = (Id) attributes.get('journalId'); 
            String  serializedPrevious =  (String) attributes.get('serializedPrevious');
            String  serializedLatest   =  (String) attributes.get('serializedLatest' );
            String  serializedCurrent  =  (String) attributes.get('serializedCurrent' );
            Boolean hasJournalReference = (journalId != null);
            
            // rule:
            // any user change fires a trigger context that:
            //   a. moves the data in LATESTVERSION to PRIORVERSION
            //      ( note: step (a.) will only happen if  the data in the
            //              LATESTVERSION  has already been raised as an invoice - ie there
            //              is a journal reference in Journal__c)
            //   b. saves the current finance record  into the LATESTVERSION
            if (hasJournalReference) {
                serializedPrevious =  serializedLatest;  
            }
            serializedLatest = serializedCurrent;
            journalId = null;
            
            Sobject upsertableFinanceVersion  =  (SObject) t.newInstance();
            upsertableFinanceVersion.put('Id', financeVersionId); 
            upsertableFinanceVersion.put('Finance__c',financeId ); 
            upsertableFinanceVersion.put('Journal__c',journalId );    
            upsertableFinanceVersion.put('LatestVersion__c', serializedLatest);
            upsertableFinanceVersion.put('PriorVersion__c', serializedPrevious);
            upsertablefinanceVersions.add(upsertableFinanceVersion);
        }
        
        return upsertablefinanceVersions;
    }
    
    
    @testVisible
  ////  global  static List<String> getEvt003Fields( List<EventLines__c> eventLines ) {
    global  static List<String> getEvt003Fields( List<SObject> eventLines ) {
        Type t = Type.forName('Opportunity_Finance__c' );
        Sobject  so =  (Sobject) t.newInstance();
        Schema.SObjectType sot =  so.getSObjectType();
        Schema.DescribeSObjectResult r = sot.getDescribe();
        Set<String> validFields = (Set<String>) json.deSerialize( json.serialize( r.fields.getMap().keySet()).toLowerCase(), Set<String>.class);
        
        Set<String> templateFields = new Set<String>();
       /// for (EventLines__c eventLine : eventLines) {
       for (SObject eventLine : eventLines) {
           // String templateField = eventLine.SourceField__c;
            String templateField = (String)eventLine.get('ffps_hult__SourceField__c');
            if (templateField != null) {
                templateField = templateField.toLowerCase();
                if (validFields.contains(templateField)) {
                    templateFields.add(templateField);
                }   
            }
        }
        
        return new List<String>(templateFields);
    }
    
 
    // TODO -- do we need this one : beg 
    @testVisible
    global   static String getSerializedEvt003Collection(List<Id> opportunityFinanceIds, List<String> evt003Fields) {  
        if (opportunityFinanceIds == null) {
            throw new  NrEventDeltaException('opportunityFinanceIds collection cannot be null');
        }
        
        String inClause =   '\''+ String.join( opportunityFinanceIds,'\',\'')+'\'' ;
        String query = 'SELECT ' + String.join(evt003Fields, ',')   + ' FROM Opportunity_Finance__c WHERE Id IN (' + inClause  + ')';
        
        return (opportunityFinanceIds.size() > 0) ? json.serialize(Database.query(query)) : json.serialize(new List<SObject>());
    }
    // TODO -- do we need this one : end 


    @testVisible
    global   static Map<Id, Map<String,Decimal>> getEvt003Deltas(List<String> fieldNames, String serializedLatestCollection, String serializedPreviousCollection) {
        if (fieldNames == null) {
            throw new  NrEventDeltaException('fieldNames collection cannot be null' );      
        }    
        
        ////if (String.isBlank(serializedLatestCollection)) {
        ////    throw new  NrEventDeltaException('Invalid LATEST serialized EVT-003 : ' + serializedLatestCollection );      
        ////}
        ////List<SObject> eventLatestCollection = deserializeSerializedEvt003Collection(  serializedLatestCollection ); 
        List<SObject> eventLatestCollection = (String.isBlank(serializedLatestCollection)) ?
        new List<SObject>() :
        deserializeSerializedEvt003Collection(serializedLatestCollection );
        
        List<SObject> eventPreviousCollection = (String.isBlank(serializedPreviousCollection)) ?
        new List<SObject>() :
        deserializeSerializedEvt003Collection(serializedPreviousCollection );   
        Map<Id,SObject>  financeIdToEventPrevious = new Map<Id,SObject>();     
        for (SObject  eventPrevious  : eventPreviousCollection) {
            financeIdToEventPrevious.put(eventPrevious.Id, eventPrevious);
        }    
        
        
        Map<Id, Map<String,Decimal>> financeIdToDeltas =  new Map<Id, Map<String,Decimal>>();
        for (SObject eventLatest : eventLatestCollection) {
            Id financeId = eventLatest.Id;
            SObject eventPrevious  = financeIdToEventPrevious.get(financeId);
            Map<String,Decimal> fieldNameToDelta =  getFieldNameToDelta(fieldNames,  eventLatest,  eventPrevious) ;
            financeIdToDeltas.put(financeId, fieldNameToDelta);
        }
        
        return financeIdToDeltas;
    }
    
    
    
    @testVisible
    global   static   Map<String,Decimal>  getFieldNameToDelta(List<String> fieldNames, SObject eventLatest, SObject eventPrevious) {
        if (fieldNames == null) {
            throw new  NrEventDeltaException('fieldNames collection cannot be null' );      
        }    
        
        if (eventLatest == null) {
            throw new  NrEventDeltaException('latest event cannot be null ' );
        }
        
        Type t = Type.forName('Opportunity_Finance__c' );
        eventPrevious  = (eventPrevious == null) ? (Sobject) t.newInstance() : eventPrevious ;
        
        Map<String,Decimal> fieldNameToDelta  = new Map<String,Decimal>();
        for (String  fieldName : fieldNames) {
            Decimal latest  =  (eventLatest.get(fieldName) != null) ? (Decimal) eventLatest.get(fieldName): 0.00;
            Decimal previous = (eventPrevious.get(fieldName) != null) ? (Decimal)eventPrevious.get(fieldName) : 0.00;
            Decimal delta = latest - previous;
            fieldNameToDelta.put(fieldName, delta);
        }
        
        return fieldNameToDelta;
    } 
    


    @testVisible
    global  static List<SObject> deserializeSerializedEvt003Collection(String serialized) {
        serialized = (serialized.startsWith('[')) ?  serialized : '[' + serialized + ']';
        
        List<SObject> sobjects = (List<SObject>) json.deserialize(serialized, List<SObject>.class);
        if (sobjects.size() == 0) {
            throw new  NrEventDeltaException('No serialized EVT-003 found in : ' +serialized );
        }
        
        return sobjects;
    }         
}