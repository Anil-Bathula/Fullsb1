<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set Bounce Date to Blank</fullName>
        <field>Date_Bounced__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Open Date to Blank</fullName>
        <field>Date_Time_Opened__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Unsubscribe Date to Blank</fullName>
        <field>Date_Unsubscribed__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>IER Set Bounce Date Field to Blank</fullName>
        <actions>
            <name>Set Bounce Date to Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>xtma_Individual_Email_Result__c.Date_Bounced__c</field>
            <operation>equals</operation>
            <value>1/1/1900 11:53 AM</value>
        </criteriaItems>
        <description>If Bounce Date = 01/01/1900 then set it to blank</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>IER Set Open Date field to Blank</fullName>
        <actions>
            <name>Set Open Date to Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>xtma_Individual_Email_Result__c.Date_Time_Opened__c</field>
            <operation>equals</operation>
            <value>1/1/1900 11:53 AM</value>
        </criteriaItems>
        <description>Replace &apos;01/01/1900 00:00&apos; to blank on creation of new record</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>IER Set Unsubscribe Date field to Blank</fullName>
        <actions>
            <name>Set Unsubscribe Date to Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>xtma_Individual_Email_Result__c.Date_Unsubscribed__c</field>
            <operation>equals</operation>
            <value>1/1/1900 11:53 AM</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
