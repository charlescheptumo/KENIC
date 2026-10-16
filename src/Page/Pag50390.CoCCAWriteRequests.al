namespace KENIC.KENIC;

page 50390 "CoCCA Write Requests"
{
    ApplicationArea = All;
    Caption = 'CoCCA Write Requests';
    PageType = List;
    SourceTable = "CoCCA Write Request";
    SourceTableView = sorting("Entry No.") order(descending);
    UsageCategory = Tasks;
    CardPageId = "CoCCA Write Request";
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Operation"; Rec."Operation") { ApplicationArea = All; }
                field("Status"; Rec."Status") { ApplicationArea = All; }
                field("Roid"; Rec."Roid") { ApplicationArea = All; }
                field("Target Ledger ID"; Rec."Target Ledger ID") { ApplicationArea = All; }
                field("Amount"; Rec."Amount") { ApplicationArea = All; }
                field("BC Reference"; Rec."BC Reference") { ApplicationArea = All; }
                field("HTTP Status"; Rec."HTTP Status") { ApplicationArea = All; }
                field("Remote Record ID"; Rec."Remote Record ID") { ApplicationArea = All; }
                field("Remote Ledger ID"; Rec."Remote Ledger ID") { ApplicationArea = All; }
                field("Credit Note ID"; Rec."Credit Note ID") { ApplicationArea = All; }
                field("Last Message"; Rec."Last Message") { ApplicationArea = All; }
                field("Attempted At"; Rec."Attempted At") { ApplicationArea = All; }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(NewAdjustment)
            {
                ApplicationArea = All;
                Caption = 'New Adjustment';
                Image = New;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    Mgt.NewCoCCAWriteRequest(Enum::"CoCCA Write Operation"::Adjustment, 0);
                    CurrPage.Update(false);
                end;
            }
            action(NewReceipt)
            {
                ApplicationArea = All;
                Caption = 'New Receipt';
                Image = New;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    Mgt.NewCoCCAWriteRequest(Enum::"CoCCA Write Operation"::Receipt, 0);
                    CurrPage.Update(false);
                end;
            }
            action(NewReversal)
            {
                ApplicationArea = All;
                Caption = 'New Reversal';
                Image = New;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    Mgt.NewCoCCAWriteRequest(Enum::"CoCCA Write Operation"::Reversal, 0);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
