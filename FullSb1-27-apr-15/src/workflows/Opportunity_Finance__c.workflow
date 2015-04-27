<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Aler Recruiter Hult Fin Aid%2BMerit %25 of Tuition Exceeds 50%25</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>unfiled$public/Hult_Fin_Aid_Merit_of_Tuition_above_50_Alert_Template</template>
    </alerts>
    <alerts>
        <fullName>Final Steps Hult Lodge</fullName>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <template>Accommodation_Stage_Templates/Hult_Lodge</template>
    </alerts>
    <alerts>
        <fullName>Final Steps Hult Tower</fullName>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <template>Accommodation_Stage_Templates/Hult_Tower_Studios</template>
    </alerts>
    <alerts>
        <fullName>GoED Loan Applicant with Campus Change Alert</fullName>
        <protected>false</protected>
        <recipients>
            <recipient>elias.abrahamsson@ef.com.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>siddharth.raturi@goed.com.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>thomas.holmberg@goed.com.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <template>unfiled$public/GoEd_Loan_Status_Confirmed_Campus_Change</template>
    </alerts>
    <alerts>
        <fullName>GoEd Loan Status</fullName>
        <protected>false</protected>
        <recipients>
            <recipient>elias.abrahamsson@ef.com.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>siddharth.raturi@goed.com.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>thomas.holmberg@goed.com.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <template>Hult_Email_Templates/GoEd_Loan_Status</template>
    </alerts>
    <alerts>
        <fullName>Shanghai Housing Notification</fullName>
        <ccEmails>housing.shanghai@email.hult.edu</ccEmails>
        <protected>false</protected>
        <recipients>
            <recipient>lucia.song@hult.edu.fullsb1</recipient>
            <type>user</type>
        </recipients>
        <template>Hult_Email_Templates/Shanghai_Housing_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>BBA Inherit - Accom Fee Yr1</fullName>
        <field>BBA_Accommodation_Fee_Year_1__c</field>
        <formula>Annual_Accommodation_Fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Adjustment Amount</fullName>
        <field>BBA_Adjustment_Amount_Year_1_BBA__c</field>
        <formula>Adjustment_Amount__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Adjustment Amount Yr1</fullName>
        <field>BBA_Adjustment_Amount_Year_1_BBA__c</field>
        <formula>Adjustment_Amount__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Dean Scholarship Yr1</fullName>
        <field>BBA_Dean_Financial_Aid_Year_1__c</field>
        <formula>Dean_Scholarship_Amount__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Hult Financial Aid Yr1</fullName>
        <field>BBA_Financial_Aid__c</field>
        <formula>Hult_Financial_Aid__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Installment Plan Fee Yr1</fullName>
        <field>BBA_Installment_Plan_Year_1__c</field>
        <formula>Installment_Plan_Fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Insurance Price Yr1</fullName>
        <field>BBA_Insurance_Year_1__c</field>
        <formula>Insurance_Fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BBA Inherit - Scholarship Amount Yr1</fullName>
        <field>BBA_Merit_Based_Scholarship__c</field>
        <formula>Scholarship_Amount__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Global Head Protected FLAG</fullName>
        <field>Global_Head_Protected__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Hult India Financial Aid</fullName>
        <field>Hult_India_Financial_Aid__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment 3rd Due Date</fullName>
        <field>Payment_Due_Date_3rd__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment 4th Due Date</fullName>
        <field>Payment_Due_Date_4th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment 5th Due Date</fullName>
        <field>Payment_Due_Date_5th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment 6th Due Date</fullName>
        <field>Payment_Due_Date_6th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment 7th Due Date</fullName>
        <field>Payment_Due_Date_7th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment 8th Due Date</fullName>
        <field>Payment_Due_Date_8th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment Amount 3rd</fullName>
        <field>Payment_Amount_3rd__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment Amount 4th</fullName>
        <field>Payment_Amount_4th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment Amount 5th</fullName>
        <field>Payment_Amount_5th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment Amount 6th</fullName>
        <field>Payment_Amount_6th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment Amount 7th</fullName>
        <field>Payment_Amount_7th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Installment Amount 8th</fullName>
        <field>Payment_Amount_8th__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Visa Cost</fullName>
        <field>Dubai_Visa_Cost__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear Visa Fee in FS</fullName>
        <field>Visa_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy App Fee</fullName>
        <field>Application_Fee__c</field>
        <formula>OP_Application_Fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy Confirmation Deposit</fullName>
        <field>Confirmation_Deposit__c</field>
        <formula>OP_Confirmation_Deposit__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy Confirmation Deposit2</fullName>
        <field>Deposit_Amount_Due_FS__c</field>
        <formula>OP_Confirmation_Deposit__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy Email</fullName>
        <field>Email__c</field>
        <formula>Opportunity__r.Contact__r.Email</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy Installment Plan Fee</fullName>
        <field>Installment_Plan_Fee__c</field>
        <formula>IF( ISPICKVAL( Payment_Plan__c , &quot;Installment&quot;) , OP_Installment_Plan_Fee__c, 0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy Tuition Fee</fullName>
        <field>Tuition_Fee__c</field>
        <formula>if( contains(Program__c, &quot;EMBA&quot;), OP_Tuition_Fee__c/2, OP_Tuition_Fee__c)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINANCE%3ASet 1st Payment Paid Date</fullName>
        <field>X1st_Payment_Pd_Date__c</field>
        <formula>today()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINANCE%3ASet 2nd Payment Amount Paid</fullName>
        <field>X2nd_Payment_Amount_Paid__c</field>
        <formula>OP_2nd_Payment_Amount_Paid__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINANCE%3ASet 2nd Payment Paid Date</fullName>
        <field>X2nd_Payment_Pd_Date__c</field>
        <formula>Today()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINANCE%3ASet Deposit Paid</fullName>
        <field>Deposit_Paid__c</field>
        <formula>OP_Confirmation_Deposit_Amount_Paid__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINANCE%3ASet First Payment Amount</fullName>
        <field>X1st_Payment_Amount_Paid__c</field>
        <formula>Non_BBA_Accommodation_Deposit__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FINANCE%3AUG Housing Deposit Paid Date</fullName>
        <field>UG_Housing_Deposit_Paid_Date__c</field>
        <formula>Today()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance Copy UG Analyst Certificate</fullName>
        <field>UG_Analyst_Certificate__c</field>
        <formula>OP_UG_Analyst_Certificate__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3A Set Installment Plan Fee</fullName>
        <field>Installment_Plan_Fee__c</field>
        <formula>Fees__r.Installment_Plan_fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3A Set Insurance Type to Waived</fullName>
        <field>Insurance__c</field>
        <literalValue>Waived</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3A Set Insurance%3A Single</fullName>
        <field>Insurance_Price__c</field>
        <formula>if(Insurance_Provider__c = &quot;Erika&quot;, Fees__r.Erika_Single__c , Fees__r.AETNA_Single__c )</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3AClear</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3AClear Installment Plan Fee</fullName>
        <field>Installment_Plan_Fee__c</field>
        <formula>0</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Accomodation Fee Single</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Single_Annual__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet App ID</fullName>
        <field>App_ID__c</field>
        <formula>OP_App_ID__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Applicant Fee Paid Today</fullName>
        <field>Application_Fee_Paid_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Confirmation Payment Paid</fullName>
        <field>Deposit_Date_Paid__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Date Payment Plan Selected</fullName>
        <field>Date_Installment_Plan_Accepted__c</field>
        <formula>Today()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Deposit Amount Paid Date</fullName>
        <field>Deposit_Date_Paid__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet In%2ESingle %26 Spouse %26 2 Child</fullName>
        <field>Insurance_Price__c</field>
        <formula>if(Insurance_Provider__c = &quot;Erika&quot;,  Fees__r.ERIKA_Single_Spouse_2_Child__c , Fees__r.AETNA_Single_Spouse_2_Child__c )</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Insurance Single %26 Spouse</fullName>
        <field>Insurance_Price__c</field>
        <formula>if(Insurance_Provider__c = &quot;Erika&quot;, Fees__r.ERIKA_Single_Spouse__c ,Fees__r.AETNA_Single_Spouse__c )</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Insurance Single Plus Child</fullName>
        <field>Insurance_Price__c</field>
        <formula>if(Insurance_Provider__c = &quot;Erika&quot;, Fees__r.ERIKA_Single_Child__c ,Fees__r.AETNA_Single_child__c)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Insurance Single Plus2Child</fullName>
        <field>Insurance_Price__c</field>
        <formula>if(Insurance_Provider__c = &quot;Erika&quot;, Fees__r.ERIKA_Single_2_Child__c ,Fees__r.AETNA_Single_2_Child__c)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Insurance Single%26Spouse%26Chil</fullName>
        <field>Insurance_Price__c</field>
        <formula>if(Insurance_Provider__c = &quot;Erika&quot;, Fees__r.ERIKA_Single_Spouse_Child__c , Fees__r.AETNA_Single_Spouse_Child__c )</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Insurance Type to Single</fullName>
        <field>Insurance__c</field>
        <literalValue>Single</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet OP%3AData Lock True</fullName>
        <field>OP_TA_Data_Lock__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Partner Pgm Ins 3 mos</fullName>
        <field>Partner_Program_Insurance_Fee__c</field>
        <formula>Fees__r.Insurance_IEMBA_3m__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Partner Pgm Insurance 6mos</fullName>
        <field>Partner_Program_Insurance_Fee__c</field>
        <formula>Fees__r.Insurance_IEMBA_6m__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Payment Plan to Installment</fullName>
        <field>Payment_Plan__c</field>
        <literalValue>Installment</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Prtnr Pgm Insur Bl</fullName>
        <field>Partner_Program_Insurance_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Student Fin Info Unlock Date</fullName>
        <field>Date_Student_Fin_Info_Unlocked__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Student ID</fullName>
        <field>Student_ID__c</field>
        <formula>Opportunity__r.Contact__r.Student_ID__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet T%2FC Accept Date Today</fullName>
        <field>TC_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance%3ASet Visa Cost</fullName>
        <field>Dubai_Visa_Cost__c</field>
        <formula>CASE( Visa_Type_Picklist__c, 

&quot;Visa - Single Standard All Countries&quot;, Fees__r.Visa_Single_Standard_All_Countries__c, 

&quot;Visa - Standard Single, Spouse and Child&quot;, 
Fees__r.Visa_Standard_Single_Spouse_and_Child__c, 

&quot;Visa - Single Express 33 Countries&quot;, 
 Fees__r.Visa_Single_Express_33_Countries__c , 

&quot;Visa - Single Express Other Countries&quot;, 
 Fees__r.Visa_Single_Express_Other_Countries__c , 

&quot;Visa - Standard Single and Spouse&quot;, 
 Fees__r.Visa_Standard_Single_and_Spouse__c  , 

&quot;Visa - Standard Single Spouse &amp; 2 Child&quot;, 
 Fees__r.Visa_Standard_Single_Spouse_and_2_Chi__c , 

&quot;In country Student Visa Transfer&quot;, 
 Fees__r.In_country_Student_Visa_Transfer__c , 
0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Go Ed Loan Amount Date Stamp</fullName>
        <description>Go Ed Loan Amount Date Stamp</description>
        <field>Go_Ed_Loan_Amount_Date__c</field>
        <formula>NOW()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>I have Recieved and Attached Form E</fullName>
        <field>Recieved_and_Attached_Form_E_Date_Stamp__c</field>
        <formula>Today ()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Receieved Last Two Months Bank Stat Date</fullName>
        <field>Last_Two_Months_Bank_Statement_Rcvd_Date__c</field>
        <formula>Today ()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Receieved Last Two Months Bank Statement</fullName>
        <field>Last_Two_Mos_Bank_Statement_Rcvd_By__c</field>
        <formula>($User.FirstName) &amp; ($User.LastName)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recieved and Attached Form E By</fullName>
        <field>Received_and_Attached_FormE_Certified_By__c</field>
        <formula>($User.FirstName) &amp; ($User.LastName)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Select MIM Specialization</fullName>
        <field>Specializations__c</field>
        <literalValue>MIM-Digital Marketing Specialization</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Accommodation Fee%3A Shared%2FTwin</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Shared_Twin_Annual__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Accoummodations Shared Twin</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>OP_Shared_Double__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Default Dubai Visa Type</fullName>
        <field>Visa_Type_Picklist__c</field>
        <literalValue>Visa - Single Standard All Countries</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Default Installment Plan</fullName>
        <field>Installment_Plan__c</field>
        <literalValue>No FlexiPlan</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set EF Prog%3A Blank</fullName>
        <field>Partner_Program_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set EF Program%3ABlank</fullName>
        <field>Partner_Program_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Field to Today</fullName>
        <field>Deposit_Date_Paid__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Financial Aid Approved Date</fullName>
        <field>Financial_Aid_Approved_Date__c</field>
        <formula>today()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Accomodation Fee%3A Single</fullName>
        <field>Housing_Accommodation__c</field>
        <literalValue>Single</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Bursary Housing</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>-40000</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Fee to Shang%2E12 m with  dep</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Accommodation_with_dependent_for_12_mths__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Fee to Shang%2E12 months</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Accommodation_for_12_months__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Fee to Shang%2E8 m with  dep</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Accommodation_with_dependent_for_8_mths__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Fee to Shang%2E8 months</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Accommodation_for_8_months__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Fee to Shang%2EFree w%2Edep-8m</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Free_accommodation_with_dependent_8mth__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Housing Fee%3AHult House East %E2%80%93 12 Mon</fullName>
        <field>Annual_Accommodation_Fee__c</field>
        <formula>Fees__r.Hult_House_East_12_Months__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Hult India Financial Aid</fullName>
        <field>Hult_India_Financial_Aid__c</field>
        <formula>IF( OR(OP_Campus__c = &apos;San Francisco&apos;,OP_Campus__c = &apos;Boston&apos;), 4000, if(OP_Campus__c = &apos;London&apos;,2485,if(OP_Campus__c = &apos;Shanghai&apos;,25000,IF(OP_Campus__c = &apos;Dubai&apos;,14700,0))))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set IP2 Payment Schedule 1st BBA</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) * 0.2) + 
