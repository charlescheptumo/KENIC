#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72377 "Multi Works Line"
{
    PageType = List;
    SourceTable = "Detailed Multi_Year Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KeRRA Budget Code field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Revision Type"; Rec."Revision Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Type field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Line No';
                    ToolTip = 'Specifies the value of the Budget Line No field.';
                }
                field("Package Name"; Rec."Package Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Annual Projection"; Rec."Annual Projection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Projection field.';
                }
                field("Current Budget Amount"; Rec."Current Budget Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget Amount field.';
                }
                field("Revised Budget"; Rec."Revised Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revised Budget field.';
                }
                field("Supplementary Budget"; Rec."Supplementary Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplementary Budget field.';
                }
                field("Funding Date"; Rec."Funding Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Date field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Actual Amount Allocated"; Rec."Actual Amount Allocated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Amount Disbursed';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Amount Disbursed field.';
                }
                field("Amount Certified"; Rec."Amount Certified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount Certified field.';
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Paid';
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                    // TableRelation = Job."Total Actual Costs" where ("No."=field("Package No."));
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
            }
        }
    }

    actions
    {
    }
}

