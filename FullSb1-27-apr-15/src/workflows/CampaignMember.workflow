<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Contact us auto reply email</fullName>
        <ccEmails>daniel.bjarne@ef.com</ccEmails>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <template>Hult_Email_Templates/test</template>
    </alerts>
    <alerts>
        <fullName>ebrochure_Trigger_Test_Alert</fullName>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <template>ts2__System_Templates/ebrochure_Trigger_Test</template>
    </alerts>
    <fieldUpdates>
        <fullName>Lead Source field update</fullName>
        <description>Update lead source text field with the value of its associated formula field</description>
        <field>Lead_Source__c</field>
        <formula>Lead_Source_Formula__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Member Created Last 24 Hours Update</fullName>
        <description>Update this the custom formula field to its associated custom text field.</description>
        <field>Member_Created_Within_Last_24_Hours__c</field>
        <formula>Member_Created_Within_Last_24_Hours_For__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update CampaignMember Registered DT</fullName>
        <field>Registered_DateTime__c</field>
        <formula>now()</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Lead ID</fullName>
        <description>Update Lead ID with the value of the standard Lead ID field. Standard Lead ID field label appears as &apos;Lead/Contact ID&apos; in Campaign Member reports but needs to be just &apos;Lead ID&apos; for Exact Target to</description>
        <field>Lead_ID__c</field>
        <formula>LeadId</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>%5Bodsifj</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Lon__c</field>
            <operation>equals</operation>
            <value>87655</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Contact us - auto reply</fullName>
        <actions>
            <name>Contact us auto reply email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Campaign.Name</field>
            <operation>equals</operation>
            <value>Contact Us</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Custom Formula Fields to Text</fullName>
        <actions>
            <name>Lead Source field update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Member Created Last 24 Hours Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update Lead ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.CreatedDate</field>
            <operation>notEqual</operation>
            <value>1/1/1900 5:53 AM</value>
        </criteriaItems>
        <description>Field update to populate the custom text fields with their associated custom formula field.   Needed because custom formula fields cannot be used in a Campaign Members report.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update RegisteredDate</fullName>
        <actions>
            <name>Update CampaignMember Registered DT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.RecordTypeId</field>
            <operation>equals</operation>
            <value>Event</value>
        </criteriaItems>
        <criteriaItems>
            <field>CampaignMember.Status</field>
            <operation>equals</operation>
            <value>Registered,Fair Registered,Fair Registered - Hult Website</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update holding values on Campaign Member</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Campaign.RecordTypeId</field>
            <operation>equals</operation>
            <value>Event</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
