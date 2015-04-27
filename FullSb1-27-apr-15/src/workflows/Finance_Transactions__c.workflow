<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Finance Transaction%3A Notify Applicant Tuition Payment has been Received</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Applicant_Tuition_Payment_has_been_Received</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Agent Un-successful Deposit Payment via Credit Card</fullName>
        <protected>false</protected>
        <recipients>
            <field>OP_Agent_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>OP_Indirect_Manager_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_agent_Unsuccessful_Deposit_Payment_via_Credit_Card</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Recruiter HK Finance Wire Transfer  Not Successful</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_HK_Finance_Wire_Transfer_Failure</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Recruiter HK Finance Wire Transfer Success</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_HK_Finance_Wire_Transfer_Success</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Recruiter Successful Deposit Payment via Credit Card</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_Successful_Deposit_Payment_via_Credit_Card</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Recruiter Successful Deposit Payment via Credit Card</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_Successful_Deposit_Payment_via_Credit_Card</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Recruiter Un-successful Deposit Payment via Credit Card</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_Un_Successful_Deposit_Payment_via_Credit_Card</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify Recruiter and Agent Successful Deposit Payment via Credit Card</fullName>
        <protected>false</protected>
        <recipients>
            <field>OP_Agent_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>OP_Indirect_Manager_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_Successful_Deposit_Payment_via_Credit_Card</template>
    </alerts>
    <alerts>
        <fullName>Finance Transaction%3ANotify RecruiterSuccessful Deposit Payment via Credit Card</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_Successful_Deposit_Payment_via_Credit_Card</template>
    </alerts>
    <alerts>
        <fullName>Finance Trasaction%3ANotify Applicant Confirmation Deposit has been Received</fullName>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Applicant_Confirmation_Deposit_has_been_Received</template>
    </alerts>
    <alerts>
        <fullName>Notify Recruiter and Agent HK Finance Wire Transfer Success</fullName>
        <protected>false</protected>
        <recipients>
            <field>OP_Agent_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>OP_Indirect_Manager_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <template>Hult_Email_Templates/Notify_Recruiter_HK_Finance_Wire_Transfer_Success</template>
    </alerts>
    <fieldUpdates>
        <fullName>Fin Trans%3ASet Agent Email Address</fullName>
        <field>OP_Agent_Email_Address__c</field>
        <formula>Finance__r.Opportunity__r.OP_Agent_Email_Address__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fin Trans%3ASet Indirect Manger Email Adde</fullName>
        <field>OP_Indirect_Manager_Email_Address__c</field>
        <formula>Finance__r.Opportunity__r.OP_Indirect_Manager_Email_Address__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FinTrans%3ASet Tran Status to Timed Out</fullName>
        <field>Transaction_Status__c</field>
        <literalValue>Transaction Timed Out</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance Transaction</fullName>
        <field>Amount_Received__c</field>
        <formula>OP_Deposit_Amount_Du__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance Transaction%3ASet App Fee Amt Paid</fullName>
        <field>Amount_Received__c</field>
        <formula>OP_Application_Fee_Due__c</formula>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Finance Transaction%3ASet Trans Stat Manua</fullName>
        <field>Transaction_Status__c</field>
        <literalValue>Manually Processed</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>When Confirmation Deposit is Successfull</fullName>
        <field>Confirmation_Deposit_Paid__c</field>
        <literalValue>1</literalValue>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Finance__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Credit Card Transaction Timeout</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>equals</operation>
            <value>CC CHARGED VIA Salesforce</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Pending</value>
        </criteriaItems>
        <description>When a Credit Card Transaction via Salesforce is in the Pending state for at least an hour, the status will be set to Transaction Timed Out</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Transaction%3A Notify Agent Successful Deposit Payment via Credit Card</fullName>
        <actions>
            <name>Finance Transaction%3ANotify Recruiter and Agent Successful Deposit Payment via Credit Card</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>startsWith</operation>
            <value>CC CHARGED VIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.OP_Agent_Email_Address__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>notEqual</operation>
            <value>Decline</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Transaction%3A Notify Agent Un-successful Deposit Payment via Credit Card</fullName>
        <actions>
            <name>Finance Transaction%3ANotify Agent Un-successful Deposit Payment via Credit Card</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>4 AND 2 AND 3 AND 1</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>startsWith</operation>
            <value>CC CHARGED VIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.OP_Agent_Email_Address__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Decline</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Transaction%3A Notify Recruiter Finance Wire Transfer Success</fullName>
        <actions>
            <name>Finance Transaction%3ANotify Recruiter HK Finance Wire Transfer Success</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>4 AND 1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>contains</operation>
            <value>Wire Transfer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.OP_Agent_Email_Address__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Transaction%3A Notify Recruiter Finance Wire Transfer Un-success</fullName>
        <actions>
            <name>Finance Transaction%3ANotify Recruiter HK Finance Wire Transfer  Not Successful</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>4 AND 1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>contains</operation>
            <value>Wire Transfer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.OP_Agent_Email_Address__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Decline</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Transaction%3A Notify Recruiter Un-successful Deposit Payment via Credit Card</fullName>
        <actions>
            <name>Finance Transaction%3ANotify Recruiter Un-successful Deposit Payment via Credit Card</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>4 AND 1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>startsWith</operation>
            <value>CC CHARGED VIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.OP_Agent_Email_Address__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Decline</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Finance Transaction%3ANotify Recruiter Successful Deposit Payment via Credit Card</fullName>
        <actions>
            <name>Finance Transaction%3ANotify Recruiter Successful Deposit Payment via Credit Card</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>startsWith</operation>
            <value>CC CHARGED VIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Applicant Confirmation Deposit has been Received</fullName>
        <actions>
            <name>Finance Trasaction%3ANotify Applicant Confirmation Deposit has been Received</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success,Manually Processed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Applicant Tuition Payment has been Received</fullName>
        <actions>
            <name>Finance Transaction%3A Notify Applicant Tuition Payment has been Received</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Tuition Fee Payment</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success,Manually Processed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PaytoStudy Transaction Timeout</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>PtS 2nd Payment,PtS 1st Payment</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Pending</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>equals</operation>
            <value>PaytoStudy</value>
        </criteriaItems>
        <description>When a PaytoStudy Transaction via Salesforce is in the Pending state for at least 24 hours, the status will be set to Transaction Timed Out</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Agent and Indirect Manager Email address</fullName>
        <actions>
            <name>Fin Trans%3ASet Agent Email Address</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Fin Trans%3ASet Indirect Manger Email Adde</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Finance_Transactions__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set App Fee Paid</fullName>
        <actions>
            <name>Finance Transaction%3ASet App Fee Amt Paid</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Application Fee</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>equals</operation>
            <value>Manual Transaction,CC CHARGED VIA Salesforce,CC CHARGED VIA HK,Manual Credit Card</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set App ID on Finance Transaction</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Finance_Transactions__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Deposit Amount Paid for SixCards CC Transactions</fullName>
        <actions>
            <name>Finance Transaction</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Error_Code__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>equals</operation>
            <value>CC CHARGED VIA Salesforce</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Transaction Status to Manual</fullName>
        <actions>
            <name>Finance Transaction%3ASet Trans Stat Manua</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Method__c</field>
            <operation>equals</operation>
            <value>CC CHARGED VIA HK,Manual Credit Card,Wire Transfer,From Top Apply</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>When Confirmation Deposit is Successfully made%2C update Confirmation Deposit Paid%3F field</fullName>
        <actions>
            <name>When Confirmation Deposit is Successfull</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>equals</operation>
            <value>Confirmation Deposit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Type__c</field>
            <operation>contains</operation>
            <value>Program Fee</value>
        </criteriaItems>
        <criteriaItems>
            <field>Finance_Transactions__c.Transaction_Status__c</field>
            <operation>equals</operation>
            <value>Success</value>
        </criteriaItems>
        <description>When Confirmation Deposit is Successfully made via CC, manually or wire transfer, auto update Confirmation Deposit Paid? field. Doing this in order to have Acceptance Letters populate correctly.

-MS Jan 2014</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
