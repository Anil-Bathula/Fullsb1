<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Comments Created</fullName>
        <field>Comment_Created_from__c</field>
        <formula>&apos;Lead&apos;</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Role</fullName>
        <field>Role__c</field>
        <formula>$UserRole.Name</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Role</fullName>
        <actions>
            <name>Comments Created</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Role</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Lead__c !=null &amp;&amp; Applicant__c ==null&amp;&amp; Application__c ==null&amp;&amp; Finance__c ==null</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
