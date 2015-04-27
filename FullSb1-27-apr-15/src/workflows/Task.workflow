<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set task as completed</fullName>
        <description>Use when brochure request date is inserted</description>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>BBA_Test_BrochreDL_Trigger_Email</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Brochure Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Program__c</field>
            <operation>equals</operation>
            <value>BIBA</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set brochure send date</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>Follow up brochure request</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Support request notification</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>Student Application Support Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
