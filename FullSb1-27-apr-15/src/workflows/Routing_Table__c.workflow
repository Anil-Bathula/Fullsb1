<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set Lower Bound</fullName>
        <field>Lower_Bound__c</field>
        <formula>Postal_Code__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set Upper Bound</fullName>
        <field>Upper_Bound__c</field>
        <formula>Postal_Code__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Lower and Upper Bound</fullName>
        <actions>
            <name>Set Lower Bound</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set Upper Bound</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Routing_Table__c.Postal_Code__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
