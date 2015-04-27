<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ACCEPTANCE LETTER%3ASet Date To Today</fullName>
        <field>Date_Letter_Sent_Attached__c</field>
        <formula>TODAY()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Acceptance Letter For Populator</fullName>
        <field>Acceptance_Letter__c</field>
        <formula>Application__r.Contact__r.FirstName &amp;&quot; &quot;&amp;  Application__r.Contact__r.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Acceptance Letter%3A Set Acceptance Letter</fullName>
        <field>Acceptance_Letter__c</field>
        <formula>Application__r.Contact__r.FirstName  + &quot; &quot; + Application__r.Contact__r.LastName</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>acceptance letter%3A add title</fullName>
        <field>Acceptance_Letter__c</field>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Acceptance Letter For Populator</fullName>
        <actions>
            <name>Acceptance Letter For Populator</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Acceptance_Letter__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Acceptance Letter For Populator</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Date Sent%2FAttached</fullName>
        <actions>
            <name>ACCEPTANCE LETTER%3ASet Date To Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Acceptance_Letter__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Name on Acceptance Letter</fullName>
        <actions>
            <name>Acceptance Letter%3A Set Acceptance Letter</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>acceptance letter%3A add title</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Acceptance_Letter__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
