<aura:application extends="force:slds">
    <lightning:tabset variant="scoped">
        <lightning:tab label="Home">
            <c:homePage />
        </lightning:tab>
        <lightning:tab label="Property Owners">
            <c:propertyOwner />
        </lightning:tab>
        <lightning:tab label="Tenant Information">
            <c:TenantInformation />
        </lightning:tab>
        <lightning:tab label="Tenant Complaints">
            <c:TenantIssues />
        </lightning:tab>
        <lightning:tab label="Marketing List">
            <c:PropertyList />
        </lightning:tab>
        <lightning:tab label="Maintenance Vendors">
            <c:maintenanceVendors />
        </lightning:tab>
        <lightning:tab label="Income Expense Reports">
            <c:incomeExpenseReports />
        </lightning:tab>
    </lightning:tabset>
</aura:application>	
