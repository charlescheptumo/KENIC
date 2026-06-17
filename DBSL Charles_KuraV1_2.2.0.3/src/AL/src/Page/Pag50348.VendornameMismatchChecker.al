page 50348 "Vendor Name Mismatch"
{
    PageType = List;
    Caption = 'Vendor Name Mismatches (VLE vs Vendor)';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "Vendor Name Mismatch Buffer";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("VLE Vendor Name"; Rec."VLE Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor Table Name"; Rec."Vendor Table Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                Caption = 'Run Check';
                ApplicationArea = All;
                Image = Refresh;
                trigger OnAction()
                var
                    MismatchChecker: Codeunit "Vendor Name Mismatch Checker";
                begin
                    MismatchChecker.FindMismatches(Rec);
                    CurrPage.Update(false);
                end;
            }
            action(FixMismatches)
            {
                Caption = 'Fix Mismatches';
                ApplicationArea = All;
                Image = Approve;
                trigger OnAction()
                var
                    MismatchChecker: Codeunit "Vendor Name Mismatch Checker";
                    FixedCount: Integer;
                begin
                    if Rec.IsEmpty() then begin
                        Message('No mismatches found to fix.');
                        exit;
                    end;
                    if not Confirm('This will update Vendor Name in %1 Vendor Ledger Entries to match the current Vendor Name.\Are you sure you want to proceed?', false, Rec.Count()) then
                        exit;
                    FixedCount := MismatchChecker.FixMismatches(Rec);
                    Message('%1 Vendor Ledger Entries have been updated successfully.', FixedCount);
                    MismatchChecker.FindMismatches(Rec);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        MismatchChecker: Codeunit "Vendor Name Mismatch Checker";
    begin
        MismatchChecker.FindMismatches(Rec);
    end;
}