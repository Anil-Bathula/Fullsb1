<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Outdated Exam Date</fullName>
        <protected>false</protected>
        <recipients>
            <field>Application_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Converter__c</field>
            <type>userLookup</type>
        </recipients>
        <template>Hult_Email_Templates/Outdated_Test_Date</template>
    </alerts>
    <fieldUpdates>
        <fullName>EXAM%3ASet Verified Date to Blank</fullName>
        <field>Verified_Date__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Exam%3ASet Verified Date to Today</fullName>
        <field>Exam_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Exam%3ASet Verified Date to Today2</fullName>
        <field>Verified_Date__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Outdated %2B1%2B7 FLAG to FALSE</fullName>
        <field>Outdated_Test_1_to_7_days_FLAG__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Outdated %2B1%2B7 FLAG to TRUE</fullName>
        <field>Outdated_Test_1_to_7_days_FLAG__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Outdated Test FLAG to FALSE</fullName>
        <field>Outdated_Test_FLAG__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Outdated Test FLAG to TRUE</fullName>
        <field>Outdated_Test_FLAG__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Outdated Test Reminder FLAG to FALSE</fullName>
        <field>Outdated_Test_Reminder_FLAG__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Outdated Test Reminder FLAG to TRUE</fullName>
        <field>Outdated_Test_Reminder_FLAG__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Stage Auto FLAG to FALSE</fullName>
        <field>Application_Stage_Auto_Update_FLAG__c</field>
        <literalValue>0</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Outdated Planned Test Date AutoEMAIL</fullName>
        <actions>
            <name>Outdated Exam Date</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Set Outdated Test FLAG to FALSE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Exam_Score__c=&quot;&quot; &amp;&amp;  (Stage__c = &quot;Conditionally Confirmed&quot;  ||  Stage__c = &quot;Soft Rejected Confirmed&quot;) &amp;&amp;  not(ISBLANK(Planned_Test_Date__c)) &amp;&amp;   Outdated_Test_FLAG__c = TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Outdated Planned Test Date Reminder AutoEMAIL</fullName>
        <actions>
            <name>Set Outdated Test Reminder FLAG to FALSE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Exam_Score__c=&quot;&quot; &amp;&amp;  (Stage__c = &quot;Conditionally Confirmed&quot;  ||  Stage__c = &quot;Soft Rejected Confirmed&quot;) &amp;&amp;  not(ISBLANK(Planned_Test_Date__c)) &amp;&amp;   Outdated_Test_Reminder_FLAG__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Outdated Planned Test Date triggers %28%2B1 day%29</fullName>
        <actions>
            <name>Set Stage Auto FLAG to FALSE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>not(isblank( Planned_Test_Date__c )) &amp;&amp; OR(Stage__c = &apos;Conditionally Confirmed&apos;, Stage__c = &apos;Soft Rejected Confirmed&apos;) &amp;&amp;  Application_Stage_Auto_Update_FLAG__c = TRUE &amp;&amp;  Planned_Test_Date__c + 1 &gt;= today()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outdated Planned Test Date triggers %28%2B7 days%29</fullName>
        <actions>
            <name>Set Outdated %2B1%2B7 FLAG to FALSE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Exam__c.Planned_Test_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Exam__c.Stage__c</field>
            <operation>equals</operation>
            <value>Conditionally Confirmed,Soft Rejected Confirmed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Exam__c.Outdated_Test_1_to_7_days_FLAG__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Verified Date to Blank%3AExam</fullName>
        <actions>
            <name>EXAM%3ASet Verified Date to Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Exam__c.Verified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Verified Date to Today%3AExam</fullName>
        <actions>
            <name>Exam%3ASet Verified Date to Today2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Exam__c.Verified__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
