/// <summary>
/// Page Custom Approval Entries (ID 99669).
/// </summary>
page 99669 "Custom Approval Entries"
{
    ApplicationArea = All;
    Caption = 'Custom Approval Entries';
    PageType = List;
    SourceTable = "Custom Approval Entry";
    UsageCategory = Lists;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Approval Type"; Rec."Approval Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Type field.';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sequence No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender ID field.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the value of the Approver ID field.';
                }
                field("Approver Position"; Rec."Approver Position")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approver Position field.';
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date-Time Sent for Approval field.';
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date-Time Modified field.';
                }
                field("Last Modified By User ID"; Rec."Last Modified By User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Modified By User ID field.';
                }
            }
        }
    }
}




