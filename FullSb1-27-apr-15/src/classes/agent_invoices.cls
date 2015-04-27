/*
    Developer : Premanath Reddy
    Date      : 3/4/2015                
    purpose   : To generate the Agent Invioce Page
              
    Test class: 
    coverage  : 
*/
public class agent_invoices {

    public String selctd_yr{ get; set; }
    Public List<Opportunity> opp{get;set;}
    Public Account acc{get;set;}
    Public String curr_id{get;set;}
    public List<commission_cls> comm_lst{get;set;}
    public commission_cls commcls{get;set;}
    public List<Agent_Invoice__c> invioce{get;set;}
    Public List<Attachment> attch_doc{get;set;}
    public List<invioce_cls> inv_lst{get;set;}
    public invioce_cls invcls{get;set;}
    public Decimal comm_total{get;set;}
    public Decimal inv_total{get;set;}
    public String comm_total2{get;set;}
    public String inv_total2{get;set;}
    public String ispdf{get;set;}
    public boolean isVF{get;set;}
    public boolean buttons{get;set;}
    
    Public agent_invoices(){
        ispdf=null;
        isvf=false;
        buttons=true;
        curr_id=Apexpages.currentPage().getParameters().get('Id');
        if(curr_id!=null){
            acc=[Select id,Name from Account where id=:curr_id];
        }
        if(Apexpages.Currentpage().getParameters().get('type')=='pdf'){
            ispdf='pdf';
            isvf=false;
            selctd_yr =Apexpages.Currentpage().getParameters().get('year');
            commission_method();
        }
        else{
            ispdf=null;
            isvf=true;
        }
    }
    // Year pick list
    public List<SelectOption> getyears(){
        List<SelectOption> options= new List<SelectOption>();
        options.add(new SelectOption('','-None-'));
        options.add(new SelectOption('2014','2014'));
        options.add(new SelectOption('2015','2015'));
        options.add(new SelectOption('2016','2016'));
        options.add(new SelectOption('2017','2017'));
        options.add(new SelectOption('2018','2018'));
        options.add(new SelectOption('2019','2019'));
        options.add(new SelectOption('2020','2020'));
        return options;
    }
    
