trigger UpdateFinance_FromOpportunity on Opportunity (after update) {
    SET<ID> opp_ids = new SET<ID>();
    SET<ID> fin_visapick = new SET<ID>();
    SET<ID> fin_isocode = new SET<ID>();
    SET<ID> ftnupd = new SET<ID>();
    SET<ID> fin_fee_chng = new SET<ID>();
    List<Opportunity_Finance__c> fin_update=new  List<Opportunity_Finance__c>();
    List<Finance_Transactions__c> ft_update=new  List<Finance_Transactions__c>();
    
    for(Opportunity opp:Trigger.New){
        Opportunity oldOpp=Trigger.isinsert?new Opportunity():Trigger.oldMap.get(opp.Id);
    	if(RecordTypeHelper.isapplicationprocessrecordtype(opp.RecordTypeId)) 
        	continue;	
        if((opp.Primary_Program_Choice__c != OldOpp.Primary_Program_Choice__c)|| 
           (opp.Primary_Campus__c != OldOpp.Primary_Campus__c) ) 
        {
        	opp_ids.add(Opp.id);      
            ftnupd.add(Opp.id);
        }
        /****SFSUP 775*****/
        if(opp.Program__c!=oldopp.Program__c && OldOpp.Primary_Campus__c=='Dubai' &&Opp.Primary_Campus__c!='Dubai'){
        	opp_ids.add(opp.id);
            fin_visapick.add(opp.id);
        } //end SFSUP 775    
        if(opp.Primary_Campus__c!=oldopp.Primary_Campus__c)
        {
            opp_ids.add(opp.id);
			fin_isocode.add(opp.id);
        }
        //start:set fee
        if(opp.Program__c!=oldopp.Program__c || opp.Start_Term__c !=oldopp.Start_Term__c)
        {
            opp_ids.add(opp.id);
            fin_fee_chng.add(opp.Id);          
        }
        //end:set fee
    }
    
    if(!opp_ids.isEmpty())
    {
    	List<Opportunity_Finance__c> financeObj=[select id,Opportunity__c,Visa_Type_Picklist__c,
        Fees__c,Opportunity__r.Program_Currency__c,
		(SELECT Id,Name,Finance__c from Finance_Transactions__r ) from  Opportunity_Finance__c where Opportunity__c IN :opp_ids];
        for(Opportunity_Finance__c opf:financeObj)
        {   
        	boolean temp=false;
            if(fin_visapick!=null && fin_visapick.contains(opf.Opportunity__c))
            {
            	opf.Visa_Type_Picklist__c ='';
                temp=true;
            }
            if(fin_isocode!=null && fin_isocode.Contains(opf.Opportunity__c)){
                opf.CurrencyIsoCode=opf.Opportunity__r.Program_Currency__c;
            	temp=true;
            }
            if(fin_fee_chng!=null && fin_fee_chng.contains(opf.Opportunity__c)){
                temp=true;
                opf.Fees__c=null;
            }
            if(opf.Finance_Transactions__r.size()!=Null && ftnupd.contains(opf.Opportunity__c))
            {
            	for(Finance_Transactions__c ft:opf.Finance_Transactions__r){                    
                	ft_update.add(ft);
                }
            }
            
            if(temp)
                fin_update.add(opf);
		}
        
        try
        {       
        	if(!fin_update.isEmpty())
            	update fin_update;
        }
        catch(Exception e){}
            
        try
        {     
                if(!ft_update.IsEmpty())
                    update ft_update;
        }
        catch(Exception e){}
           
    }//wnd: main if cond.
    
}