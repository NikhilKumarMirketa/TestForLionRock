<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Test approval process</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>contains</operation>
            <value>Nikhil</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
