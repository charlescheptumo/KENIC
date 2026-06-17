namespace KICD.KICD;

using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Vendor;

codeunit 50039 "Vendor Name Mismatch Checker"
{
    procedure FindMismatches(var TempVendNameMismatch: Record "Vendor Name Mismatch Buffer" temporary)
    var
        VendLedgEntry: Record "Vendor Ledger Entry";
        Vendor: Record Vendor;
    begin
        TempVendNameMismatch.DeleteAll();
        VendLedgEntry.SetCurrentKey("Vendor No.");
        if VendLedgEntry.FindSet() then
            repeat
                if Vendor.Get(VendLedgEntry."Vendor No.") then
                    if VendLedgEntry."Vendor Name" <> Vendor.Name then begin
                        TempVendNameMismatch.Init();
                        TempVendNameMismatch."Entry No." := VendLedgEntry."Entry No.";
                        TempVendNameMismatch."Vendor No." := VendLedgEntry."Vendor No.";
                        TempVendNameMismatch."VLE Vendor Name" := VendLedgEntry."Vendor Name";
                        TempVendNameMismatch."Vendor Table Name" := Vendor.Name;
                        TempVendNameMismatch."Posting Date" := VendLedgEntry."Posting Date";
                        TempVendNameMismatch."Document No." := VendLedgEntry."Document No.";
                        TempVendNameMismatch.Insert();
                    end;
            until VendLedgEntry.Next() = 0;
    end;

    procedure FixMismatches(var TempVendNameMismatch: Record "Vendor Name Mismatch Buffer" temporary): Integer
    var
        VendLedgEntry: Record "Vendor Ledger Entry";
        FixedCount: Integer;
    begin
        FixedCount := 0;
        if TempVendNameMismatch.FindSet() then
            repeat
                if VendLedgEntry.Get(TempVendNameMismatch."Entry No.") then begin
                    VendLedgEntry."Vendor Name" := TempVendNameMismatch."Vendor Table Name";
                    VendLedgEntry.Modify();
                    FixedCount += 1;
                end;
            until TempVendNameMismatch.Next() = 0;
        exit(FixedCount);
    end;



    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertVendor(var Rec: Record Vendor)
    begin
        ValidateMandatoryFields(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnBeforeModifyEvent', '', false, false)]
    local procedure OnBeforeModifyVendor(var Rec: Record Vendor; var xRec: Record Vendor)
    begin
        ValidateMandatoryFields(Rec);
    end;


    local procedure ValidateMandatoryFields(var VendorRec: Record Vendor)
    begin
        VendorRec.TESTFIELD("VAT Registration No.");
        VendorRec.TESTFIELD("E-Mail");
        VendorRec.TESTFIELD("Phone No.");


    end;

}