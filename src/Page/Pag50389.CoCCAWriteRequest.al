namespace KENIC.KENIC;

page 50389 "CoCCA Write Request"
{
    ApplicationArea = All;
    Caption = 'CoCCA Write Request';
    PageType = Card;
    SourceTable = "CoCCA Write Request";
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(Tracking)
            {
                Editable = false;
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Operation"; Rec."Operation") { ApplicationArea = All; }
                field("Status"; Rec."Status") { ApplicationArea = All; }
                field("HTTP Status"; Rec."HTTP Status") { ApplicationArea = All; }
                field("Remote Record ID"; Rec."Remote Record ID") { ApplicationArea = All; }
                field("Remote Ledger ID"; Rec."Remote Ledger ID") { ApplicationArea = All; }
                field("Credit Note ID"; Rec."Credit Note ID") { ApplicationArea = All; }
                field("Attempted At"; Rec."Attempted At") { ApplicationArea = All; }
                field("Last Message"; Rec."Last Message") { ApplicationArea = All; }
                field("Status Checked At"; Rec."Status Checked At") { ApplicationArea = All; }
                field("Status HTTP Code"; Rec."Status HTTP Code") { ApplicationArea = All; }
                field("Status Message"; Rec."Status Message") { ApplicationArea = All; }
            }
            group(Request)
            {
                Editable = IsDraft;
                field("Roid"; Rec."Roid") { ApplicationArea = All; Visible = not IsReversal; }
                field("Target Ledger ID"; Rec."Target Ledger ID") { ApplicationArea = All; }
                field("Posting DateTime"; Rec."Posting DateTime") { ApplicationArea = All; Visible = not IsReversal; }
                field("Amount"; Rec."Amount") { ApplicationArea = All; Visible = not IsReversal; }
                field("Requested By"; Rec."Requested By") { ApplicationArea = All; }
                field("BC Reference"; Rec."BC Reference") { ApplicationArea = All; }
            }
            group(Adjustment)
            {
                Visible = IsAdjustment;
                Editable = IsDraft;
                field("Transaction ID"; Rec."Transaction ID") { ApplicationArea = All; }
                field("Narration"; Rec."Narration") { ApplicationArea = All; }
            }
            group(Receipt)
            {
                Visible = IsReceipt;
                Editable = IsDraft;
                field("Payment Channel"; Rec."Payment Channel") { ApplicationArea = All; }
                field("Cheque DateTime"; Rec."Cheque DateTime") { ApplicationArea = All; }
                field("Cheque Number"; Rec."Cheque Number") { ApplicationArea = All; }
                field("Mpesa API ID"; Rec."Mpesa API ID") { ApplicationArea = All; }
                field("In Words"; Rec."In Words") { ApplicationArea = All; }
                field("VAT Withheld"; Rec."VAT Withheld") { ApplicationArea = All; }
                field("VAT Certificate No."; Rec."VAT Certificate No.") { ApplicationArea = All; }
                field("Voided"; Rec."Voided") { ApplicationArea = All; }
                field("Void DateTime"; Rec."Void DateTime") { ApplicationArea = All; }
                field("SMS Transaction ID"; Rec."SMS Transaction ID") { ApplicationArea = All; }
                field("Mpesa Transaction ID"; Rec."Mpesa Transaction ID") { ApplicationArea = All; }
            }
            group(Explanation)
            {
                Visible = not IsReversal;
                Editable = IsDraft;
                field(Details; Rec.Details) { ApplicationArea = All; MultiLine = true; }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SendRequest)
            {
                ApplicationArea = All;
                Caption = 'Post to CoCCA';
                Image = Post;
                Enabled = IsDraft;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    CurrPage.SaveRecord();
                    if not Confirm('Post request %1 (%2) to CoCCA? This changes the registry.', false,
                        Rec."Entry No.", Rec.Operation) then
                        exit;
                    Mgt.PostCoCCAWriteRequest(Rec."Entry No.");
                    Rec.Get(Rec."Entry No.");
                    Message('%1: %2', Rec.Status, Rec."Last Message");
                    CurrPage.Update(false);
                end;
            }
            action(CheckReversalStatus)
            {
                ApplicationArea = All;
                Caption = 'Check Reversal Status';
                Image = Refresh;
                Enabled = IsReversal and not IsDraft;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    Mgt.CheckCoCCAReversalStatus(Rec."Entry No.");
                    Rec.Get(Rec."Entry No.");
                    Message('%1', Rec."Status Message");
                    CurrPage.Update(false);
                end;
            }
            action(DownloadAudit)
            {
                ApplicationArea = All;
                Caption = 'Download Request and Responses';
                Image = Export;
                trigger OnAction()
                var
                    Mgt: Codeunit COCCAIntegration;
                begin
                    Mgt.DownloadCoCCAWriteAudit(Rec."Entry No.");
                end;
            }
        }
    }
    var
        IsDraft: Boolean;
        IsAdjustment: Boolean;
        IsReceipt: Boolean;
        IsReversal: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        IsDraft := Rec.Status = Rec.Status::Draft;
        IsAdjustment := Rec.Operation = Rec.Operation::Adjustment;
        IsReceipt := Rec.Operation = Rec.Operation::Receipt;
        IsReversal := Rec.Operation = Rec.Operation::Reversal;
    end;
}
