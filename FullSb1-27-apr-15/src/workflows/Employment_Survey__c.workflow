<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Campus text field update</fullName>
        <field>Campus__c</field>
        <formula>Campus_formula__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Campus text field update 2</fullName>
        <field>Campus__c</field>
        <formula>Campus_formula__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Campus Text Field Update</fullName>
        <actions>
            <name>Campus text field update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employment_Survey__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Displays the contacts &apos;hult campus&apos; field on the employment survey record.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Returning to previous employer</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Employment_Survey__c.Are_you_currently_looking_for_a_job__c</field>
            <operation>equals</operation>
            <value>I have already accepted an offer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Employment_Survey__c.What_are_you_doing_now__c</field>
            <operation>equals</operation>
            <value>Returning to my previous employer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
