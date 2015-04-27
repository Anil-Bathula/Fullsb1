<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send Email to AAMs - BBA English Exam Supplied</fullName>
        <ccEmails>niccolo.delmonte@hult.edu</ccEmails>
        <protected>false</protected>
        <recipients>
            <field>AAM_Team_Member_Email__c</field>
            <type>email</type>
        </recipients>
        <template>Recruiter_Templates/Send_Email_to_AAMs_BBA_English_Exam_Supplied</template>
    </alerts>
    <fieldUpdates>
        <fullName>AAM Email</fullName>
        <field>AAM_Team_Member_Email__c</field>
        <formula>Opportunity__r.AAM_Team_Member__r.Email</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetApprovedDateToBlank</fullName>
        <field>Approved_Date__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetApprovedDateToToday</fullName>
        <field>Approved_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetIdentifierUnique</fullName>
        <field>Identifier_Unique__c</field>
        <formula>BLANKVALUE(RecordTypeId, &apos;&apos;) + &apos;:&apos; +
BLANKVALUE(Parent__r.Country__c, &apos;&apos;) + &apos;:&apos; +
BLANKVALUE(Parent__r.Department__c, &apos;&apos;) + &apos;:&apos; +
BLANKVALUE(Parent__r.Program__c, &apos;&apos;) + &apos;:&apos; +
BLANKVALUE(Opportunity__c, &apos;&apos;) + &apos;:&apos; +
BLANKVALUE(Name, &apos;&apos;)</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetSuppliedDateToBlank</fullName>
        <field>Supplied_Date__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetSuppliedDateToToday</fullName>
        <field>Supplied_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetUnlockedDateToBlank</fullName>
        <field>Unlocked_Date__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetUnlockedDateToToday</fullName>
        <field>Unlocked_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetVerifiedDateToBlank</fullName>
        <field>Verified_Date__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetVerifiedDateToToday</fullName>
        <field>Verified_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetWaivedDateToBlank</fullName>
        <field>Waived_Date__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Requirement_SetWaivedDateToToday</fullName>
        <field>Waived_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AAM Email to populate in Requirement record</fullName>
        <actions>
            <name>AAM Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Opportunity__r.AAM_Team_Member__c!=NULL &amp;&amp; Opportunity__r.Stage_HighLevel__c=&apos;Partial&apos; &amp;&amp; AAM_Team_Member_Email__c!= Opportunity__r.AAM_Team_Member__r.Email</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Requirement test</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Requirement__c.Name</field>
            <operation>contains</operation>
            <value>professional recommendation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Requirement__c.Supplied__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Email to AAMs - BBA English Exam Supplied</fullName>
        <actions>
            <name>Send Email to AAMs - BBA English Exam Supplied</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>Name = &apos;Language Proficiency, English&apos;
&amp;&amp;
ischanged(Supplied__c)
&amp;&amp;
 not(isblank(Opportunity__r.AAM_Team_Member__c))
&amp;&amp;
Supplied__c = TRUE
&amp;&amp;
 Opportunity_Program_Department__c = &apos;BIBA&apos;
&amp;&amp;
OR(
 ispickval(Opportunity__r.StageName, &apos;Accepted&apos;),
 ispickval(Opportunity__r.StageName, &apos;Conditionally Accepted&apos;),
 ispickval(Opportunity__r.StageName, &apos;Confirmed&apos;),
 ispickval(Opportunity__r.StageName, &apos;Conditionally Confirmed&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Approved Date%3A To Blank</fullName>
        <actions>
            <name>Requirement_SetApprovedDateToBlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Approved__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Approved Date%3A To Today</fullName>
        <actions>
            <name>Requirement_SetApprovedDateToToday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Approved__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Requirement__c.Approved_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Identifier %28Unique%29</fullName>
        <actions>
            <name>Requirement_SetIdentifierUnique</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Opportunity__c)) &amp;&amp; NOT(ISBLANK(Parent__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Supplied Date%3A To Blank</fullName>
        <actions>
            <name>Requirement_SetSuppliedDateToBlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Supplied__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Supplied Date%3A To Today</fullName>
        <actions>
            <name>Requirement_SetSuppliedDateToToday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Supplied__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Requirement__c.Supplied_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Unlocked Date%3A To Blank</fullName>
        <actions>
            <name>Requirement_SetUnlockedDateToBlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Unlocked__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Unlocked Date%3A To Today</fullName>
        <actions>
            <name>Requirement_SetUnlockedDateToToday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Unlocked__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Verified Date%3A To Blank</fullName>
        <actions>
            <name>Requirement_SetVerifiedDateToBlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Verified__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Verified Date%3A To Today</fullName>
        <actions>
            <name>Requirement_SetVerifiedDateToToday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Verified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Requirement__c.Verified_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Waived Date%3A To Blank</fullName>
        <actions>
            <name>Requirement_SetWaivedDateToBlank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Waived__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Waived Date%3A To Today</fullName>
        <actions>
            <name>Requirement_SetWaivedDateToToday</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Requirement__c.Waived__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Requirement__c.Waived_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