    public void commission_method() {
        comm_lst=new List<commission_cls>();
        inv_lst=new List<invioce_cls>();
        Set<String> scurrencycode=new Set<String>();
        if(curr_id!=null){
            
            Map<String,Decimal> currncy_map=new Map<String,Decimal>();
            List<DatedConversionRate> Dcr=[select IsoCode,ConversionRate From DatedConversionRate where StartDate<=THIS_WEEK];
            for(DatedConversionRate d:dcr){
                currncy_map.put(d.IsoCode,d.ConversionRate);
            }
            
            comm_total=0;
            inv_total=0;
            //for Opportunities (Partner) Commission Section
            opp=[Select id,Name,Partner__c,Commission_Type__c,Commission__c,Commission_Amount__c,Start_Year__c,Stagename,Matriculated__c
                    ,CurrencyIsoCode,Program__c,Program__r.Name
                    ,(Select id,Opportunity__c,BBA_Net_Tuition_Fee__c,Net_Tuition_Fee__c,CurrencyIsoCode from Opportunity_Finances__r)
                    from Opportunity where Partner__c=:curr_id and Start_Year__c=:selctd_yr and Stagename='Confirmed' and Matriculated__c=true];
            
            for(Opportunity op:opp){
                
                Opportunity_Finance__c fin = op.Opportunity_Finances__r.size()>0?op.Opportunity_Finances__r[0]:new Opportunity_Finance__c();
                Decimal temp;
                Decimal conv_curr=0;
                commcls=new commission_cls();
                commcls.oppid=op.id;
                commcls.oppname=op.Name;
                commcls.type=op.Commission_Type__c;
                                
                if(op.Commission_Type__c=='Commission' && op.Opportunity_Finances__r.size()>0){
                    commcls.amount=op.CurrencyIsoCode+' '+op.Commission__c+'%';
                    if(op.Program__r.Name.startsWith('Bachelor')){
                        conv_curr=(op.Commission__c*fin.BBA_Net_Tuition_Fee__c)/(100*currncy_map.get(op.CurrencyIsoCode));
                        commcls.netamount= fin.CurrencyIsoCode +' '+fin.BBA_Net_Tuition_Fee__c;
                    }
                    else{
                        conv_curr=(op.Commission__c*fin.Net_Tuition_Fee__c)/(100*currncy_map.get(op.CurrencyIsoCode));
                        commcls.netamount= fin.CurrencyIsoCode +' '+fin.Net_Tuition_Fee__c;
                    }
                    
                    commcls.conv_amount='USD '+conv_curr.setScale(2);
                }
                else if(op.Commission_Type__c=='Retention' || op.Commission_Type__c=='Referral'){
                    commcls.amount=op.CurrencyIsoCode+' '+op.Commission_Amount__c;
                    conv_curr=op.Commission_Amount__c/currncy_map.get(op.CurrencyIsoCode);
                    commcls.conv_amount='USD '+conv_curr.setScale(2);
                }
                    
                comm_lst.add(new commission_cls(commcls.oppid
                                                ,commcls.oppname
                                                ,commcls.type
                                                ,commcls.amount
                                                ,commcls.netamount
                                                ,commcls.conv_amount));
                comm_total=comm_total+conv_curr.setScale(2);
                comm_total2='USD '+comm_total;
            }
            
            //For invioce Marketing Section 
            invioce=[Select id,Name,Partner__c,Amount__c,Start_Year__c,Sub_Type__c,Type__c,CurrencyIsoCode
                        ,(select id,description,name from attachments)
                        from Agent_Invoice__c where Partner__c=:curr_id and Start_Year__c=:selctd_yr];
            for(Agent_Invoice__c inv:invioce){
                Decimal conv_curr=0;
                invcls=new invioce_cls();
                invcls.accid=inv.Partner__c;
                invcls.subtype=inv.Sub_Type__c;
                invcls.type=inv.Type__c;
                invcls.amount=inv.CurrencyIsoCode+' '+inv.Amount__c;
                invcls.attch=inv.attachments;
                conv_curr=inv.Amount__c/currncy_map.get(inv.CurrencyIsoCode);
                invcls.conv_amount='USD '+conv_curr.setScale(2);
                
                if(inv.Sub_Type__c=='Pre-paid commission'){
                    invcls.amount=inv.CurrencyIsoCode+' -'+inv.Amount__c;
                    invcls.conv_amount='USD -'+conv_curr.setScale(2);
                    comm_lst.add(new commission_cls(invcls.accid
                                                    ,invcls.subtype
                                                    ,invcls.type
                                                    ,invcls.amount
                                                    ,null
                                                    ,invcls.conv_amount));
                    comm_total=comm_total-conv_curr.setScale(2);
                    comm_total2='USD '+comm_total;
                }
                else{
                    inv_lst.add(new invioce_cls(invcls.accid
                                            ,invcls.subtype
                                            ,invcls.type
                                            ,invcls.amount
                                            ,invcls.conv_amount
                                            ,invcls.attch));
                    inv_total=inv_total+conv_curr.setScale(2);
                    inv_total2='USD '+inv_total;
                }
                
            }
        }
    }
    public void donothing()
    {    
    }
    public class invioce_cls{
        public String accid{get;set;}
        public String subtype{get;set;}
        public String type{get;set;}
        public String amount{get;set;}
        public String conv_amount{get;set;}
        Public List<Attachment> attch{get;set;}
        public invioce_cls(Id Id
                        ,String name
                        ,String type
                        ,String amount,String conv_amount,List<Attachment> attch)
        {
            this.accid=id;
            this.subtype=name;
            this.type=type;
            this.amount=amount;
            this.conv_amount=conv_amount;
            this.attch=attch;
        }
        public invioce_cls(){}
    }
    
    public class commission_cls{
        public String oppid{get;set;}
        public String oppname{get;set;}
        public String type{get;set;}
        public String amount{get;set;}
        public String netamount{get;set;}
        public String conv_amount{get;set;}
        public commission_cls(Id Id
                        ,String name
                        ,String type
                        ,String amount
                        ,String netamount
                        ,String conv_amount)
        {
            this.oppid=id;
            this.oppname=name;
            this.type=type;
            this.amount=amount;
            this.netamount=netamount;
            this.conv_amount=conv_amount;
        }
        public commission_cls(){}
    }
}