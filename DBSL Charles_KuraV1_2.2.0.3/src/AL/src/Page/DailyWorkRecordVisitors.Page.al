#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72445 "Daily Work Record Visitors"
{
    CardPageID = "Daily Work Record Visitor";
    PageType = List;
    SourceTable = "Daily Work Record Visitor";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Visitor Name"; Rec."Visitor Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Visitor Name field.';
                }
                field(Organization; Rec.Organization)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field("Purpose of Visit"; Rec."Purpose of Visit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Visit field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
                field("Site Induction Done"; Rec."Site Induction Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Site Inspection Done';
                    ToolTip = 'Specifies the value of the Site Inspection Done field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Visitor Email"; Rec."Visitor Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitor Email field.';
                }
            }
        }
    }

    actions
    {
    }
}

