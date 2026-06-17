#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50190 "General Correspond Approvals"
{
    Caption = 'General Correspondence Approvals';
    PageType = ListPart;
    SourceTable = "General Correspond Approval";
    ApplicationArea = All;

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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                    Visible = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    Visible = false;
                }
                field(Position; Rec.Position)
                {
                    ToolTip = 'Specifies the value of the Position field.', Comment = '%';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
                field("Employee Email"; Rec."Employee Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Email field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("DateTime Modified"; Rec."DateTime Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime Modified field.';
                }
                field("Date Sent Approval"; Rec."Date Sent Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Sent Approval field.';
                }
            }
        }
    }

    actions
    {
    }
}

