#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95213 "Audit Followup Header"
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
                field("Primary RC ID"; Rec."Primary RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary RC ID field.';
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
                field(Control23; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Control24; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Control25; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Control26; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                // field("Entrance Meeting Venue";"Entrance Meeting Venue")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Entrance Meeting Start Date";"Entrance Meeting Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Entrance Meeting Start Time";"Entrance Meeting Start Time")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Entrance Meeting End Date";"Entrance Meeting End Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Entrance Meeting End Time";"Entrance Meeting End Time")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Duration;Duration)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Meeting Medium";"Meeting Medium")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