(BLANKVALUE( Annual_Accommodation_Fee__c , 0) * 1.0) + 
(BLANKVALUE( Accommodation_Depositx__c , 0) * 1.0) + 
(BLANKVALUE(  Fees__r.Installment_Plan_Flex_Fee__c , 0) * 1.0) + 
(BLANKVALUE(Insurance_Price__c, 0) * 1.0) + 
(BLANKVALUE( Visa_Fee__c , 0) * 1.0) + 
(BLANKVALUE( Specialization_Fee_preFS__c, 0) * 0.5) + 
(BLANKVALUE( Partner_Program_Fee__c , 0) * 1.0) + 
(BLANKVALUE( Partner_Program_Insurance_Fee__c,0)*1.0) - 
((BLANKVALUE( Course_Deposit_Paid__c ,0)*1.0) + 
(BLANKVALUE( Total_Bursary_Amount__c, 0) * 0.2))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set IP2 Payment Schedule 2nd BBA</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) * 0.8) + 
(BLANKVALUE( Specialization_Fee_preFS__c , 0) * 0.5) - 
(BLANKVALUE( Total_Bursary_Amount__c, 0) * 0.8)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 1st Due EMBA</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,
date(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),07,31),
date(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),08,31)
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 2nd Due EMBA</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))&gt;=2014,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),11,1),
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),12,1)
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 3rd Due EMBA</fullName>
        <field>Payment_Due_Date_3rd__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))&gt;=2014,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,2,1),
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,3,1)
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 4th Due EMBA</fullName>
        <field>Payment_Due_Date_4th__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))&gt;=2014,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,5,1),
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,6,1)
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 5th Due EMBA</fullName>
        <field>Payment_Due_Date_5th__c</field>
        <formula>Payment_Due_Date_1st__c +365</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 6th Due EMBA</fullName>
        <field>Payment_Due_Date_6th__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))&gt;=2014,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),11,1) + 365,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),12,1) + 365
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 7th Due EMBA</fullName>
        <field>Payment_Due_Date_7th__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))&gt;=2014,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,2,1) +365,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,3,1) +365
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installm Paym Schd 8th Due EMBA</fullName>
        <field>Payment_Due_Date_8th__c</field>
        <formula>if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))&gt;=2014,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,5,1)+ 366,
