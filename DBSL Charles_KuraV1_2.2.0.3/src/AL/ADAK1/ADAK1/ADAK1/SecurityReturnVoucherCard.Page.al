#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75323 "Security Return Voucher Card"
{
    SourceTable = "Bid Security Closure Voucher";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control1)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Closed Securities Total Value"; Rec."Closed Securities Total Value")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closed Securities Total Value (LCY) field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control17; "Bid Security Return Line")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Visible = mtr;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    ReturnLine.Reset;
                    ReturnLine.SetRange("Document No", Rec."Document No");
                    if ReturnLine.FindSet then begin
                        repeat
                            Bid_ContractSec.Reset;
                            Bid_ContractSec.SetRange("No.", ReturnLine."Bid Security ID");
                            if Bid_ContractSec.FindSet then
                                Bid_ContractSec."Security Closure Date" := ReturnLine."Date Closed";
                            Bid_ContractSec."Security Closure Type" := ReturnLine."Document Type";
                            Bid_ContractSec."Security Closure Voucher No." := ReturnLine."Document No";
                            Bid_ContractSec."Reason Code" := ReturnLine."Return Reason Code";
                            Bid_ContractSec.Modify(true);
                        until ReturnLine.Next = 0;
                    end;
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted Date" := Today;
                    Rec.Modify(true);
                    Message('Submitted Successfully');
                end;
            }
            group(ActionGroup23)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Rec.Status = Rec.Status::open;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //      ReleasePurchDoc.ReleaseTSRV(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //    ReleasePurchDoc.ReopenTSRV(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        mtr := false;
        if Rec.Status = Rec.Status::Released then
            mtr := true;
    end;

    trigger OnOpenPage()
    begin
        mtr := false;
        if Rec.Status = Rec.Status::Released then
            mtr := true;
    end;

    var
        Bid_ContractSec: Record "Bid_Contract Security Register";
        ReturnLine: Record "Bid Security Return Line";
        mtr: Boolean;
}

