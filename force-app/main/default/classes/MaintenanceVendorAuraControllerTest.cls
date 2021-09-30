@isTest
private class MaintenanceVendorAuraControllerTest {
    
    @TestSetup
    static void makeData(){
        //Create some branches.
        List<Branch__c> branches = new List<Branch__c>();
        branches.add(new Branch__c(Name = 'Branch1'));
        branches.add(new Branch__c(Name = 'Branch2'));
        branches.add(new Branch__c(Name = 'SomeOffBranch'));

        insert branches;

        //Create some Vendors
        List<Vendor__c> vendors = new List<Vendor__c>();
        vendors.add(new Vendor__c(Name = 'Carpet Cleaners A', Email__c = 'info@carpetcleaners.com', Specialty__c = 'Cleaning', Branch__c = branches[0].Id));
        vendors.add(new Vendor__c(Name = 'Carpet Cleaners B', Email__c = 'info2@carpetcleaners.com', Specialty__c = 'Cleaning', Branch__c = branches[1].Id));
        vendors.add(new Vendor__c(Name = 'Masonry Repairmen', Email__c = 'info@masonry.com', Specialty__c = 'Exterior Work', Branch__c = branches[0].Id));
        vendors.add(new Vendor__c(Name = 'Carpet Builders A', Email__c = 'info@carpetbuilders.com', Specialty__c = 'Flooring', Branch__c = branches[0].Id));
        vendors.add(new Vendor__c(Name = 'Carpet Builders B', Email__c = 'info2@carpetbuilders.com', Specialty__c = 'Flooring', Branch__c = branches[1].Id));
        vendors.add(new Vendor__c(Name = 'Super Mario Bros.', Email__c = 'info@nintendo.com', Specialty__c = 'Plumbing', Branch__c = branches[0].Id));
        vendors.add(new Vendor__c(Name = 'Bob Ross Enterprises', Email__c = 'bob@bobross.com', Specialty__c = 'Painting', Branch__c = branches[2].Id));

        insert vendors;
    }

    @isTest
    static void specialtiesTest() {
        List<String> specialtyList = MaintenanceVendorAuraController.getSpecialties();
        System.assert(specialtyList.contains('Cleaning'));
        System.assert(specialtyList.contains('Electrical Work'));
        System.assert(specialtyList.contains('Exterior Work'));
        System.assert(specialtyList.contains('Flooring'));
        System.assert(specialtyList.contains('HVAC'));
        System.assert(specialtyList.contains('Landscaping'));
        System.assert(specialtyList.contains('Paint'));
        System.assert(specialtyList.contains('Roofing'));
        System.assert(specialtyList.contains('Plumbing'));
        System.assertEquals(9, specialtyList.size());
    }

    @isTest
    static void vendorCountTest() {
        System.assertEquals(7, MaintenanceVendorAuraController.getVendorCount('', ''));
        System.assertEquals(0, MaintenanceVendorAuraController.getVendorCount('Bill', ''));
        System.assertEquals(2, MaintenanceVendorAuraController.getVendorCount('', 'Cleaning'));
        System.assertEquals(5, MaintenanceVendorAuraController.getVendorCount('b', ''));
        System.assertEquals(0, MaintenanceVendorAuraController.getVendorCount('Mario', 'Exterior Work'));
    }

    @isTest
    static void vendorListTest() {
        List<Vendor__c> vendorsWithMa = MaintenanceVendorAuraController.getVendorList('ma', '', '', 0, 0);
        System.assert(vendorsWithMa[0].Specialty__c.equals('Plumbing') || vendorsWIthMa[1].Specialty__c.equals('Plumbing'));

        List<Vendor__c> cleaningVendors = MaintenanceVendorAuraController.getVendorList('', 'Cleaning', 'Name', 0, 0);
        System.assertEquals('Carpet Cleaners B', cleaningVendors[1].Name);

        List<Vendor__c> vendorsSortedByBranch = MaintenanceVendorAuraController.getVendorList('', '', 'Branch__r.Name', 0, 0);
        System.assertEquals('Bob Ross Enterprises', vendorsSortedByBranch[vendorsSortedByBranch.size() - 1].Name);
    }
}
