#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95260 "Follow-up Audit Voucher"
{
    PageType = Card;
    SourceTable = "Audit Followup Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Reporting As At"; Rec."Reporting As At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting As At field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                // field("Audit Lead ID";"Audit Lead ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Auditee Type";"Auditee Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Project ID";"Project ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Primary Auditee ID";"Primary Auditee ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Auditee Name";"Auditee Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Auditee Lead ID";"Auditee Lead ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Global Dimension 1 Code";"Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Global Dimension 2 Code";"Global Dimension 2 Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Dimension Set ID";"Dimension Set ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control24;Status)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control25;Posted)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control26;"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control27;"Created DateTime")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            part(Checklist; "Audit Project Checklist Lines")
            {
                //SubPageLink = "Engagement ID"=field("Reporting As At");
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Followup Audit Voucher";
    end;
}

