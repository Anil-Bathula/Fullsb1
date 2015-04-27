<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Campaign%3A Update Status to Completed</fullName>
        <description>To update the field &apos;Status&apos; on Campaign to Completed.</description>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Budget Cost %28EVENT%29</fullName>
        <field>BudgetedCost</field>
        <formula>IF(Text(Region__c)&lt;&gt;NULL &amp;&amp; 
OR(ISPICKVAL(Region__c,&quot;Global&quot;),ISPICKVAL(Region__c,&quot;Campus&quot;)), 
CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,5300, 
&quot;Campus Visit&quot;,0, 
&quot;Open House&quot;,1160, 
&quot;Educational Fair&quot;,3250, 
&quot;Info Session&quot;,800, 
&quot;Webinar&quot;,500, 
&quot;Visionary Speaker Series&quot;,35000,0), 

IF(Text(Region__c)&lt;&gt;NULL &amp;&amp; 
OR(ISPICKVAL(Region__c,&quot;NA&quot;),ISPICKVAL(Region__c,&quot;LA&quot;)), 
CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,4780, 
&quot;Campus Visit&quot;,0, 
&quot;Open House&quot;,1400, 
&quot;Educational Fair&quot;,3250, 
&quot;Info Session&quot;,800, 
&quot;Webinar&quot;,640, 
&quot;Visionary Speaker Series&quot;,35000,0), 

IF(Text(Region__c)&lt;&gt;NULL &amp;&amp; 
OR(ISPICKVAL(Region__c,&quot;MEA&quot;),ISPICKVAL(Region__c,&quot;AS&quot;)), 
CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,5300, 
&quot;Campus Visit&quot;,0, 
&quot;Open House&quot;,1160,&quot;Educational Fair&quot;,3250,&quot;Info Session&quot;,800,&quot;Webinar&quot;,500,&quot;Visionary Speaker Series&quot;,35000,0), 

IF(Text(Region__c)&lt;&gt;NULL &amp;&amp; 
ISPICKVAL(Region__c,&quot;EU&quot;), 
CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,5300, 
&quot;Campus Visit&quot;,0, 
&quot;Open House&quot;,1400,&quot;Educational Fair&quot;,3250,&quot;Info Session&quot;,800,&quot;Webinar&quot;,640,&quot;Visionary Speaker Series&quot;,35000,0),0))))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Budget Cost %28EVENT%29</fullName>
        <field>BudgetedCost</field>
        <formula>IF(Text(Region__c)&lt;&gt;NULL &amp;&amp;
	OR(ISPICKVAL(Region__c,&quot;Global&quot;),ISPICKVAL(Region__c,&quot;Campus&quot;)),
		CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,5300,
			&quot;Campus Visits&quot;,0,
			&quot;Open House&quot;,1160,
			&quot;Educational Fair&quot;,3250,
			&quot;Info Session&quot;,800,
			&quot;Webinar&quot;,500,
			&quot;Visionary Speaker Series&quot;,35000,0),

IF(Text(Region__c)&lt;&gt;NULL &amp;&amp; 
	OR(ISPICKVAL(Region__c,&quot;NA&quot;),ISPICKVAL(Region__c,&quot;LA&quot;)),
		CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,4780,
			&quot;Campus Visits&quot;,0,
			&quot;Open House&quot;,1400,
			&quot;Educational Fair&quot;,3250,
			&quot;Info Session&quot;,800,
			&quot;Webinar&quot;,640,
			&quot;Visionary Speaker Series&quot;,35000,0),
IF(Text(Region__c)&lt;&gt;NULL &amp;&amp;
   OR(ISPICKVAL(Region__c,&quot;MEA&quot;),ISPICKVAL(Region__c,&quot;Asia&quot;)),
			CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,5300,
			&quot;Campus Visits&quot;,0,
			&quot;Open House&quot;,1160,&quot;Educational Fair&quot;,3250,&quot;Info Session&quot;,800,&quot;Webinar&quot;,500,&quot;Visionary Speaker Series&quot;,35000,0),
