/*
    Developer   :: Premanath Reddy
    Date        :: 10/04/2015
    Comments    :: (SFSUP-1022)Trigger to update the Housing Accommmodation from Finance to Rotation
*/
trigger rotation_housing on Opportunity_Finance__c (after update) {

    Set<id> opfin_ids=new Set<id>();
        
    for(Opportunity_Finance__c fin:Trigger.new){
        Opportunity_Finance__c oldfin=trigger.Isinsert?new Opportunity_Finance__c():Trigger.oldmap.get(fin.id);
        if(oldfin.Rot_Housing_Module_D__c!=fin.Rot_Housing_Module_D__c
            || oldfin.Rot_Housing_Module_E__c!=fin.Rot_Housing_Module_E__c){
            
            opfin_ids.add(fin.id);
        }
    }
        
    if(!opfin_ids.isEmpty()){
        Map<Id,Opportunity_Finance__c> fin_map=new Map<Id,Opportunity_Finance__c>();
        List<Opportunity_Finance__c> opfin=[Select id,Opportunity__c,Opportunity__r.Contact__c
                                            ,Rot_Housing_Module_D__c,Rot_Housing_Module_E__c
                                            from Opportunity_Finance__c where id in:opfin_ids];
        for(Opportunity_Finance__c f:opfin){
            fin_map.put(f.Opportunity__r.Contact__c,f);
        }
        List<Rotation__c> updt_rot=new List<Rotation__c>();
        List<Rotation__c> rot_lst=[Select id,Rot_Housing_Module_D__c,Rot_Housing_Module_E__c,Student__c,Type__c
                                    from Rotation__c where Student__c in: fin_map.Keyset()];
        for(Rotation__c rot:rot_lst){
            Opportunity_Finance__c finc=fin_map.get(rot.Student__c);
            if(rot.Type__c=='Mod D & E'){
                rot.Rot_Housing_Module_D__c=finc.Rot_Housing_Module_D__c;
                rot.Rot_Housing_Module_E__c=finc.Rot_Housing_Module_E__c;
            }
            else if(rot.Type__c=='Mod D'){
                rot.Rot_Housing_Module_D__c=finc.Rot_Housing_Module_D__c;
            }
            else if(rot.Type__c=='Mod E'){
                rot.Rot_Housing_Module_E__c=finc.Rot_Housing_Module_E__c;
            }
            updt_rot.add(rot);
        }
        if(!updt_rot.isEmpty()){
            update updt_rot;
        }
    }
    
    
}