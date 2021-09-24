<apex:page Controller="mainVendorController" recordSetVar="vendors">
  <apex:pageBlock title="Vendors View for Service Administrators">
    <apex:form >
      <apex:pageBlockTable value="{!vendors}" var="a" id="list">
        <apex:column value="{!a.name__c}"/>
        <apex:column value="{!a.vendortype__c}"/>
        <apex:column value="{!a.contactinfo__c}"/>
      </apex:pageBlockTable>
    </apex:form>
  </apex:pageBlock>
</apex:page>