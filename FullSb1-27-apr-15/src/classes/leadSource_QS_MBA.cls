/**********************************************
Class:leadSource_QS_MBA(GMASS SCORING)
Developer:Anil.B
Purpose: This class is to calculate gmass score
and send back the values to lead scoring trigger on lead object
***********************************************/


public class leadSource_QS_MBA{

     public class  lead_score_respone{ 
         public Decimal QS_MBA_probx{get;set;}  
         public Decimal GMASS_MBA_probx{get;set;}
         public Decimal GMASS_MBA_Total{get;set;}
         public String  GMASS_lead_score{get;set;}
          
     }      
   
    
/*********************GMASS_MODEL********************************************/

    public lead_score_respone gmass_Model(String Worldregion,String country
                                        ,String degreeobjective,String workload,string regions,Integer worldregionid,String Region){
        /****This is return value for Worldregion*****/ 
        String region_val=(region==null||region=='')?'':((region.trim()==''||region.trim()==null)?'':region.trim().toLowerCase());
        String regionname=(Worldregion==null||Worldregion=='')?'':((Worldregion.trim()==''||Worldregion.trim()==null)?'':Worldregion.trim().toLowerCase());
        Integer africa=0;
        Integer asia=0;
        Integer australia=0;
        Integer casia=0;
        Integer eeurope=0;
        Integer weurope=0;
        Integer latam =0;
        Integer middlee=0; 
        if(regionname!=NULL||regionname!=''){
            if(regionname=='africa'){
                africa=1;
            }
            else if(regionname=='asia'){
                asia=1;
            }
            else if(regionname=='australia and the pacific islands'){
                australia=1;
            }
            else if(regionname=='central asia'){
                casia=1;
            } 
            else if(regionname=='europe, eastern'){
                eeurope=1;
            }
            else if(regionname=='europe, western'){
                weurope=1;
            } 
            else if(regionname=='mexico, the caribbean, and latin america'){
                latam=1;
            }
            else if(regionname=='middle east'){
                middlee=1;
            }
        }  
        
        /****This is return value for WorldRegion ID*****/
       Integer regionID=(Worldregionid!=null)?Worldregionid:22;
       
        /****This is return value for Contry*****/ 
        String ctryname=(country==null||country=='')?'':((country.trim()==''||country.trim()==null)?'':country.trim().toLowerCase());
        Integer nigeria=0;
        Integer china=0;
        if(ctryname!=NULL||ctryname!=''){
            if(ctryname=='nigeria'){
                nigeria=1;
            }
            else if(ctryname=='china'){
                china=1;
            }
        }  
        
        /****This is return value for degreeobjective*****/ 
        String degreeobj=(degreeobjective==null||degreeobjective=='')?'':((degreeobjective.trim()==''||degreeobjective.trim()==null)?'':degreeobjective.trim().toLowerCase());
        Integer objmba=0;
        Integer objmabus=0;
        if(degreeobj!=NULL||degreeobj!=''){
            if(degreeobj=='master\'s in business administration (mba)'){
                objmba=1;
            }
            if(degreeobj=='master\'s in business (ms, msc, ma)'){
                objmabus=1;
            }
        }  
        
        /****This is return value for Work load*****/ 
        String wrklodtime=(workload==null||workload=='')?'':((workload.trim()==''||workload.trim()==null)?'':workload.trim().toLowerCase());
        Integer fulltime=0;
        Integer parttime=0;
        if(wrklodtime!=NULL||wrklodtime!='' ){
            if(wrklodtime=='full-time student'){
                fulltime=1;
            }
            if(wrklodtime=='part-time student'){
                parttime=1;
            }
        }                                
        list<String> regvals=new list<String>();
        if(regions!=null)
            regvals= regions.split('\\;');
        system.debug(regvals.size());    
        String regionval1=(regvals!=null && !regvals.isempty() && regvals.size()>=1)?((regvals[0]==null||regvals[0]=='')?'':((regvals[0].trim()==''||regvals[0].trim()==null)?'':regvals[0].trim().toLowerCase())):''; 
        String regionval2=(regvals!=null && !regvals.isempty() && regvals.size()>=2)?((regvals[1]==null||regvals[1]=='')?'':((regvals[1].trim()==''||regvals[1].trim()==null)?'':regvals[1].trim().toLowerCase())):'';
        String regionval3=(regvals!=null && !regvals.isempty() && regvals.size()>=3)?((regvals[2]==null||regvals[2]=='')?'':((regvals[2].trim()==''||regvals[2].trim()==null)?'':regvals[2].trim().toLowerCase())):'';
        String regionval4=(regvals!=null && !regvals.isempty() && regvals.size()>=4)?((regvals[3]==null||regvals[3]=='')?'':((regvals[3].trim()==''||regvals[3].trim()==null)?'':regvals[3].trim().toLowerCase())):'';
        String regionval5=(regvals!=null && !regvals.isempty() && regvals.size()>=5)?((regvals[4]==null||regvals[4]=='')?'':((regvals[4].trim()==''||regvals[4].trim()==null)?'':regvals[4].trim().toLowerCase())):'';
        String regionval6=(regvals!=null && !regvals.isempty() && regvals.size()>=6)?((regvals[5]==null||regvals[5]=='')?'':((regvals[5].trim()==''||regvals[5].trim()==null)?'':regvals[5].trim().toLowerCase())):'';
        /*String regionval1=(regionvalue1==null||regionvalue1=='')?'':((regionvalue1.trim()==''||regionvalue1.trim()==null)?'':regionvalue1.trim().toLowerCase());
        String regionval2=(regionvalue2==null||regionvalue2=='')?'':((regionvalue2.trim()==''||regionvalue2.trim()==null)?'':regionvalue2.trim().toLowerCase());
        String regionval3=(regionvalue3==null||regionvalue3=='')?'':((regionvalue3.trim()==''||regionvalue3.trim()==null)?'':regionvalue3.trim().toLowerCase());
        String regionval4=(regionvalue4==null||regionvalue4=='')?'':((regionvalue4.trim()==''||regionvalue4.trim()==null)?'':regionvalue4.trim().toLowerCase());
        String regionval5=(regionvalue5==null||regionvalue5=='')?'':((regionvalue5.trim()==''||regionvalue5.trim()==null)?'':regionvalue5.trim().toLowerCase());
        String regionval6=(regionvalue6==null||regionvalue6=='')?'':((regionvalue6.trim()==''||regionvalue6.trim()==null)?'':regionvalue6.trim().toLowerCase());*/
        
        Map<String,Integer> regionvalmap=new Map<String,Integer>{'united states'=>8,'...northeast (ct, ma, me, nh, nj, ny, ri, vt)'=>8
                                                        ,'...southwest (az, co, nm, ok, tx)'=>8,'undecided'=>0
                                                        ,'...midwest (ia, il, in, ks, mi, mn, mo, nd, ne, oh, sd, wi)'=>8
                                                        ,'...middle atlantic (dc, de, md, pa va, wv)'=>8
                                                        ,'...west (ak, ca, hi, id, mt, nv, or ut, wa, wy)'=>8,'...south (al, ar, fl, ga, ky, la, ms, nc, sc, tn)'=>8
                                                        ,'europe, western'=>9,'asia'=>2,'australia and the pacific islands'=>3
                                                        ,'canada'=>8,'...undecided (us)'=>8,'middle east'=>7,'europe, eastern'=>5
                                                        ,'africa'=>1,'mexico, the caribbean, and latin america'=>6
                                                        ,'central asia'=>4};
        Integer regmatch1=0;
        Integer regmatch2=0;
        Integer regmatch3=0;
        Integer regmatch4=0;
        Integer regmatch5=0;
        Integer regmatch6=0;
        if(regionvalmap.containsKey(regionval1) && regionvalmap.get(regionval1)==regionID){
            regmatch1=1;
        }
        if(regionvalmap.containsKey(regionval2) && regionvalmap.get(regionval2)==regionID){
            regmatch2=1;
        }
        if(regionvalmap.containsKey(regionval3) && regionvalmap.get(regionval3)==regionID){
            regmatch3=1;
        }
        if(regionvalmap.containsKey(regionval4) && regionvalmap.get(regionval4)==regionID){
            regmatch4=1;
        }
        if(regionvalmap.containsKey(regionval5) && regionvalmap.get(regionval5)==regionID){
            regmatch5=1;
        }
        if(regionvalmap.containsKey(regionval6) && regionvalmap.get(regionval6)==regionID){
            regmatch6=1;
        }
        
        Integer regmatchsum= regmatch1+regmatch2+regmatch3+regmatch4+regmatch5+regmatch6;
        
        
        Integer reg1exist = 1;
        Integer reg2exist = 1;
        Integer reg3exist = 1;
        Integer reg4exist = 1;
        Integer reg5exist = 1;
        Integer reg6exist = 1;
        if(regionval1=='undecided'||regionval1==''||regionval1==NULL){
            reg1exist =0;
        }
        if(regionval2=='undecided'||regionval2==''||regionval2==NULL){
            reg2exist =0;
        }
        if(regionval3=='undecided'||regionval3==''||regionval3==NULL){
            reg3exist =0;
        }
        if(regionval4=='undecided'||regionval4==''||regionval4==NULL){
            reg4exist =0;
        }
        if(regionval5=='undecided'||regionval5==''||regionval5==NULL){
            reg5exist =0;
        }
        if(regionval6=='undecided'||regionval6==''||regionval6==NULL){
            reg6exist =0;
        }
        
        Double regionsum =reg1exist+reg2exist+reg3exist+reg4exist+reg5exist+reg6exist;
        
        Decimal regmatchproport =99; 
        try{
             regmatchproport =regmatchsum/regionsum;
           System.debug('==regmatchproport==>'+regmatchproport+'<==>'+regmatchsum+'<==>'+regionsum);
        }catch (exception e){
             System.debug('An Error occurred : ' + e.getMessage());
        }
        
        
        Integer regproportcat;
        if(regmatchproport == 99){
            regproportcat=1;
        }else if(regmatchproport == 1){
            regproportcat=2;
        }
        else if(regmatchproport==0){
            regproportcat=3;
        }
        else if(regmatchproport>0 && regmatchproport<1){
            regproportcat=4;
        }
        
        Integer nomatch = 0;
        if (regproportcat == 3){
            nomatch = 1;
        }
        
        Integer allmatch=0;
        if (regproportcat == 2){
            allmatch = 1;
        }
        
        Decimal x=(1.152 * africa)+
                   (0.3386 * asia)+ 
                   (-0.5195 * australia) + 
                   (-0.1094 * casia) + 
                   (1.138 * eeurope) + 
                   (1.318 * weurope)+ 
                   (1.543 * latam) + 
                   (1.188 * middlee) +
                   (-1.321 * china) + 
                   (0.4442 * nigeria) + 
                   (0.354 * objmba) + 
                   (0.5678 * objmabus) + 
                   (0.4619 * fulltime) + 
                   (-1.403 * parttime) + 
                   (-0.8426 * allmatch) + 
                   (0.2081 * nomatch) + 
                   (-5.591) ;

        Decimal probx=(1/(1+Math.exp(-x)));
        
             list<Decimal> africa_val=new list<Decimal>{0.03184,0.01967,0.01256,0.00931,0.00688,0.00493,0.00352,0.00235,0.00149,0};
             list<Decimal> asia_val=new list<Decimal>{0.00931,0.00508,0.00321,0.00212,0.00147,0.00129,0.00072,0.00047,0.00026,0};
             list<Decimal> lat_am_val=new list<Decimal>{0.02875,0.01471,0.00895,0.00551,0.00352,0.00231,0.00158,0.00091,0.00044,0};
             List<Decimal> lon_eur_val=new list<Decimal>{0.02694,0.01736,0.01375,0.00986,0.00658,0.00498,0.00316,0.00217,0.00144,0};
             List<Decimal> luz_eur_val=new list<Decimal>{0.02062,0.01376,0.01078,0.0078,0.00571,0.00415,0.00297,0.00199,0.00144,0};
             List<Decimal> middle_east_val=new list<Decimal>{0.01859,0.01256,0.01051,0.00753,0.00518,0.00336,0.0021,0.00158,0.00099,0};
             List<Decimal> north_am_val=new list<Decimal>{0.00589,0.00372,0.00255,0.00188,0.00104,0.00056,0.00053,0.00044,0.00028,0};
             List<Decimal> south_asia_val=new list<Decimal>{0.01067,0.00923,0.00728,0.00584,0.0041,0.00333,0.00208,0.00106,0.00077,0};
             Map<String,list<Decimal>> Region_list=new Map<String,list<Decimal>>{'africa'=>africa_val,'asia'=>asia_val,'lat am'=>lat_am_val,'lon eur'=>lon_eur_val,
                                                                            'luz eur'=>luz_eur_val,'middle east'=>middle_east_val,'north am'=>north_am_val,
                                                                            'north am sfo'=>north_am_val,'north am bos'=>north_am_val,'south asia'=>south_asia_val};
        
           lead_score_respone lp=new lead_score_respone();
           lp.GMASS_MBA_probx=probx*100;
          // lp.GMASS_MBA_Total=x;
           
           if(probx>0.01375){
               lp.GMASS_MBA_Total=1;
           }else if(probx>0.00837){
               lp.GMASS_MBA_Total=2;
           }else if(probx>0.00528){
               lp.GMASS_MBA_Total=3;
           }else if(probx>0.00362){
               lp.GMASS_MBA_Total=4;
           }else if(probx>0.00245){
               lp.GMASS_MBA_Total=5;
           }else if(probx>0.00159){
               lp.GMASS_MBA_Total=6;
           }else if(probx>0.001){
               lp.GMASS_MBA_Total=7;
           }else if(probx>0.00056){
               lp.GMASS_MBA_Total=8;
           }else if(probx>0.00037){
               lp.GMASS_MBA_Total=9;
           }else{
               lp.GMASS_MBA_Total=10;
           }
       
        
           map<Integer,string>lead_score = new map<Integer,string>{0=>'A',1=>'B',2=>'C',3=>'D',4=>'E',5=>'F',6=>'G',7=>'H',8=>'I',9=>'J'};
           
            if(Region_list.containsKey(region_val)){
               integer i=0;
               for(Decimal D:region_list.get(region_val)){
                   if(probx>d){
                      lp.GMASS_Lead_score=lead_score.containskey(i)?lead_score.get(i):'';
                      break; 
                   }i++;                   
               }            
            }
            
        System.debug('=====================(1.152 *'+africa+')+(0.3386 * '+asia+')+ (-0.5195 * '+australia+')+(-0.1094 * '+casia+')+ (1.138 * '+eeurope+')+(1.318 * '+weurope+')+(1.543 * '+latam+') +(1.188 * '+middlee+') +(-1.321 * '+china+') + (0.4442 * '+nigeria+') +(0.354 * '+objmba+') +(0.5678 * '+objmabus+') +(0.4619 * '+fulltime+') +(-1.403 * '+parttime+') + (-0.8426 * '+allmatch+') + (0.2081 * '+nomatch+') +(-5.591)');
        
        System.debug('=====================***regionsum->'+regionsum);
        System.debug('=======================***regmatchsum->'+regmatchsum);
        System.debug('======================***regmatchproport ->'+regmatchproport);
        System.debug('===================***x->'+x);
        System.debug('=====================***probx->'+probx);      
        System.debug('================='+lp.GMASS_MBA_probx);
         
       return lp;   
        
    }   
    
    
}