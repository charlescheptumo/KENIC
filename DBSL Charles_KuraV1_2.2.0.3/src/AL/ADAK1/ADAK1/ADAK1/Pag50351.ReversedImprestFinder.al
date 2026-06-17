namespace KICD.KICD;

using Microsoft.Finance.GeneralLedger.Ledger;

page 50351 "Reversed Imprests"
{
    PageType = List;
    SourceTable = Payments;
    SourceTableTemporary = true;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Reversed Imprests';
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                }

                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }

                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                }

                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = All;
                }

                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                }

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }

                field(Reversed; Rec.Reversed)
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
            action(RecalculateReversed)
            {
                ApplicationArea = All;
                Caption = 'Recalculate Reversed';
                Image = Refresh;

                trigger OnAction()
                var
                    ReversedImprestsMgt: Codeunit "Reversed Imprests Mgt";
                begin
                    ReversedImprestsMgt.RecalculateReversedImprests();
                    LoadRecords();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        LoadRecords();
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Reversed);
    end;

    local procedure LoadRecords()
    var
        Payment: Record Payments;
        GLEntry: Record "G/L Entry";
    begin
        Rec.Reset();
        Rec.DeleteAll();

        Payment.Reset();
        Payment.SetRange("Payment Type", Payment."Payment Type"::Imprest);

        if Payment.FindSet() then
            repeat
                Payment.CalcFields(Reversed);

                GLEntry.Reset();
                GLEntry.SetRange("Document No.", Payment."No.");
                GLEntry.SetRange(Reversed, true);

                if GLEntry.FindFirst() then begin
                    Rec := Payment;
                    Rec.Insert();
                end;
            until Payment.Next() = 0;
    end;
}