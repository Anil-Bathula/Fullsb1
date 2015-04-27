<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CV unapproved 15 days - email alert to Student</fullName>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <template>Career_Services_Student_Email_Templates/CV_Unapproved_15_days</template>
    </alerts>
    <alerts>
        <fullName>CV unapproved 30 days - email alert to Student</fullName>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <template>Career_Services_Student_Email_Templates/CV_Unapproved_30_days</template>
    </alerts>
    <alerts>
        <fullName>CV unapproved 45 days - email alert to Student</fullName>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <template>Career_Services_Student_Email_Templates/CV_Unapproved_45_days</template>
    </alerts>
    <alerts>
        <fullName>Contact %28Germnay%29-Wants to be contacted by EF</fullName>
        <ccEmails>niklas.kukat@ef.com</ccEmails>
        <protected>false</protected>
        <template>unfiled$public/Applicant_Want_To_Be_Contacted_By_EF</template>
    </alerts>
    <alerts>
        <fullName>Contact %28Kazakhstan%29-wants to be contacted by EF</fullName>
        <ccEmails>baris.ucok@ef.com</ccEmails>
        <protected>false</protected>
        <template>unfiled$public/Applicant_Want_To_Be_Contacted_By_EF</template>
    </alerts>
    <alerts>
        <fullName>Contact %28Other Country%29-wants to be contacted by EF</fullName>
        <ccEmails>efhotleads@hult.edu</ccEmails>
        <protected>false</protected>
        <template>unfiled$public/Applicant_Want_To_Be_Contacted_By_EF</template>
    </alerts>
    <alerts>
        <fullName>New Partner Email Alert</fullName>
        <protected>false</protected>
        <recipients>
            <recipient>SAL.EU-LDN.ALL</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>SAL.EU-LDN.BBA</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>SAL.EU-LDN.EMBA</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>SAL.EU-LDN.MA</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>SAL.EU-LDN.MBA</recipient>
            <type>group</type>
        </recipients>
        <template>SF_SUpport/SF_Support_Case_Close</template>
    </alerts>
    <alerts>
        <fullName>Wants to be Contacted By EF-Applicant Email Alert</fullName>
        <ccEmails>Igor.Kuznetsov@EF.com, TatianaRyassova@EF.com</ccEmails>
        <protected>false</protected>
        <template>unfiled$public/Applicant_Want_To_Be_Contacted_By_EF</template>
    </alerts>
    <fieldUpdates>
        <fullName>Applicant%3ASet Start Date 2014</fullName>
        <field>Start_Term__c</field>
        <literalValue>September 2014</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Applicant%3ASet Start Term 2011</fullName>
        <field>Start_Term__c</field>
        <literalValue>September 2011</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Applicant%3ASet Start Term 2012</fullName>
        <field>Start_Term__c</field>
        <literalValue>September 2012</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Applicant%3ASet Start Term 2013</fullName>
        <field>Start_Term__c</field>
        <literalValue>September 2013</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Block LBR</fullName>
        <field>Do_Not_Route__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CS 2nd Unapproved Time Stamp</fullName>
        <field>CS_2nd_Unapproved_Time__c</field>
        <formula>now()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CS Approved Time Stamp</fullName>
        <field>CS_2nd_Unapproved_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CS Approved User Stamp</fullName>
        <field>CS_Approved_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CS Unapproved Time Stamp</fullName>
        <field>CS_CS_Unapproved_Time__c</field>
        <formula>NOW()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CS Unapproved User Stamp</fullName>
        <field>CS_Unapproved_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact Pertner</fullName>
        <field>Campus__c</field>
        <literalValue>London</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact%3ACopy Email to Applicant Email</fullName>
        <description>Copy email address to Applicant Email Address if blank</description>
        <field>Applicant_Email__c</field>
        <formula>Email</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_SetApplyRoutingRecruiting</fullName>
        <field>Apply_Routing_Type__c</field>
        <literalValue>Recruiting</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy %3Aapplicant Email to Email</fullName>
        <field>Email</field>
        <formula>Applicant_Email__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last Lead Scoring Activity</fullName>
        <field>Last_Lead_Scoring_Activity__c</field>
        <formula>NOW()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Patial Lead Score STAMP</fullName>
        <field>Patial_Lead_Score_STAMP__c</field>
        <formula>LEAD_SCORE_Total__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>People Status</fullName>
        <description>This will update the People Status to active when one is created through TalentStaffing or through an Import when not populated.</description>
        <field>ts2__People_Status__c</field>
        <literalValue>Active</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate Contact Primary Lead Source</fullName>
        <field>First_Touch_Point_Source__c</field>
        <formula>text(LeadSource)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre TS Talent Pool User Stamp</fullName>
        <description>Sets the user name of the person who is Pre-TS Talent Pooling the Applicant or Student into the user stamp field.</description>
        <field>CR_Pre_TS_Talent_Pool_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pre-TS Talent Pool Time Stamp</fullName>
        <description>Captures the Date and Time of Now into the timestamp of the Pre-TS Talent Pool field</description>
        <field>CR_Pre_Talent_TS_Pool_Time__c</field>
        <formula>now()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Region to Lat Am</fullName>
        <field>Region__c</field>
        <literalValue>Lat Am</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Resume Status %3D CS Approved</fullName>
        <field>Resume_Status__c</field>
        <literalValue>CS Approved</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Applicant Interest</fullName>
        <field>Applicant_Interest__c</field>
        <formula>Application_Sub_Stage__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Apply Routing to True</fullName>
        <field>Apply_Routing_Type__c</field>
        <literalValue>Recruiting</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set CS Approved Time</fullName>
        <field>CS_CS_Approved_Time__c</field>
        <formula>NOW()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Do Not Route to False</fullName>
        <field>Do_Not_Route__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetTitleFe-Male</fullName>
        <field>Salutation</field>
        <literalValue>Miss</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetTitleMale</fullName>
        <field>Salutation</field>
        <literalValue>Mr.</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sync HCP Campus</fullName>
        <description>Syncs HCP Campus with Campus Parsed</description>
        <field>Hult_Campus__c</field>
        <formula>Campus_parsed_from_Program__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sync HCP Program</fullName>
        <description>Syncs HCP Program with Program Parsed</description>
        <field>Hult_Program__c</field>
        <formula>Program_Parsed__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TEST</fullName>
        <field>Portal_user_exists_for_contact__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TS Talent Pool Time Stamp</fullName>
        <field>CR_TS_Talent_Pool_Time__c</field>
        <formula>NOW()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TS Talent Pool User Stamp</fullName>
        <field>TS_Talent_Pool_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TS Unapproved Time Stamp</fullName>
        <field>CR_TS_Unapproved_Time__c</field>
        <formula>NOW()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TS Unapproved User Stamp</fullName>
        <field>TS_Unapproved_User__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TransferNationality</fullName>
        <field>Nationality_1_Text__c</field>
        <formula>Country_Of_Origin__r.Name</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TransferNationality2</fullName>
        <field>Nationality_2_Text__c</field>
        <formula>Country_Of_Citizenship__r.Name</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update First Name</fullName>
        <field>ts2__Firstname__c</field>
        <formula>FirstName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Last name</fullName>
        <field>ts2__Lastname__c</field>
        <formula>LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Off Talent Solutions to FALSE</fullName>
        <field>Off_Talent_Solutions__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Off Talent Solutions to TRUE</fullName>
        <field>Off_Talent_Solutions__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Region of Origin</fullName>
        <field>CR_Region_of_Origin__c</field>
        <formula>CASE(UPPER(Country_Of_Origin__r.Name),&quot;AUSTRALIA&quot;, &quot;EASTASIA&quot;, &quot;CHINA&quot;, &quot;EASTASIA&quot;, &quot;CHRISTMAS ISLAND&quot;, &quot;EASTASIA&quot;, &quot;HONG KONG&quot;, &quot;EASTASIA&quot;, &quot;INDONESIA&quot;, &quot;EASTASIA&quot;, &quot;JAPAN&quot;, &quot;EASTASIA&quot;, &quot;KOREA (SOUTH)&quot;, &quot;EASTASIA&quot;, &quot;MACAU&quot;, &quot;EASTASIA&quot;, &quot;MALAYSIA&quot;, &quot;EASTASIA&quot;, &quot;MONGOLIA&quot;, &quot;EASTASIA&quot;, &quot;NEW ZEALAND&quot;, &quot;EASTASIA&quot;, &quot;PHILIPPINES&quot;, &quot;EASTASIA&quot;, &quot;SINGAPORE&quot;, &quot;EASTASIA&quot;, &quot;TAIWAN&quot;, &quot;EASTASIA&quot;, &quot;THAILAND&quot;, &quot;EASTASIA&quot;, &quot;VIETNAM&quot;, &quot;EASTASIA&quot;, &quot;AUSTRIA&quot;, &quot;EU&quot;, &quot;BELGIUM&quot;, &quot;EU&quot;, &quot;BERMUDA&quot;, &quot;EU&quot;, &quot;BULGARIA&quot;, &quot;EU&quot;, &quot;CROATIA&quot;, &quot;EU&quot;, &quot;CZECH REPUBLIC&quot;, &quot;EU&quot;, &quot;DENMARK&quot;, &quot;EU&quot;, &quot;ENGLAND&quot;, &quot;EU&quot;, &quot;ESTONIA&quot;, &quot;EU&quot;, &quot;FAROE ISLANDS&quot;, &quot;EU&quot;, &quot;FINLAND&quot;, &quot;EU&quot;, &quot;FRANCE&quot;, &quot;EU&quot;, &quot;GERMANY&quot;, &quot;EU&quot;, &quot;GREECE&quot;, &quot;EU&quot;, &quot;HUNGARY&quot;, &quot;EU&quot;, &quot;ICELAND&quot;, &quot;EU&quot;, &quot;IRELAND&quot;, &quot;EU&quot;, &quot;ITALY&quot;, &quot;EU&quot;, &quot;LITHUANIA&quot;, &quot;EU&quot;, &quot;LUXEMBOURG&quot;, &quot;EU&quot;, &quot;NETHERLANDS&quot;, &quot;EU&quot;, &quot;NETHERLANDS ANTILLES&quot;, &quot;EU&quot;, &quot;NORWAY&quot;, &quot;EU&quot;, &quot;POLAND&quot;, &quot;EU&quot;, &quot;PORTUGAL&quot;, &quot;EU&quot;, &quot;ROMANIA&quot;, &quot;EU&quot;, &quot;SLOVAKIA&quot;, &quot;EU&quot;, &quot;SPAIN&quot;, &quot;EU&quot;, &quot;SWEDEN&quot;, &quot;EU&quot;, &quot;SWITZERLAND&quot;, &quot;EU&quot;, &quot;UNITED KINGDOM&quot;, &quot;EU&quot;, &quot;VIRGIN ISLANDS(BRITISH)&quot;, &quot;EU&quot;, &quot;ARGENTINA&quot;, &quot;LAT&quot;, &quot;BOLIVIA&quot;, &quot;LAT&quot;, &quot;BRAZIL&quot;, &quot;LAT&quot;, &quot;CHILE&quot;, &quot;LAT&quot;, &quot;COLOMBIA&quot;, &quot;LAT&quot;, &quot;COSTA RICA&quot;, &quot;LAT&quot;, &quot;CUBA&quot;, &quot;LAT&quot;, &quot;DOMINICAN REPUBLIC&quot;, &quot;LAT&quot;, &quot;ECUADOR&quot;, &quot;LAT&quot;, &quot;EL SALVADOR&quot;, &quot;LAT&quot;, &quot;GUATEMALA&quot;, &quot;LAT&quot;, &quot;HAITI&quot;, &quot;LAT&quot;, &quot;HONDURAS&quot;, &quot;LAT&quot;, &quot;JAMAICA&quot;, &quot;LAT&quot;, &quot;MEXICO&quot;, &quot;LAT&quot;, &quot;NICARAGUA&quot;, &quot;LAT&quot;, &quot;PANAMA&quot;, &quot;LAT&quot;, &quot;PERU&quot;, &quot;LAT&quot;, &quot;SAINT KITTS AND NEVIS&quot;, &quot;LAT&quot;, &quot;TRINIDAD AND TOBAGO&quot;, &quot;LAT&quot;, &quot;URUGUAY&quot;, &quot;LAT&quot;, &quot;VENEZUELA&quot;, &quot;LAT&quot;, &quot;AFGHANISTAN&quot;, &quot;MENA&quot;, &quot;ALGERIA&quot;, &quot;MENA&quot;, &quot;BAHRAIN&quot;, &quot;MENA&quot;, &quot;EGYPT&quot;, &quot;MENA&quot;, &quot;IRAN&quot;, &quot;MENA&quot;, &quot;IRAQ&quot;, &quot;MENA&quot;, &quot;JORDAN&quot;, &quot;MENA&quot;, &quot;LEBANON&quot;, &quot;MENA&quot;, &quot;LIBYA&quot;, &quot;MENA&quot;, &quot;MOROCCO&quot;, &quot;MENA&quot;, &quot;PALESTINE&quot;, &quot;MENA&quot;, &quot;SAUDI ARABIA&quot;, &quot;MENA&quot;, &quot;SYRIA&quot;, &quot;MENA&quot;, &quot;TUNISIA&quot;, &quot;MENA&quot;, &quot;TURKEY&quot;, &quot;MENA&quot;, &quot;UNITED ARAB EMIRATES&quot;, &quot;MENA&quot;, &quot;ALBANIA&quot;, &quot;NEU&quot;, &quot;ARMENIA&quot;, &quot;NEU&quot;, &quot;CYPRUS&quot;, &quot;NEU&quot;, &quot;GEORGIA&quot;, &quot;NEU&quot;, &quot;ISRAEL&quot;, &quot;NEU&quot;, &quot;KAZAKHSTAN&quot;, &quot;NEU&quot;, &quot;KOSOVO&quot;, &quot;NEU&quot;, &quot;KYRGYZSTAN&quot;, &quot;NEU&quot;, &quot;RUSSIA&quot;, &quot;NEU&quot;, &quot;SERBIA&quot;, &quot;NEU&quot;, &quot;UKRAINE&quot;, &quot;NEU&quot;, &quot;CANADA&quot;, &quot;NORTHAM&quot;, &quot;PUERTO RICO&quot;, &quot;NORTHAM&quot;, &quot;UNITED STATES&quot;, &quot;NORTHAM&quot;, &quot;US MINOR OUTLYING ISLANDS&quot;, &quot;NORTHAM&quot;, &quot;BANGLADESH&quot;, &quot;SOUTHASIA&quot;, &quot;INDIA&quot;, &quot;SOUTHASIA&quot;, &quot;NEPAL&quot;, &quot;SOUTHASIA&quot;, &quot;SRI LANKA&quot;, &quot;SOUTHASIA&quot;, &quot;PAKISTAN&quot;, &quot;SOUTHASIA&quot;, &quot;ANGOLA&quot;, &quot;WESA&quot;, &quot;BENIN&quot;, &quot;WESA&quot;, &quot;BURKINA FASO&quot;, &quot;WESA&quot;, &quot;CAMEROON&quot;, &quot;WESA&quot;, &quot;CONGO&quot;, &quot;WESA&quot;, &quot;COTE D IVOIRE&quot;, &quot;WESA&quot;, &quot;GAMBIA&quot;, &quot;WESA&quot;, &quot;GHANA&quot;, &quot;WESA&quot;, &quot;GUINEA-BISSAU&quot;, &quot;WESA&quot;, &quot;IVORY COAST&quot;, &quot;WESA&quot;, &quot;KENYA&quot;, &quot;WESA&quot;, &quot;MALI&quot;, &quot;WESA&quot;, &quot;MAURITIUS&quot;, &quot;WESA&quot;, &quot;NIGERIA&quot;, &quot;WESA&quot;, &quot;SENEGAL&quot;, &quot;WESA&quot;, &quot;SOUTH AFRICA&quot;, &quot;WESA&quot;, &quot;ZAMBIA&quot;, &quot;WESA&quot;, &quot;ZIMBABWE&quot;, &quot;WESA&quot;, &quot;Unassigned&quot;)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Resume Status to New</fullName>
        <field>Resume_Status__c</field>
        <literalValue>New</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update SFDC First Name</fullName>
        <field>FirstName</field>
        <formula>ts2__Firstname__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update SFDC Last Name</fullName>
        <field>LastName</field>
        <formula>ts2__Lastname__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign Contact to new Owner</fullName>
        <actions>
            <name>Contact_SetApplyRoutingRecruiting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( ! ISNEW(),
       ! ISPICKVAL(Apply_Routing_Type__c ,&quot;Recruiting&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign Region of Origin</fullName>
        <actions>
            <name>Update Region of Origin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Only runs for Record Type = Student</description>
        <formula>RecordTypeId = &apos;012U00000009VgY&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Block LBR</fullName>
        <actions>
            <name>Block LBR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Stage__c</field>
            <operation>equals</operation>
            <value>Partial Application,Waiting for Review,Accepted,Conditionally Accepted,Admissions Endorsed,Withdrawn,Confirmed,Conditionally Confirmed,Admissions Endorsed Confirmed,Deferral,Enrolled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Do_Not_Route__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS 2nd Unapproved Time Stamp</fullName>
        <actions>
            <name>CS 2nd Unapproved Time Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;CS Unapproved by Second Viewer&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS 2nd Unapproved User Stamp</fullName>
        <actions>
            <name>CS Approved Time Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;CS Unapproved by Second Viewer&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS Approved Time Stamp</fullName>
        <actions>
            <name>Set CS Approved Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;CS Approved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS Approved User Stamp</fullName>
        <actions>
            <name>CS Approved User Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;CS Approved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS Unapproved Time Stamp</fullName>
        <actions>
            <name>CS Unapproved Time Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;CS Unapproved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CS Unapproved User Stamp</fullName>
        <actions>
            <name>CS Unapproved User Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;CS Unapproved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CV Unapproved 15 days</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Resume_Status__c</field>
            <operation>equals</operation>
            <value>CS Unapproved,TS Unapproved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact %28Germany%29-wants to be contacted by EF</fullName>
        <actions>
            <name>Contact %28Germnay%29-Wants to be contacted by EF</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Want_to_be_contacted_by_EF__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Country_Of_Residence_Name__c</field>
            <operation>contains</operation>
            <value>Germany</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Former_Lead__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact %28Kazakhstan%29-wants to be contacted by EF</fullName>
        <actions>
            <name>Contact %28Kazakhstan%29-wants to be contacted by EF</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Want_to_be_contacted_by_EF__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Country_Of_Residence_Name__c</field>
            <operation>contains</operation>
            <value>Kazakhstan</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Former_Lead__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact %28Other Countries%29-wants to be contacted by EF</fullName>
        <actions>
            <name>Contact %28Other Country%29-wants to be contacted by EF</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Want_to_be_contacted_by_EF__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Former_Lead__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Country_Of_Residence_Name__c</field>
            <operation>notContain</operation>
            <value>Russia,Kazakhstan,Germany</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact %28Russia%29-Wants to be contacted by EF</fullName>
        <actions>
            <name>Wants to be Contacted By EF-Applicant Email Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Want_to_be_contacted_by_EF__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Former_Lead__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Country_Of_Residence_Name__c</field>
            <operation>contains</operation>
            <value>Russia</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Copy Applicant Email to Email</fullName>
        <actions>
            <name>Copy %3Aapplicant Email to Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>By SHS : i have done changes so that when contact is created directly and email value is null applicant email is copied to Email (this is happening on lead convert but not on direct create)</description>
        <formula>AND(ISBLANK(Email), Email &lt;&gt; Applicant_Email__c,CONTAINS($Setup.contact_RT__c.Rec_Type__c, RecordTypeId ))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Copy Email to Applicant Email Address</fullName>
        <actions>
            <name>Contact%3ACopy Email to Applicant Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>change : shs, Added condition to add Email to Applicant Email if they are not equal</description>
        <formula>AND(CONTAINS($Setup.contact_RT__c.Rec_Type__c, RecordTypeId ), NOT(CONTAINS(Stage__c , &apos;Confirmed&apos;)),NOT(ISBLANK(Email)), OR(Email &lt;&gt; Applicant_Email__c,ISBLANK(Applicant_Email__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Delayed Assign Contact to new Owner</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Apply_Routing_Type__c</field>
            <operation>notEqual</operation>
            <value>Recruiting</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Do_Not_Route__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Florida%2FUS to region Lat Am</fullName>
        <actions>
            <name>Region to Lat Am</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Country_Of_Residence_Name__c</field>
            <operation>equals</operation>
            <value>United States</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingState</field>
            <operation>equals</operation>
            <value>Florida</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Program_Parsed__c</field>
            <operation>startsWith</operation>
            <value>m</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Program_Parsed__c</field>
            <operation>notContain</operation>
            <value>mba</value>
        </criteriaItems>
        <description>To update the region on records containing state=Florida and CoR=United States</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Last Lead Scoring Activity</fullName>
        <actions>
            <name>Last Lead Scoring Activity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.contact_RT__c.Rec_Type__c, RecordTypeId )&amp;&amp;OR( AND( NOT( ISBLANK( Last_Campus_Visit__c ) ) , ISCHANGED(Last_Campus_Visit__c)), AND( NOT( ISBLANK( Last_Downloaded_Brochure__c ) ) , ISCHANGED(Last_Downloaded_Brochure__c ) ),  AND( NOT( ISBLANK( Last_Requested_Brochure__c  ) ) , ISCHANGED(Last_Requested_Brochure__c ) ),  AND( NOT( ISBLANK(  Last_Event_SignUp__c  ) ) , ISCHANGED(Last_Event_SignUp__c ) ),  AND( NOT( ISBLANK(Last_Hult_GMAT__c  ) ) , ISCHANGED(Last_Hult_GMAT__c )),   AND( NOT( ISBLANK(Last_Hult_SAT__c  ) ) , ISCHANGED(Last_Hult_SAT__c )  ),  AND( NOT( ISBLANK( Last_Email_Received__c   ) ) , ISCHANGED(Last_Email_Received__c )  ),   AND( NOT( ISBLANK( Last_Email_Viewed__c  ) ) , ISCHANGED(Last_Email_Viewed__c  )  ),   AND( NOT( ISBLANK( Last_Email_Clicked_Through__c ) ) , ISCHANGED(Last_Email_Clicked_Through__c )  ),   AND( NOT( ISBLANK( Last_Website_Visit__c ) ) , ISCHANGED(Last_Website_Visit__c )  ),  AND( NOT( ISBLANK( Last_Contact_Us__c ) ) , ISCHANGED(Last_Contact_Us__c )  ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New CV Loaded</fullName>
        <actions>
            <name>Update Resume Status to New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(ts2__Resume_Last_Updated__c) &amp;&amp; $User.ProfileId=&quot;00eU0000000IrdI&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Partner Contact</fullName>
        <actions>
            <name>New Partner Email Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Contact Pertner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Contact.Program_Parsed__c</field>
            <operation>equals</operation>
            <value>BBA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingCity</field>
            <operation>equals</operation>
            <value>Boston</value>
        </criteriaItems>
        <description>For Germans team to be aware on.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Patial Lead Score STAMP</fullName>
        <actions>
            <name>Patial Lead Score STAMP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>PRIORVALUE( Stage__c ) = &apos;In Progress&apos; &amp;&amp; Stage__c = &apos;Partial Application&apos; &amp;&amp; ISCHANGED(Stage__c )
&amp;&amp; CONTAINS($Setup.contact_RT__c.Rec_Type__c,RecordTypeId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Primary Lead Source</fullName>
        <actions>
            <name>Populate Contact Primary Lead Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.First_Touch_Point_Source__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Pre TS Talent Pool Stamps</fullName>
        <actions>
            <name>Pre TS Talent Pool User Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pre-TS Talent Pool Time Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Captures the Date and Time  and User of the last time that a user checked on the Pre-TS Talent Pool checkbox.</description>
        <formula>CR_Pre_Talent_TS_Pool__c == TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SalutationDefaultFemale</fullName>
        <actions>
            <name>SetTitleFe-Male</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Salutation</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Gender__c</field>
            <operation>equals</operation>
            <value>Female</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Applicant Interest</fullName>
        <actions>
            <name>Set Applicant Interest</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( Stage__c = &apos;Qualified Lead&apos;,Stage__c = &apos;In Progress&apos;) &amp;&amp; ischanged(Application_Sub_Stage__c ) &amp;&amp; Application_Sub_Stage__c &lt;&gt; &apos;&apos; &amp;&amp; Application_Sub_Stage__c &lt;&gt; &apos;Working to Complete App&apos; &amp;&amp; Application_Sub_Stage__c &lt;&gt; &apos;Completed Application&apos; &amp;&amp; Application_Sub_Stage__c &lt;&gt; &apos;Not Completing App&apos;  &amp;&amp; Application_Sub_Stage__c &lt;&gt; &apos;Pending Test(s)&apos; &amp;&amp; Application_Sub_Stage__c &lt;&gt; &apos;WTC - Low Activity&apos;
&amp;&amp; CONTAINS($Setup.contact_RT__c.Rec_Type__c, RecordTypeId )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Applicant Owner to Recruiter if No Agent Activity for 7 Days</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Last_Log_In__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Agent_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Resets the owner of the application to a Recruiter if there is no activity for 7 days on a App owned by an Agent</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Five9 Formatted Phone Number - eBrochure</fullName>
        <active>true</active>
        <formula>if(ISCHANGED(  Phone )  || ISNEW(),TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Start Term%3A2011</fullName>
        <actions>
            <name>Applicant%3ASet Start Term 2011</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>contains</operation>
            <value>September 2011</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Start Term%3A2012</fullName>
        <actions>
            <name>Applicant%3ASet Start Term 2012</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>contains</operation>
            <value>September 2012</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Start Term%3A2013</fullName>
        <actions>
            <name>Applicant%3ASet Start Term 2013</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>contains</operation>
            <value>September 2013</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Start Term%3A2014</fullName>
        <actions>
            <name>Applicant%3ASet Start Date 2014</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.OP_Start_Term__c</field>
            <operation>contains</operation>
            <value>September 2014</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Sync HCP campus %26 Program</fullName>
        <actions>
            <name>Sync HCP Campus</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sync HCP Program</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This rule keeps the Hult Campus field in sync with Campus (parsed from Program) &amp; Hult Program field in sync with Program Parsed</description>
        <formula>AND(NOT( HULT_Campus_Change__c ),OR ( Campus_parsed_from_Program__c &lt;&gt;  Hult_Campus__c,  Program_Parsed__c &lt;&gt;  Hult_Program__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TS Talent Pool Time Stamp</fullName>
        <actions>
            <name>TS Talent Pool Time Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;TS Talent Pool&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TS Talent Pool User Stamp</fullName>
        <actions>
            <name>TS Talent Pool User Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;TS Talent Pool&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TS Unapproved Time Stamp</fullName>
        <actions>
            <name>TS Unapproved Time Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;TS Unapproved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TS Unapproved User Stamp</fullName>
        <actions>
            <name>TS Unapproved User Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL(Resume_Status__c, &quot;TS Unapproved&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TransferNationality</fullName>
        <actions>
            <name>TransferNationality</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>TransferNationality2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update JS First Last Name</fullName>
        <actions>
            <name>Update First Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update Last name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT($User.ProfileId =&quot;00eU0000000IrdI&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Resume Status to CS Approved</fullName>
        <actions>
            <name>Resume Status %3D CS Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( ts2__Resume_Last_Updated__c ) &amp;&amp;   $User.ProfileId = &quot;00eU0000000Ircj&quot; &amp;&amp; (ISPICKVAL( Resume_Status__c ,&quot;TS Unapproved&quot;) || ISPICKVAL( Resume_Status__c ,&quot;TS Talent Pool&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update SFDC First Last Name</fullName>
        <actions>
            <name>Update SFDC First Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update SFDC Last Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>$User.ProfileId =&quot;00eU0000000IrdI&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ts2__People Status Update</fullName>
        <actions>
            <name>ts2__People Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ts2__People_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>This will update the People Status to active when one is created through TalentStaffing or through an Import when not populated.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