IF(Text(Region__c)&lt;&gt;NULL &amp;&amp;
   ISPICKVAL(Region__c,&quot;EU&quot;),
			CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,5300,
			&quot;Campus Visits&quot;,0,
			&quot;Open House&quot;,1400,&quot;Educational Fair&quot;,3250,&quot;Info Session&quot;,800,&quot;Webinar&quot;,640,&quot;Visionary Speaker Series&quot;,35000,0),0))))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update Budget Cost %28Staff%29</fullName>
        <field>Budgeted_Cost_Staff__c</field>
        <formula>IF(Text(Region__c)&lt;&gt;NULL &amp;&amp;
	OR(ISPICKVAL(Region__c,&quot;Global&quot;),ISPICKVAL(Region__c,&quot;Campus&quot;)),
		CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,3315,
			&quot;Campus Visits&quot;,35,
			&quot;Open House&quot;,2120,
			&quot;Educational Fair&quot;,4140,
			&quot;Info Session&quot;,2230,
			&quot;Webinar&quot;,640,
			&quot;Visionary Speaker Series&quot;,4015,0),

IF(Text(Region__c)&lt;&gt;NULL &amp;&amp; 
	OR(ISPICKVAL(Region__c,&quot;NA&quot;),ISPICKVAL(Region__c,&quot;LA&quot;)),
		CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,3315,
			&quot;Campus Visits&quot;,35,
			&quot;Open House&quot;,1320,
			&quot;Educational Fair&quot;,4140,
			&quot;Info Session&quot;,2230,
			&quot;Webinar&quot;,640,
			&quot;Visionary Speaker Series&quot;,4015,0),
IF(Text(Region__c)&lt;&gt;NULL &amp;&amp;
   OR(ISPICKVAL(Region__c,&quot;MEA&quot;),ISPICKVAL(Region__c,&quot;Asia&quot;)),
			CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,3315,
			&quot;Campus Visits&quot;,35,
			&quot;Open House&quot;,2120,
                        &quot;Educational Fair&quot;,4140,
                        &quot;Info Session&quot;,2230,
                        &quot;Webinar&quot;,640,
                        &quot;Visionary Speaker Series&quot;,4015,0),
IF(Text(Region__c)&lt;&gt;NULL &amp;&amp;
   ISPICKVAL(Region__c,&quot;EU&quot;),
			CASE( Campaign_Sub_Type__c,&quot;Experience Hult&quot;,3315,
			&quot;Campus Visits&quot;,35,
			&quot;Open House&quot;,2120,
                        &quot;Educational Fair&quot;,4140,
                        &quot;Info Session&quot;,2230,
                        &quot;Webinar&quot;,640,
                        &quot;Visionary Speaker Series&quot;,4015,0),0))))</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Budget Cost Update</fullName>
        <actions>
            <name>Update Budget Cost %28EVENT%29</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update Budget Cost %28Staff%29</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Region__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Budget Cost Update %28Event%29</fullName>
        <actions>
            <name>Update Budget Cost %28EVENT%29</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>RecordType.Name=&apos;Event&apos; &amp;&amp; OR(ISBLANK(BudgetedCost),  ISCHANGED( Campaign_Sub_Type__c), ISCHANGED(Organizer__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Budget Cost Update %28Staff%29</fullName>
        <actions>
            <name>Update Budget Cost %28Staff%29</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>RecordType.Name=&apos;Event&apos; &amp;&amp; OR(ISNULL(Budgeted_Cost_Staff__c),Budgeted_Cost_Staff__c=0)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Campaign set as completed when date is passed</fullName>
        <actions>
            <name>Campaign%3A Update Status to Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Campaign status set to Completed once date of event has passed</description>
        <formula>IF( TODAY()  &gt;  EndDate,true,false )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
