<aura:application extends="force:slds">
    <lightning:tabset variant="scoped">
        <lightning:tab label="Maintenance Vendors">
            <c:maintenanceVendors />
        </lightning:tab>
        <lightning:tab label="Income Expense Reports">
            <c:incomeExpenseReports />
        </lightning:tab>
        <lightning:tab label="Tenant Information">
            <c:TenantInformation />
        </lightning:tab>
        <lightning:tab label="Marketing List">
            <c:MarketingList />
        </lightning:tab>
        <lightning:tab label="Property Owners">
            <c:propertyOwner />
        </lightning:tab>
    </lightning:tabset>
</aura:application>	