DATE(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4))+1,6,1)+ 365
)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Flex PaymentSchedule Fee</fullName>
        <field>Installment_Plan_Fee__c</field>
        <formula>Fees__r.Installment_Plan_Flex_Fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 1st EMBA</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) - 

BLANKVALUE( Total_Bursary_Amount__c, 0)/2)* 
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.4,0.333333333) 

- 

BLANKVALUE( Deposit_Paid_FS__c ,0) + 

BLANKVALUE( Installment_Plan_Fee__c ,0)/2</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 2nd EMBA</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0)  - BLANKVALUE( Total_Bursary_Amount__c, 0)/2 )*
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.2,0.222222222)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 3rd EMBA</fullName>
        <field>Payment_Amount_3rd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0)  - BLANKVALUE( Total_Bursary_Amount__c, 0)/2 )*
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.2,0.222222222)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 4th EMBA</fullName>
        <field>Payment_Amount_4th__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0)  - BLANKVALUE( Total_Bursary_Amount__c, 0)/2 )*
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.2,0.222222222)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 5th EMBA</fullName>
        <field>Payment_Amount_5th__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) - BLANKVALUE( Total_Bursary_Amount__c, 0)/2)* 
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.4,0.333333333) 

+

BLANKVALUE( Installment_Plan_Fee__c ,0)/2</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 6th EMBA</fullName>
        <field>Payment_Amount_6th__c</field>
        <formula>Payment_Amount_2nd__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 7th EMBA</fullName>
        <field>Payment_Amount_7th__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0)  - BLANKVALUE( Total_Bursary_Amount__c, 0)/2 )*
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.2,0.222222222)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schd 8th EMBA</fullName>
        <field>Payment_Amount_8th__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0)  - BLANKVALUE( Total_Bursary_Amount__c, 0)/2 )*
if(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)) &gt;=2014,0.2,0.222222222)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schedule 1st</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) * 0.5) + 
(BLANKVALUE( Annual_Accommodation_Fee__c , 0) * 1.0) + 
(BLANKVALUE(  Accommodation_Depositx__c , 0) * 1.0) + 
(BLANKVALUE( Fees__r.Installment_Plan_fee__c, 0) * 1.0) + 
(BLANKVALUE(Insurance_Price__c, 0) * 1.0) + 
(BLANKVALUE( Visa_Fee__c , 0) * 1.0) + 
(BLANKVALUE( Specialization_Fee_FS_new__c, 0) * 0.5) +
(BLANKVALUE(  Partner_Program_Fee__c  , 0) * 1.0) + 
(BLANKVALUE(  Partner_Program_Insurance_Fee__c,0)*1.0) -
((BLANKVALUE(    Deposit_Paid_FS__c  ,0)*1.0) +
(BLANKVALUE( Total_Bursary_Amount__c, 0) * 0.5))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schedule 1st Due</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>Fees__r.Program_Start_Date__c - 90</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schedule 2nd</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) * 0.5) +
(BLANKVALUE( Specialization_Fee_FS_new__c , 0) * 0.5) -
(BLANKVALUE( Total_Bursary_Amount__c, 0) * 0.5)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schedule 2nd Due</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <formula>Date(VALUE(MID(Start_Term__c,len(Start_Term__c)-3,4)),12,19)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Installment Payment Schedule Fee</fullName>
        <field>Installment_Plan_Fee__c</field>
        <formula>Fees__r.Installment_Plan_fee__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Insurance Provider</fullName>
        <field>Insurance_Provider__c</field>
        <formula>OP_Insurance_Provider__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Insurance%3A Blank</fullName>
        <field>Insurance_Price__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set MIB Specialization</fullName>
        <field>Specializations__c</field>
        <literalValue>MIB-Project Management Specialization</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Partner Prog Fee%3A3 mos</fullName>
        <field>Partner_Program_Fee__c</field>
        <formula>Fees__r.Pre_Master_Program_3_months__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Partner Prog Fee%3A6 mos</fullName>
        <field>Partner_Program_Fee__c</field>
        <formula>OP_Pre_Master_Program_6_mos__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Payment Plan To Regular</fullName>
        <field>Payment_Plan__c</field>
        <literalValue>Regular</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Provider%3ABlank</fullName>
        <field>Insurance_Provider__c</field>
        <formula>&quot;&quot;</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Paym Sch 3rd Due non EMBA</fullName>
        <field>Payment_Due_Date_3rd__c</field>
        <formula>Fees__r.Program_Start_Date__c - 30</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schd 1st EMBA</fullName>
        <description>1 installment depicted for EMBA only</description>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) * 0.5) - 
