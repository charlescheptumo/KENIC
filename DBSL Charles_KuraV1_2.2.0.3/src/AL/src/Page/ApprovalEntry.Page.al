#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57218 "Approval Entry"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Approval Entry";
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
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sequence No. field.';
                }
                field("Approval Code"; Rec."Approval Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Code field.';
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender ID field.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approver ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date-Time Sent for Approval field.';
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date-Time Modified field.';
                }
                field("Last Modified By User ID"; Rec."Last Modified By User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Modified By User ID field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Due Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("Approval Type"; Rec."Approval Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Type field.';
                }
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Approvals field.';
                }
            }
        }
    }

    actions
    {
    }
}

