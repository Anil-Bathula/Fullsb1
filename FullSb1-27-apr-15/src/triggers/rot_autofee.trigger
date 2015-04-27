/*
    Developer   :: Premanath Reddy
    Date        :: 14/1/2015
    Comments    :: (SFSUP-850)Trigger to update the finance visa track is changed on Rotation.
    Test Class  :: Rotation2documentstest(96%)
    Last Modified:: Prem(7/4/2015) - SFSUP-1018
*/
trigger rot_autofee on Rotation__c (after insert,after update) {
    map<Rotation__c,id> rotmap=new map<Rotation__c,id>();
    Map<Id,List<Rotation__c>> hous_map=new Map<Id,List<Rotation__c>>();
    Map<Id,List<Rotation__c>> campus_map=new Map<Id,List<Rotation__c>>();
    
    Set<Id> ids=new Set<Id>();
    for(Rotation__c rot:Trigger.New){
        Rotation__c oldrot=Trigger.isInsert?new Rotation__c():Trigger.oldMap.get(rot.Id);
        if(rot.Active__c && rot.Is_Rotating__c && oldrot.Visa_Track__c!=rot.Visa_Track__c && rot.Visa_Track__c!=null){
            rotmap.put(rot,rot.Visa_Track__c);
            ids.add(rot.Student__c);
        }
        if((oldrot.Rot_Housing_Module_D__c!=rot.Rot_Housing_Module_D__c&& rot.Rot_Housing_Module_D__c!=null)
            || (oldrot.Rot_Housing_Module_E__c!=rot.Rot_Housing_Module_E__c&& rot.Rot_Housing_Module_E__c!=null)){
            ids.add(rot.Student__c);
            List<Rotation__c> rot1=hous_map.containsKey(rot.Student__c)?hous_map.get(rot.Student__c):new List<Rotation__c>();
            rot1.add(rot);
            hous_map.put(rot.Student__c, rot1);
            
        }
        if(oldrot.Rotation_Campus__c!=rot.Rotation_Campus__c && Trigger.isupdate){
            ids.add(rot.Student__c);
            List<Rotation__c> rot2=campus_map.containsKey(rot.Student__c)?campus_map.get(rot.Student__c):new List<Rotation__c>();
            rot2.add(rot);
            campus_map.put(rot.Student__c, rot2);            
        }
    }
    if(!rotmap.isEmpty() || !hous_map.isEmpty() || !campus_map.isEmpty()){
        Map<String,String> visa_trak=new Map<String,String>();
        Map<String,String> varmap=new Map<String,String>();
        Map<String,String> varmap1=new Map<String,String>();
        List<Opportunity_Finance__c> updtfin=new List<Opportunity_Finance__c>();
        List<Opportunity_Finance__c> fin=[Select id,Rot_Visa_Module_D__c,Rot_Visa_Module_E__c,Opportunity__r.Contact__c
                                           ,Rot_Housing_Module_D__c,Rot_Housing_Module_E__c
                                           from Opportunity_Finance__c where Opportunity__r.Contact__c in:ids];
        List<Visa_Track__c> visatrac=[Select id,Name from Visa_Track__c where id in:rotmap.values()];
        for(Visa_Track__c vt:visatrac){
            visa_trak.put(vt.id,vt.Name);
        }
        
        for(Opportunity_Finance__c f: fin)
        {
             if(hous_map.containskey(f.Opportunity__r.Contact__c))
             {
                 hous_map.put(f.id,hous_map.get(f.Opportunity__r.Contact__c));
             }
             
             if(campus_map.containskey(f.Opportunity__r.Contact__c))
             {
                 campus_map.put(f.id,campus_map.get(f.Opportunity__r.Contact__c));
             }
        }
        Map<String,String> modd_map=new Map<String,String>();
        modd_map.put('China: X-2 Visa','Shanghai - X2 - Mod D');
        modd_map.put('UAE: Visitor Visa','DUB - Visa - Visit');
        modd_map.put('UAE: Student Residence','Dubai - Student Residence Visa - Mod D');
        modd_map.put('UAE: EMBA Transit Visa','Dubai - EMBA Transit Visa - Mod D');
        modd_map.put('UAE: Visitor Visa (3 months)','Dubai - Visit Visa (3 months) - Mod D');
        modd_map.put('UAE: Visitor Visa (30 days)','Dubai - Visit Visa (1 month) - Mod D');
        
        Map<String,String> mode_map=new Map<String,String>();
        mode_map.put('China: X-2 Visa','Shanghai - X2 - Mod E');
        mode_map.put('UAE: Visitor Visa','DUB - Visa - Visit');
        mode_map.put('UAE: Student Residence','Dubai - Student Residence Visa - Mod E');
        mode_map.put('UAE: EMBA Transit Visa','Dubai - EMBA Transit Visa - Mod E');
        mode_map.put('UAE: Visitor Visa (3 months)','Dubai - Visit Visa (3 months) - Mod E');
        mode_map.put('UAE: Visitor Visa (30 days)','Dubai - Visit Visa (1 month) - Mod E');
        
        for(Rotation__c rr:rotmap.Keyset()){
            if(modd_map.containsKey(visa_trak.get(rr.Visa_Track__c))){
                varmap.put(rr.Student__c,visa_trak.get(rr.Visa_Track__c));
                varmap1.put(rr.Student__c,rr.Type__c);
            }
        }
        if(!varmap.isEmpty() || !hous_map.isEmpty() || !campus_map.isEmpty()){
            try{                        
            for(Opportunity_Finance__c opf:fin){
                boolean temp;
                if(!varmap.isEmpty()){
                    if(varmap1.get(opf.Opportunity__r.Contact__c)=='Mod D' || varmap1.get(opf.Opportunity__r.Contact__c)=='Mod D & E'){
                        if(modd_map.containsKey(varmap.get(opf.Opportunity__r.Contact__c))){
                            opf.Rot_Visa_Module_D__c=modd_map.get(varmap.get(opf.Opportunity__r.Contact__c));
                            temp=true;
                        }
                    }
                    if(varmap1.get(opf.Opportunity__r.Contact__c)=='Mod E'){
                        if(mode_map.containsKey(varmap.get(opf.Opportunity__r.Contact__c))){
                            opf.Rot_Visa_Module_E__c=mode_map.get(varmap.get(opf.Opportunity__r.Contact__c));
                            temp=true;
                        }
                    }
                }
                if(!hous_map.isEmpty() && hous_map.containsKey(opf.id)){
                    for(Rotation__c rtl:hous_map.get(opf.id)){
                        if(rtl.Student__c==opf.Opportunity__r.Contact__c){
                            if(rtl.Rot_Housing_Module_D__c!=null)
                            {    opf.Rot_Housing_Module_D__c=rtl.Rot_Housing_Module_D__c!='I do not want Housing'?rtl.Rot_Housing_Module_D__c:'';
                             temp=true;
                            }
                            if(rtl.Rot_Housing_Module_E__c!=null)
                            {   opf.Rot_Housing_Module_E__c=rtl.Rot_Housing_Module_E__c!='I do not want Housing'?rtl.Rot_Housing_Module_E__c:'';
                                temp=true;
                            }
                        }
                    }
                }
                //Clear Finance Housing section when Campus Changed 
                if(!campus_map.isEmpty() && campus_map.containsKey(opf.id)){
                    for(Rotation__c rtl:campus_map.get(opf.id)){
                        if(rtl.Student__c==opf.Opportunity__r.Contact__c){
                            if(rtl.Type__c=='Mod D'){
                                opf.Rot_Housing_Module_D__c='';
                                opf.Rot_Visa_Module_D__c='';
                                temp=true;
                            }
                            else if(rtl.Type__c=='Mod E'){
                                opf.Rot_Housing_Module_E__c='';
                                opf.Rot_Visa_Module_E__c='';
                                temp=true;
                            }
                            else if(rtl.Type__c=='Mod D & E'){
                                opf.Rot_Housing_Module_D__c='';
                                opf.Rot_Visa_Module_D__c='';
                                opf.Rot_Housing_Module_E__c='';
                                opf.Rot_Visa_Module_E__c='';
                                temp=true;
                            }
                        }
                    }
                }
                if(temp)
                    updtfin.add(opf);
            }
            if(!updtfin.ISEmpty())    
                Update updtfin;
            }
            Catch(Exception e){System.Debug(e);}
        }
        
    }
}