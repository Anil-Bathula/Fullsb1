/*
    Trigger   : Contact_Duplicate_Email_Checker
    Events    : Before Insert and Update on Opportunity  
    Developer : Anil.B
    Date      : 13/8/2013
    Comment   : This trigger checks If the Applicant Email or Email already exist in another Lead/Contact and prevents duplicates.
                Assigns Contact Applicant Email to Email if Email is empty.     
    Test Class: Contact_Duplicate_Email_Checker_Test(85%)   
    Modified By:Anil.B 24/02/2015 added recordtype id in if conditions
*/    


trigger Contact_Duplicate_Email_Checker on Contact(before insert, before update) {
    Map<String, Contact> ConMap= new Map<String, Contact>();
    id Parent_rectype=RecordTypeHelper.getRecordTypeId('Contact','Parent');
    id Refree_rectype=RecordTypeHelper.getRecordTypeId('Contact','Referee');
    Set<id>ids=new set<id>();
    for(Contact c:Trigger.new)
    {
        string cemail;      
        if(c.Email!=null && c.RecordTypeid!=Parent_rectype && c.RecordTypeid!=Refree_rectype && (Trigger.isInsert || (Trigger.isUpdate && Trigger.oldMap.get(c.Id).Email!=c.Email)))
        {
            if (ConMap.containsKey(c.Email)) 
            {
                c.Email.addError('Duplicate value on record,Contact');
            } 
            else 
            {
               cemail=c.Email.toLowerCase();
            }
        }
        if(c.Applicant_Email__c!=null && c.RecordTypeid!=Parent_rectype && c.RecordTypeid!=Refree_rectype && (Trigger.isInsert || (Trigger.isUpdate && Trigger.oldMap.get(c.Id).Applicant_Email__c!=c.Applicant_Email__c)))
        {
            if (ConMap.containsKey(c.Applicant_Email__c)) 
            {
                c.Applicant_Email__c.addError('Duplicate value on record,Lead');
            } 
            else 
            {
                cemail=c.Applicant_Email__c.toLowerCase();
            }
        }
        if(c.Applicant_Email__c!=null && c.Email==null)
        {
            c.Email=c.Applicant_Email__c;
        }
        if(cemail!=null)
        {
            ConMap.put(cemail, c);
            ids.add(c.id);
            
        }
    }
    if(!ConMap.ISEmpty())
    {
        List<Contact> cons=[select id,Name,Email,Program_Primary__c,Program_Primary__r.Name,Applicant_Email__c,Account.name,Start_Term__c,LeadSource,Phone,MobilePhone,
                            Region__c from Contact where (Email IN:Conmap.Keyset() or Applicant_Email__c IN:Conmap.keyset()) ];
        if(!cons.ISEmpty())
        {
            for(Contact cs:cons)
            {
                string email;
                Try{
                    if(ConMap.ContainsKey(cs.Email.toLowerCase()) && cs.Id!=conMap.get(cs.Email.toLowerCase()).Id)
                    {
                        email=cs.Email.toLowerCase();
                    }
                }Catch(Exception e){
                    System.debug('An exception occurred: ' + e.getMessage());
                }
                try{
                    if(ConMap.ContainsKey(cs.Applicant_Email__c.toLowerCase()) && cs.Id!=ConMap.get(cs.Applicant_Email__c.toLowerCase()).Id)
                    {
                        email=cs.Applicant_Email__c.toLowerCase();
                    }
                }catch (Exception e){
                    System.debug('An exception occurred: ' + e.getMessage());
                }
                if(email!=null)
                {
                    Contact newcon=ConMap.get(email);
                    newcon.addError('Duplicate value on record '+','+cs.ID+','+cs.Program_Primary__r.Name+','+cs.LeadSource+','+cs.Start_Term__c+','+cs.Phone+','+cs.MobilePhone+','+cs.Region__c);
                }
            }
        }
        List<Lead> lds=[select Id, LeadSource,Phone,MobilePhone, Program_Primary__r.Name, Start_Term__c, Region__c, Email, Applicant_Email__c,
                            Lead_Stage__c,isconverted,ConvertedContactid from Lead where (Email IN:Conmap.Keyset() or Applicant_Email__c IN:Conmap.keyset()) AND Isconverted=False AND ConvertedContactId NOT In:ids];
        if(!lds.ISEmpty())
        {
            for(lead l:lds)
            {
                System.debug('====>'+l.isconverted);
                string email;
                Try{
                    if(l.Email!=null && ConMap.ContainsKey(l.Email.toLowerCase()))
                    {
                        email=l.Email.toLowerCase();
                    }
                }Catch(Exception e){
                    System.debug('An exception occurred: ' + e.getMessage());
                }
                Try{
                    if(l.Applicant_Email__c!=null && ConMap.ContainsKey(l.Applicant_Email__c.toLowerCase()))
                    {
                        email=l.Applicant_Email__c.toLowerCase();
                    }
                }Catch(Exception e){
                    System.debug('An exception occurred: ' + e.getMessage());
                }
                if(email!=null)
                {
                    Contact newcon=ConMap.get(email);
                    newcon.addError('Duplicate value on record '+','+l.ID+','+l.Program_Primary__r.Name+','+l.LeadSource+','+l.Start_Term__c+','+l.Phone+','+l.MobilePhone+','+l.Region__c+','+l.Lead_Stage__c+', Lead');
                }
            }
        }
    }
}