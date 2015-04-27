/*
Test Class  :: Rotation2documentstest(100%)
Last Modified:: Prem(7/4/2015) - SFSUP-1018*/
trigger Rotation_selfupdates on Rotation__c (Before insert,Before Update) 
{
    for(Rotation__c rot:Trigger.New)
    {
        String name=rot.Name__c+' : '+rot.Type__c+' : '+rot.Rotation_Campus__c;
        rot.Name=name.length()>=80?name.substring(0,80):name;
        
        //Clear Housing section when Campus Changed 
        Rotation__c oldrot=Trigger.isInsert?new Rotation__c():Trigger.oldMap.get(rot.Id);
        if(oldrot.Rotation_Campus__c!=rot.Rotation_Campus__c && Trigger.isupdate){
            if(rot.Type__c=='Mod D'){
                rot.Rot_Housing_Module_D__c='';
                rot.Backup_Rot_Housing_Module_D__c='';
            }
            else if(rot.Type__c=='Mod E'){
                rot.Rot_Housing_Module_E__c='';
                rot.Backup_Rot_Housing_Module_E__c='';
            }
            else if(rot.Type__c=='Mod D & E'){
                rot.Rot_Housing_Module_D__c='';
                rot.Backup_Rot_Housing_Module_D__c='';
                rot.Rot_Housing_Module_E__c='';
                rot.Backup_Rot_Housing_Module_E__c='';
            }
        }    
    }
    
}