(BLANKVALUE( Total_Bursary_Amount__c, 0) * 0.25)-
BLANKVALUE( Deposit_Paid_FS__c ,0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schd 2nd EMBA</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) * 0.5) - 
(BLANKVALUE( Total_Bursary_Amount__c, 0) * 0.25)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schd 3rd EMBA</fullName>
        <field>Payment_Amount_3rd__c</field>
        <formula>Payment_Amount_2nd__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schd 4th EMBA</fullName>
        <field>Payment_Amount_4th__c</field>
        <formula>Payment_Amount_2nd__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 1st</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) /3) + 
(BLANKVALUE( Annual_Accommodation_Fee__c , 0) /3) + 
(BLANKVALUE( Accommodation_Depositx__c , 0) /3) + 
(BLANKVALUE(Insurance_Price__c, 0)/3) + 
(BLANKVALUE( Visa_Fee__c , 0)/3) + 
(BLANKVALUE( Specialization_Fee_FS_new__c, 0)/3) + 
(BLANKVALUE( Partner_Program_Fee__c , 0) * 1.0) + 
(BLANKVALUE( Partner_Program_Insurance_Fee__c,0)*1.0) - 
((BLANKVALUE( Deposit_Paid_FS__c ,0)*1.0) + 
(BLANKVALUE( Total_Bursary_Amount__c, 0)/3))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 1st Due</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>Fees__r.Program_Start_Date__c - 90</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 2nd</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) /3) + 
(BLANKVALUE( Annual_Accommodation_Fee__c , 0) /3) + 
(BLANKVALUE( Accommodation_Depositx__c , 0) /3) + 
(BLANKVALUE( Insurance_Price__c , 0) /3) + 
(BLANKVALUE( Visa_Fee__c , 0) /3) + 
(BLANKVALUE( Specialization_Fee_FS_new__c , 0) /3) - 
(BLANKVALUE( Total_Bursary_Amount__c, 0) /3)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 2nd Due</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <formula>Fees__r.Program_Start_Date__c  - 60</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 3rd</fullName>
        <field>Payment_Amount_3rd__c</field>
        <formula>(BLANKVALUE(Tuition_Fee__c, 0) /3) + 
(BLANKVALUE( Annual_Accommodation_Fee__c , 0) /3) + 
(BLANKVALUE( Accommodation_Depositx__c , 0) /3) + 
(BLANKVALUE( Insurance_Price__c , 0) /3) + 
(BLANKVALUE( Visa_Fee__c , 0) /3) + 
(BLANKVALUE( Specialization_Fee_FS_new__c , 0) /3) - 
(BLANKVALUE( Total_Bursary_Amount__c, 0) /3)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 3rd  Due</fullName>
        <field>Payment_Due_Date_3rd__c</field>
        <formula>Payment_Due_Date_1st__c +365</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule 4th Due</fullName>
        <field>Payment_Due_Date_4th__c</field>
        <formula>Fees__r.Program_Start_Date__c  - 30 +365</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Regular Payment Schedule Fee Blank</fullName>
        <field>Installment_Plan_Fee__c</field>
        <formula>0.0</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Single Payment Schedule 1st Due</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>Fees__r.Program_Start_Date__c - 60</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Single Payment Schedule 2nd</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>0.00</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Single Payment Schedule 2nd Due</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Single Payment Schedule Fee Blank</fullName>
        <field>Installment_Plan_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Specialization Fee in FS</fullName>
        <field>Specialization_Fee_FS__c</field>
        <formula>Specialization_Fee_preFS__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Specialization Fee to Digital Mak</fullName>
        <field>Specialization_Fee__c</field>
        <formula>OP_MIM_Digital_Marketing_Specialization__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Specialization Fee to Proj Managmnt</fullName>
        <field>Specialization_Fee__c</field>
        <formula>OP_MIB_Project_Management_Specialization__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Specialization Fee%3ABlank</fullName>
        <field>Specialization_Fee__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Sub-total Financial Aid</fullName>
        <field>Sub_Total_Financial_Aid_no_GoEd__c</field>
        <formula>BLANKVALUE(Scholarship_Amount__c,0) + BLANKVALUE(Dean_Scholarship_Amount__c,0)+ BLANKVALUE(Relocation_Scholarship_Amount__c,0)+
BLANKVALUE(Adjustment_Amount__c,0)+
BLANKVALUE(Bertil_Hult_Scholarship_Amount__c,0)+
BLANKVALUE(Total_US_Fed_Private_Financing__c,0)+ BLANKVALUE(Early_Bird_Scholarship_Amount__c, 0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Total US Fed %26 Private Financing</fullName>
        <field>Total_US_Fed_Private_Financing__c</field>
        <formula>if( ispickval(Private_Financing_Status__c , &apos;Approved&apos;), Private_Financing__c ,0) 
+ if( ispickval( Status_Stafford__c , &apos;Approved&apos;), US_Federal_Financing_Stafford__c ,0) 
+ if( ispickval( Status_Pell__c , &apos;Approved&apos;), US_Federal_Financing_Pell__c ,0)
+ if( ispickval( Status_Grad_Plus__c , &apos;Approved&apos;), US_Federal_Financing_Grad_Plus__c ,0) 
+ if( ispickval( Status_Parent_Plus__c , &apos;Approved&apos;), US_Federal_Financing_Parent_Plus__c ,0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Visa Fee</fullName>
        <field>Visa_Fee__c</field>
        <formula>Dubai_Visa_Cost__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstDueBBA1</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>Fees__r.Program_Start_Date__c - 90</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstDueBBA2</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <formula>DATE(2015,12,18)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstFlexDueBBA1</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>Fees__r.Program_Start_Date__c - 90</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstFlexDueBBA2</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <formula>DATE(2015,12,18)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstFlexPayBBA1</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0) * 0.2) + 
(BLANKVALUE(BBA_Accommodation_Fee_Year_1__c, 0) * 1.0) +(BLANKVALUE(BBA_Accommodation_Deposit__c, 0) * 1.0) + 
(BLANKVALUE(BBA_Insurance_Year_1__c, 0) * 1.0) + 
(BLANKVALUE(BBA_Installment_Plan_Year_1__c, 0) * 1.0) + 
(BLANKVALUE(BBA_Extra_Credits_Charged_Year_1__c, 0) * 1.0) -(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0) * 0.2) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0) * 0.2) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)* 0.2) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)* 0.2) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)* 0.2) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)* 0.2) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)* 0.2) - 
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0) *0.2) - 
BLANKVALUE(Confirmation_Deposit__c ,0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstFlexPayBBA2</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0) * 0.8) - 
(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0)* 0.8) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0)* 0.8) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)* 0.8) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)* 0.8) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)* 0.8) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)* 0.8) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)* 0.8) - 
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0)* 0.8)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstPayBBA1</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0)/2) + 
(BLANKVALUE(BBA_Accommodation_Fee_Year_1__c, 0) * 1.0) +(BLANKVALUE(BBA_Accommodation_Deposit__c, 0) * 1.0) + 
(BLANKVALUE(BBA_Insurance_Year_1__c, 0) * 1.0) + 
(BLANKVALUE(BBA_Installment_Plan_Year_1__c, 0) * 1.0) + 
(BLANKVALUE(BBA_Extra_Credits_Charged_Year_1__c, 0) * 1.0) -(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0)/2) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0)/2) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)/2) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)/2) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)/2) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)/2) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)/2) - 
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0)/2) - 
BLANKVALUE(Confirmation_Deposit__c ,0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInstPayBBA2</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0)/2) - 
(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0)/2) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0)/2) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)/2) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)/2) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)/2) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)/2) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)/2) - 
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0)/2)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetRegDueBBA1</fullName>
        <field>Payment_Due_Date_1st__c</field>
        <formula>Fees__r.Program_Start_Date__c - 90</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetRegDueBBA2</fullName>
        <field>Payment_Due_Date_2nd__c</field>
        <formula>Fees__r.Program_Start_Date__c - 60</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetRegDueBBA3</fullName>
        <field>Payment_Due_Date_3rd__c</field>
        <formula>Fees__r.Program_Start_Date__c - 30</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetRegPayBBA1</fullName>
        <field>Payment_Amount_1st__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0)/3) +
