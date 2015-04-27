public class GoEd_offerletter {

    public String usr_email { get; set; }
    String curr_id;
    public GoEd__c goed{get;set;}
    public boolean disp_block{get;set;}
    public String curr_date{get;set;}
    public String goed_amt{get;set;}
    public String ispdf{get;set;}
    public boolean displayPopup{get;set;}
    public GoEd_offerletter(){
        ispdf=null;
        displayPopup=true;
        disp_block=false;
        if(Apexpages.Currentpage().getParameters().get('type')=='pdf')
        {
            ispdf='pdf';
            disp_block=true;
            displayPopup = false;
        }
        curr_id=Apexpages.Currentpage().getParameters().get('id');
        DateTime d = datetime.now();
        string monthname= d.format('MMMMM');
        string day = String.valueOf(d.day());
        if (day.endsWith('1'))
        {
            if(day.StartsWith('1') && day != '1') 
                day=day+'th';
            else 
                day=day+'st';
        }
        else if (day.endsWith('2'))
        {
            if(day.StartsWith('1') && day != '1') 
                day=day+'th';
            else 
                day=day+'nd';
        }
        else if (day.endsWith('3'))
        {
            if(day.StartsWith('1') && day != '1') 
                day=day+'th';
            else 
                day=day+'rd';
        }
        else 
            day=day+'th';
        
        curr_date=monthname+' '+day+', '+d.Year();
        if(curr_id==null){
            disp_block=false;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please provide GoEd ID!');
            ApexPages.addMessage(myMsg);
        }
        else{
            try{
                goed=[Select id,Finance__c,Finance__r.GoEd_Financing_Status__c,Finance__r.BBA_GoEd_Loan_Year_1__c,CurrencyIsoCode,Finance__r.BBA_GoEd_Loan_Year_2__c
                    ,Finance__r.Opportunity__r.contact__r.Name,Finance__r.BBA_GoEd_Loan_Year_3__c,Finance__r.BBA_GoEd_Loan_Year_4__c
                    ,Finance__r.Opportunity__r.Program__r.Country__r.Name,Finance__r.Application_Fee__c,Finance__r.Start_Term__c,Finance__r.CurrencyIsoCode
                    ,Finance__r.Go_Ed_Loan_Amount_USD__c,Finance__r.Go_Ed_Loan_Amount__c
                    from GoEd__c where id=:curr_id];
                if(goed.Finance__r.Go_Ed_Loan_Amount__c>0 && goed.Finance__r.GoEd_Financing_Status__c!=null && goed.Finance__r.GoEd_Financing_Status__c!='Not Started'){    
                    //disp_block=true;
                    if(goed.Finance__r.Opportunity__r.Program__r.Country__r.Name=='United Kingdom'){
                        goed_amt=goed.Finance__r.CurrencyIsoCode+' '+String.valueOf(goed.Finance__r.Go_Ed_Loan_Amount__c);
                    }
                    else if(goed.Finance__r.Opportunity__r.Program__r.Country__r.Name=='United States' 
                            || goed.Finance__r.Opportunity__r.Program__r.Country__r.Name=='United Arab Emirates'
                            || goed.Finance__r.Opportunity__r.Program__r.Country__r.Name=='China'){
                        goed_amt='USD '+String.valueOf(goed.Finance__r.Go_Ed_Loan_Amount_USD__c);
                    }
                }
                else{
                    disp_block=false;
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Page cannot be displayed!');
                    ApexPages.addMessage(myMsg);
                }
            }Catch(Exception e){
                disp_block=false;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Page cannot be displayed!');
                ApexPages.addMessage(myMsg);
            }
        }
    }
    
    public void closePopup() {
        displayPopup = false;
        disp_block=false;
    } 
    
    public PageReference submit() {
        PageReference pageref=new PageReference('/apex/GoEd_offerletter?id=' +curr_id+'&type=pdf&email='+usr_email);
        pageref.setRedirect(true);
        return pageref; 
    }
    
    
    
    
    
    
    
    
    

}