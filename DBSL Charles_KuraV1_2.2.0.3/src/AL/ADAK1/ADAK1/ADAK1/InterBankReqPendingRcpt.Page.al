#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57194 "Inter Bank Req Pending Rcpt"
{
    ApplicationArea = Basic;
    CardPageID = "Inter Bank  Requisition";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inter Bank Transfer";
    SourceTableView = where("Document Type" = filter("InterBank Requisition Voucher"),
                            "Approval Status" = filter(Released),
                            "Disbursement Posted" = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Source Bank Account No"; Rec."Source Bank Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Bank Account No field.';
                }
                field("Source Bank Account Name"; Rec."Source Bank Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Bank Account Name field.';
                }
                field("Destination Bank Account No"; Rec."Destination Bank Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Bank Account No field.';
                }
                field("Destination Bank Name"; Rec."Destination Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Bank Name field.';
                }
                field("Direct Transfer"; Rec."Direct Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Transfer field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Originating Trans. Voucher No"; Rec."Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AIE Voucher No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Disbursement Posted"; Rec."Disbursement Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbursement Posted field.';
                }
                field("Receipt Posted"; Rec."Receipt Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Posted field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
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
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"InterBank Requisition Voucher";
    end;
}