(BLANKVALUE(BBA_Accommodation_Fee_Year_1__c, 0) * 1.0) +(BLANKVALUE(BBA_Accommodation_Deposit__c, 0) * 1.0) +
(BLANKVALUE(BBA_Insurance_Year_1__c, 0)/3) +
(BLANKVALUE(BBA_Extra_Credits_Charged_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0)/3) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)/3) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)/3) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)/3) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)/3) -
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0)/3) - 
BLANKVALUE(Confirmation_Deposit__c ,0)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetRegPayBBA2</fullName>
        <field>Payment_Amount_2nd__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0)/3) + 
(BLANKVALUE(BBA_Insurance_Year_1__c, 0)/3) + 
(BLANKVALUE(BBA_Extra_Credits_Charged_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0)/3) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)/3) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)/3) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)/3) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)/3) - 
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0)/3)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetRegPayBBA3</fullName>
        <field>Payment_Amount_3rd__c</field>
        <formula>(BLANKVALUE(BBA_Program_Fee_Year_1__c, 0)/3) + 
(BLANKVALUE(BBA_Insurance_Year_1__c, 0)/3) + 
(BLANKVALUE(BBA_Extra_Credits_Charged_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Scholarship_Financial_Aid_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Dean_Financial_Aid_Year_1__c, 0)/3) -(BLANKVALUE(BBA_US_Federal_Direct_Loan_Year_1__c, 0)/3) -(BLANKVALUE(BBA_Private_Financing_Year_1__c,0)/3) -(BLANKVALUE(BBA_Adjustment_Amount_Year_1_BBA__c,0)/3) -(BLANKVALUE(BBA_US_Federal_Parent_Plus_Year_1__c,0)/3) -(BLANKVALUE(BBA_US_Federal_Pell_Year_1__c,0)/3) - 
(BLANKVALUE(BBA_GoEd_Loan_Year_1__c,0)/3)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update BIBA</fullName>
        <description>Update Finance Aid Parent</description>
        <field>Fin_Aid_Cat_Parent__c</field>
        <literalValue>BIBA</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update EMBA</fullName>
        <description>Update EMBA value in Finance aid parent</description>
        <field>Fin_Aid_Cat_Parent__c</field>
        <literalValue>EMBA</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update MBA</fullName>
        <description>This is to update the value of MBA in Finance aid parent field.</description>
        <field>Fin_Aid_Cat_Parent__c</field>
        <literalValue>MBA</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Masters</fullName>
        <description>This is to update the Masters value in Finance aid parent field</description>
        <field>Fin_Aid_Cat_Parent__c</field>
        <literalValue>Masters</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update field Finance letter agreed date</fullName>
        <field>Financial_Support_Letter_Agreed_Date__c</field>
        <formula>Now()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update financial aid category</fullName>
        <field>Financial_Aid_Category__c</field>
        <formula>Text(Financial_Aid_Category__c)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Opportunity__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update total bursary amount</fullName>
        <field>Total_Bursary_Amount__c</field>
        <formula>Total_Bursary_Amount__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Opportunity__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Clear Global Head Protected FLAG</fullName>
        <actions>
            <name>Clear Global Head Protected FLAG</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>if (Deposit_Balance__c = 0 , FALSE, if( (Total_Tuition_Fees_Amount_Paid__c / Deposit_Balance__c ) &gt; 0.395, TRUE, FALSE))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Housing Accomodation Fee</fullName>
        <actions>
            <name>Finance%3AClear</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Housing_Accommodation__c</field>
            <operation>equals</operation>
            <value>,No accommodation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Copy Fields to Finance</fullName>
        <actions>
            <name>Copy App Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Copy Confirmation Deposit</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Copy Confirmation Deposit2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Copy Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Copy Tuition Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>This workflow rules copies the values from off Page(not on Page Layout) equilivant of themselves.  This is to allow the values captured via Cross Object Formula Fields to be copied and locked down when Application is completed.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Copy Installment Plan Fee</fullName>
        <actions>
            <name>Copy Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Copy Rotation Deposit %26 Total US Fed %26 Private  - Sub-total Fin Aid</fullName>
        <actions>
            <name>Set Sub-total Financial Aid</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Total US Fed %26 Private Financing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Copy UG Analyst Certificate</fullName>
        <actions>
            <name>Finance Copy UG Analyst Certificate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.Desires_UG_Analyst_Certificate__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Finance Support letter agreed date</fullName>
        <actions>
            <name>Update field Finance letter agreed date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISNEW()&amp;&amp;read_understood_fin_support_letter__c=True|| IsChanged( read_understood_fin_support_letter__c )&amp;&amp;read_understood_fin_support_letter__c=True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Finance fields updated on Opp</fullName>
        <actions>
            <name>update financial aid category</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update total bursary amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Mirrors 2 fields from Finance object so they can be used in a mail merge

NOTE::::---This WF was deactivated and field updates included in  unlockStudentInfromation trigger.</description>
        <formula>OR(Total_Bursary_Amount__c &gt;0,ISCHANGED(Scholarship_Amount__c),
ISCHANGED(Dean_Scholarship_Amount__c),
ISChanged(Relocation_Scholarship_Amount__c),
ISChanged(Early_Bird_Scholarship_Amount__c),
ISChanged(Adjustment_Amount__c),
ISChanged(Total_US_Fed_Private_Financing__c),
ISChanged( Bertil_Hult_Scholarship_Amount__c),
ISChanged(Hult_Financial_Aid__c),
ISChanged(Hult_India_Financial_Aid__c),
ISChanged(Campus_Financial_Aid_I__c),
ISChanged(Campus_Financial_Aid_II__c),
ISChanged(Fin_Aid_Hotel_and_Flight__c),
ISChanged(EMBA_Housing_Bursary__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Finance%3ASet Student ID</fullName>
        <actions>
            <name>Finance%3ASet Student ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK( Student_ID__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Go Ed Loan Amount Date Stamp</fullName>
        <actions>
            <name>Go Ed Loan Amount Date Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Go_Ed_Loan_Amount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Date stamp for Go Ed Loan Amount</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Go EdLoan Finance Campus Change</fullName>
        <actions>
            <name>GoED Loan Applicant with Campus Change Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>This rule was requested by Sonja to have an email sent out when a Confirmed or AEC applicant has been awarded a GoEd Loan but their campus has changed.</description>
        <formula>(ISPICKVAL (Opportunity__r.StageName, &quot;Confirmed&quot;)) || 
(ISPICKVAL (Opportunity__r.StageName, &quot;Admission Endorsed Confirmed&quot;)) || ISCHANGED (OP_Campus__c ) &amp;&amp;  Go_Ed_Loan_Amount__c  &gt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>GoEd Loan Status</fullName>
        <actions>
            <name>GoEd Loan Status</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>This workflow send email when ever GoEd Loan status changed . AND(OR(Isnew(),ISCHANGED( GoEd_Financing_Status__c )),NOT(ISPICKVAL( GoEd_Financing_Status__c , &quot;Not Started&quot;)))</description>
        <formula>AND(ISCHANGED(  Go_Ed_Loan_Amount__c),
OR (ISCHANGED ( BBA_GoEd_Loan_Year_1__c ),
OR (ISCHANGED (BBA_GoEd_Loan_Year_2__c),
OR (ISCHANGED (BBA_GoEd_Loan_Year_3__c),
OR (ISCHANGED (BBA_GoEd_Loan_Year_4__c),
NOT(ISPICKVAL( GoEd_Financing_Status__c , &quot;Not Started&quot;)))))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Hult Fin Aid%2BMerit %25 of Tuition above 50%25 Alert To Recruiters</fullName>
        <actions>
            <name>Aler Recruiter Hult Fin Aid%2BMerit %25 of Tuition Exceeds 50%25</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Hult_Fin_Aid_Merit_of_Tuition__c</field>
            <operation>greaterThan</operation>
            <value>50.0</value>
        </criteriaItems>
        <description>Requested by PF Jan 2014-MS</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Hult Lodge - Deposit Paid</fullName>
        <actions>
            <name>Final Steps Hult Lodge</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>TEXT(Campus_Program__c)=&apos;San Francisco-BBA&apos; &amp;&amp; ischanged(Non_BBA_Accommodation_Deposit__c)&amp;&amp;Non_BBA_Accommodation_Deposit__c&gt;=350</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Hult Tower - Deposit Paid Email</fullName>
        <actions>
            <name>Final Steps Hult Tower</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(Contains(&quot;London-BBA:London-MIM:London-MIB:London-MFIN&quot;,TEXT(Campus_Program__c)) ,ischanged(Non_BBA_Accommodation_Deposit__c),Non_BBA_Accommodation_Deposit__c&gt;=350)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Last Two Months Bank Statement</fullName>
        <actions>
            <name>Receieved Last Two Months Bank Stat Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Receieved Last Two Months Bank Statement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Last_Two_Months_Bank_Statement_Recieved__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Requested by PF Jan 2014-MS</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Non-BBA switched to BBA - inherit</fullName>
        <actions>
            <name>BBA Inherit - Accom Fee Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Adjustment Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Adjustment Amount Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Dean Scholarship Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Hult Financial Aid Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Installment Plan Fee Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Insurance Price Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>BBA Inherit - Scholarship Amount Yr1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged(RecordTypeId)  &amp;&amp;  
OR(
PRIORVALUE(RecordTypeId)=&apos;012U00000008qkX&apos;, 
PRIORVALUE(RecordTypeId)=&apos;012U00000008qms&apos;)
&amp;&amp; 
RecordTypeId = &apos;012U00000009eei&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ReSet Insurance Provider</fullName>
        <active>true</active>
        <description>ReSet Insurance</description>
        <formula>ISCHANGED( CurrencyIsoCode)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Recieved and Attached Form E updating</fullName>
        <actions>
            <name>I have Recieved and Attached Form E</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Recieved and Attached Form E By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.I_have_received_and_attached_the_Form_E__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Select MIB Specialization</fullName>
        <actions>
            <name>Set MIB Specialization</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Specialization_Name__c</field>
            <operation>equals</operation>
            <value>Project Management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Specialization_Taken__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Select MIM Specialization</fullName>
        <actions>
            <name>Select MIM Specialization</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Specialization_Taken__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Specialization_Name__c</field>
            <operation>equals</operation>
            <value>Digital Marketing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set  Insurance%3A Waived</fullName>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Provider%3ABlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Waived</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Accommodation Fee%3AShang%2E 8 months</fullName>
        <actions>
            <name>Set Housing Fee to Shang%2E8 months</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ispickval(Housing_Accommodation__c, &quot;Shanghai Hult Accommodation – 8 Months&quot;) &amp;&amp; ISCHANGED(Housing_Accommodation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Accommodation Fee%3AShared%2FTwin</fullName>
        <actions>
            <name>Set Accommodation Fee%3A Shared%2FTwin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.Housing_Accommodation__c</field>
            <operation>equals</operation>
            <value>Shanghai - Single Room (1 Person) - 8 Months - Free,EMBA Hotel</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Accomodation Fees%3A Single</fullName>
        <actions>
            <name>Finance%3ASet Accomodation Fee Single</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Housing Accomodation Fee%3A Single</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Housing_Accommodation__c</field>
            <operation>equals</operation>
            <value>Dubai - MBA - Single - half free,Shanghai - Single - half free - 8 months,Dubai - Masters - Single</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Application Fee Paid Date</fullName>
        <actions>
            <name>Finance%3ASet Applicant Fee Paid Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Application_Fee_Paid__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Date Installment Plan Accepted Date</fullName>
        <actions>
            <name>Finance%3ASet Date Payment Plan Selected</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ischanged(Installment_Plan__c)&amp;&amp; ISNULL(Date_Installment_Plan_Accepted__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Date Student Fin Info Unlocked</fullName>
        <actions>
            <name>Finance%3ASet Student Fin Info Unlock Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Unlock_Student_Financial_Information__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Default Finance Values</fullName>
        <actions>
            <name>Finance%3A Set Insurance%3A Single</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Finance%3ASet Insurance Type to Single</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Payment Plan To Regular</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Insurance and Payment Plan Defaults</description>
        <formula>ISNEW() &amp;&amp; Program_Parsed__c &lt;&gt; &apos;EMBA&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Default Finance Values - Dubai</fullName>
        <actions>
            <name>Set Default Dubai Visa Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Insurance and Payment Plan Defaults</description>
        <formula>ISNEW() &amp;&amp; Program_Parsed__c &lt;&gt; &apos;EMBA&apos;  &amp;&amp; OR(Program__c  = &apos;MIB-UAE-Dubai&apos;,Program__c  = &apos;MBA-UAE-Dubai&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Default Finance Values EMBA</fullName>
        <actions>
            <name>Finance%3A Set Insurance Type to Waived</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Payment Plan To Regular</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Insurance and Payment Plan Defaults for EMBA</description>
        <formula>ISNEW() &amp;&amp;  Program_Parsed__c = &apos;EMBA&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Default Installment Plan</fullName>
        <actions>
            <name>Set Default Installment Plan</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program__c</field>
            <operation>contains</operation>
            <value>EMBA</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Department Lookup in OP%3AApp Fee Lookup</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets the Department Name in the Off Page Application Fee Lookup field.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Deposit Amount Paid Date</fullName>
        <actions>
            <name>Finance%3ASet Deposit Amount Paid Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Course_Deposit_Amount__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set EF Progam%3A 3 Mos</fullName>
        <actions>
            <name>Finance%3ASet Partner Pgm Ins 3 mos</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Partner Prog Fee%3A3 mos</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.EF_Partner_Programs__c</field>
            <operation>equals</operation>
            <value>EMBA/IEMBA Program (3 months)</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set EF Progam%3A 6 Mos</fullName>
        <actions>
            <name>Finance%3ASet Partner Pgm Insurance 6mos</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Partner Prog Fee%3A6 mos</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.EF_Partner_Programs__c</field>
            <operation>contains</operation>
            <value>Pre-Master Program (6 months),EMBA/IEMBA Program (6 months)</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set EF Progam%3A Blank</fullName>
        <actions>
            <name>Finance%3ASet Prtnr Pgm Insur Bl</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set EF Program%3ABlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL( EF_Partner_Programs__c ,&quot;&quot;) ||
  ISPICKVAL( EF_Partner_Programs__c ,&quot;Select&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Financial Aid Approved Date</fullName>
        <actions>
            <name>Set Financial Aid Approved Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Financial_Aid_Approver__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Housing Bursary Housing</fullName>
        <actions>
            <name>Set Housing Bursary Housing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Housing_Accommodation__c</field>
            <operation>equals</operation>
            <value>Dubai Housing Bursary</value>
        </criteriaItems>
        <description>only for MBA Dubai programs</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Housing Fee%3AHult House East %E2%80%93 12 Months</fullName>
        <actions>
            <name>Set Housing Fee%3AHult House East %E2%80%93 12 Mon</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ispickval(Housing_Accommodation__c, &quot;Hult House East – 12 Months&quot;) &amp;&amp; ISCHANGED(Housing_Accommodation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Housing Fee%3AShang%2E 12 months</fullName>
        <actions>
            <name>Set Housing Fee to Shang%2E12 months</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ispickval(Housing_Accommodation__c, &quot;Shanghai Hult Accommodation – 12 Months&quot;) &amp;&amp; ISCHANGED(Housing_Accommodation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Housing Fee%3AShang%2E 12 months with dep%2E</fullName>
        <actions>
            <name>Set Housing Fee to Shang%2E12 m with  dep</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ispickval(Housing_Accommodation__c, &quot;Shanghai Accommodation with dependent for 12 months&quot;) &amp;&amp; ISCHANGED(Housing_Accommodation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Housing Fee%3AShang%2E 8 months with dep%2E</fullName>
        <actions>
            <name>Set Housing Fee to Shang%2E8 m with  dep</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ispickval(Housing_Accommodation__c, &quot;Shanghai Accommodation with dependent for 8 months&quot;) &amp;&amp; ISCHANGED(Housing_Accommodation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Housing Fee%3AShang%2E 8 months with dep%2E Free</fullName>
        <actions>
            <name>Set Housing Fee to Shang%2EFree w%2Edep-8m</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ispickval(Housing_Accommodation__c, &quot;Free accommodation with dependent – 8 months&quot;) &amp;&amp; ISCHANGED(Housing_Accommodation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Flex Payment BBA</fullName>
        <actions>
            <name>SetInstFlexDueBBA1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetInstFlexDueBBA2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetInstFlexPayBBA1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetInstFlexPayBBA2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Start_Term__c = &apos;September 2015&apos; &amp;&amp; (((contains(Program__c , &quot;Bachelor&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan Flex&quot;)) || (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;Bachelor&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan Flex&quot;)) ) &amp;&amp; God_Lever__c = FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment BBA</fullName>
        <actions>
            <name>SetInstDueBBA1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetInstDueBBA2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetInstPayBBA1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetInstPayBBA2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Start_Term__c = &apos;September 2015&apos; &amp;&amp; (((contains(Program__c , &quot;Bachelor&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan&quot;)) || (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;Bachelor&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan&quot;)) ) &amp;&amp; God_Lever__c = FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedul BBA</fullName>
        <actions>
            <name>Clear Installment 3rd Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 4th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 3rd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 8th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set IP2 Payment Schedule 2nd BBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Flex PaymentSchedule Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Installment Plan 2</description>
        <formula>(
   (
    Program_Parsed__c = &apos;Masters&apos;
    &amp;&amp; 
    ispickval( Installment_Plan__c, &quot;Installment Plan Flex&quot;)
    )   
||   
   (
    ischanged( Deposit_Balance__c ) 
    &amp;&amp; 
    Program_Parsed__c = &apos;Masters&apos;
    &amp;&amp; 
    ispickval( Installment_Plan__c, &quot;Installment Plan Flex&quot;)
    )
) 

&amp;&amp; 

God_Lever__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedule</fullName>
        <actions>
            <name>Finance%3ASet Date Payment Plan Selected</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Finance%3ASet Payment Plan to Installment</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 1st</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 2nd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Installment_Plan__c</field>
            <operation>equals</operation>
            <value>Installment Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedule EMBA</fullName>
        <actions>
            <name>Finance%3A Set Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 2nd Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 3rd Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 4th Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 2nd EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 3rd EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 4th EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 5th EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 6th EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;FlexiPlan&quot;))   ||   (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;FlexiPlan&quot;)) ) &amp;&amp; God_Lever__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedule EMBA part 2</fullName>
        <actions>
            <name>Finance%3A Set Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 1st Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 5th Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 6th Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 7th Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installm Paym Schd 8th Due EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 1st EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 7th EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schd 8th EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;FlexiPlan&quot;))   ||   (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;FlexiPlan&quot;)) ) &amp;&amp; God_Lever__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedule Reg IP2 part2</fullName>
        <actions>
            <name>Clear Installment 5th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 6th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 7th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 8th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 4th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 5th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 6th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 7th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set IP2 Payment Schedule 1st BBA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Installment Plan 2</description>
        <formula>(
   (
    Program_Parsed__c = &apos;Masters&apos;
    &amp;&amp; 
    ispickval( Installment_Plan__c, &quot;Installment Plan Flex&quot;)
    )   
||   
   (
    ischanged( Deposit_Balance__c ) 
    &amp;&amp; 
    Program_Parsed__c = &apos;Masters&apos;
    &amp;&amp; 
    ispickval( Installment_Plan__c, &quot;Installment Plan Flex&quot;)
    )
) 

&amp;&amp; 

God_Lever__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedule Reg Prog</fullName>
        <actions>
            <name>Clear Installment 3rd Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 4th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 3rd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 8th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Finance%3ASet Payment Plan to Installment</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 2nd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (not(contains(Program__c , &quot;EMBA&quot;)) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan&quot;))   ||   (ischanged( Deposit_Balance__c ) &amp;&amp; not(contains(Program__c , &quot;EMBA&quot;)) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan&quot;)) ) &amp;&amp; God_Lever__c = FALSE &amp;&amp; not(contains(Program__c , &quot;Bachelor&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Installment Payment Schedule Reg Prog part2</fullName>
        <actions>
            <name>Clear Installment 5th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 6th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 7th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 8th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 4th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 5th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 6th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 7th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Finance%3A Set Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Installment Payment Schedule 1st</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (not(contains(Program__c , &quot;EMBA&quot;)) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan&quot;))   ||   (ischanged( Deposit_Balance__c ) &amp;&amp; not(contains(Program__c , &quot;EMBA&quot;)) &amp;&amp; ispickval( Installment_Plan__c, &quot;Installment Plan&quot;)) ) &amp;&amp; God_Lever__c = FALSE &amp;&amp; not(contains(Program__c , &quot;Bachelor&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Blank</fullName>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Provider%3ABlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Single</fullName>
        <actions>
            <name>Finance%3A Set Insurance%3A Single</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Single</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Single %26 2 Child</fullName>
        <actions>
            <name>Finance%3ASet Insurance Single Plus Child</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Single &amp; 2 Child</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Single %26 Child</fullName>
        <actions>
            <name>Finance%3ASet Insurance Single Plus Child</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Single &amp; Child</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Single %26 Spouse</fullName>
        <actions>
            <name>Finance%3ASet Insurance Single %26 Spouse</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Single &amp; Spouse</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Single %26 Spouse %26 2 Child</fullName>
        <actions>
            <name>Finance%3ASet In%2ESingle %26 Spouse %26 2 Child</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Single &amp; Spouse &amp; 2 Child</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Insurance%3A Single %26 Spouse %26 Child</fullName>
        <actions>
            <name>Finance%3ASet Insurance Single%26Spouse%26Chil</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Insurance%3A Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Insurance__c</field>
            <operation>equals</operation>
            <value>Single &amp; Spouse &amp; Child</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Regular Payment BBA</fullName>
        <actions>
            <name>SetRegDueBBA1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetRegDueBBA2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetRegDueBBA3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetRegPayBBA1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetRegPayBBA2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetRegPayBBA3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Start_Term__c = &apos;September 2015&apos; &amp;&amp; (((contains(Program__c , &quot;Bachelor&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;No Installment Plan&quot;)) || (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;Bachelor&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;No Installment Plan&quot;)) ) &amp;&amp; God_Lever__c = FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Regular Payment Schedule</fullName>
        <actions>
            <name>Finance%3AClear Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 1st</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 2nd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule Fee Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Installment_Plan__c</field>
            <operation>equals</operation>
            <value>No Installment Plan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Regular Payment Schedule EMBA</fullName>
        <actions>
            <name>Set Regular Payment Schd 1st EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schd 2nd EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schd 3rd EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schd 4th EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 3rd  Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 4th Due</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;No FlexiPlan&quot;))    ||   (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;No FlexiPlan&quot;)) )   &amp;&amp;    God_Lever__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Regular Payment Schedule EMBA part2</fullName>
        <actions>
            <name>Clear Installment 5th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 6th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 7th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment 8th Due Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 5th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 6th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 7th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Installment Amount 8th</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Finance%3AClear Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;No FlexiPlan&quot;))   ||   (ischanged( Deposit_Balance__c ) &amp;&amp; contains(Program__c , &quot;EMBA&quot;) &amp;&amp; ispickval( Installment_Plan__c, &quot;No FlexiPlan&quot;)) ) &amp;&amp; God_Lever__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Regular Payment Schedule Reg Prog</fullName>
        <actions>
            <name>Finance%3AClear Installment Plan Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Paym Sch 3rd Due non EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 1st</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 2nd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule 3rd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Regular Payment Schedule Fee Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>( (not(contains(Program__c , &quot;EMBA&quot;)) &amp;&amp; ispickval( Installment_Plan__c, &quot;No Installment Plan&quot;))   ||   (ischanged( Deposit_Balance__c ) &amp;&amp; not(contains(Program__c , &quot;EMBA&quot;)) &amp;&amp; ispickval( Installment_Plan__c, &quot;No Installment Plan&quot;)) ) &amp;&amp; God_Lever__c = FALSE &amp;&amp; not(contains(Program__c , &quot;Bachelor&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Single Payment Schedule</fullName>
        <actions>
            <name>Set Single Payment Schedule 1st Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Single Payment Schedule 2nd</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Single Payment Schedule 2nd Due</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Single Payment Schedule Fee Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Specialization Fee%3A Blank</fullName>
        <actions>
            <name>Set Specialization Fee%3ABlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Specialization_Name__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Specialization Fee%3A Project Management</fullName>
        <actions>
            <name>Set Specialization Fee to Proj Managmnt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Specialization__c</field>
            <operation>equals</operation>
            <value>Project Management</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Specialization Fee%3ADigital Marketing</fullName>
        <actions>
            <name>Set Specialization Fee to Digital Mak</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Specialization__c</field>
            <operation>equals</operation>
            <value>Digital Marketing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set T%2FC Acceptance Date</fullName>
        <actions>
            <name>Finance%3ASet T%2FC Accept Date Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.I_agree_to_Hult_Terms_and_Conditions__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Total Financial Aid Amount</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Application_Status__c</field>
            <operation>equals</operation>
            <value>Active,Enrolled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set UG Housing Deposit Paid Date</fullName>
        <actions>
            <name>FINANCE%3AUG Housing Deposit Paid Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Field to Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.UG_Housing_Amount_Received__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Visa Fee</fullName>
        <actions>
            <name>Finance%3ASet Visa Cost</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Visa Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>not(ispickval(Visa_Type_Picklist__c,&quot;&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Visa Fee to Zero</fullName>
        <actions>
            <name>Clear Visa Cost</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear Visa Fee in FS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>(isblank( Visa_Type__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Shanghai Housing Notification</fullName>
        <actions>
            <name>Shanghai Housing Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Housing_Accommodation__c</field>
            <operation>equals</operation>
            <value>No accommodation,Shanghai Hult Accommodation – 12 Months,Shanghai Hult Accommodation – 8 Months,Shanghai Accommodation with dependent for 12 months,Shanghai Accommodation with dependent for 8 months,Shanghai - Single Room (1 Person) - 8 Months - Free</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Admissions Endorsed Confirmed,Confirmed</value>
        </criteriaItems>
        <description>requested by Sylvia Wang and Sonja June 2013-MS</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update BIBA</fullName>
        <actions>
            <name>Update BIBA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>equals</operation>
            <value>BIBA</value>
        </criteriaItems>
        <description>This is to update Finance category parent in the finance record.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update EMBA</fullName>
        <actions>
            <name>Update EMBA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>equals</operation>
            <value>EMBA</value>
        </criteriaItems>
        <description>This is to update Finance category parent in the finance record.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update MBA</fullName>
        <actions>
            <name>Update MBA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>equals</operation>
            <value>MBA</value>
        </criteriaItems>
        <description>This is to update Finance category parent in the finance record.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Masters</fullName>
        <actions>
            <name>Update Masters</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity_Finance__c.Program_Parsed__c</field>
            <operation>equals</operation>
            <value>Masters</value>
        </criteriaItems>
        <description>This is to update Finance category parent in the finance record.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
