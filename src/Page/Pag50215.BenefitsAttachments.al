namespace KICD.KICD;

page 50215 "Benefits Attachments"
{
    Caption = 'Benefits Attachments';
    PageType = List;
    SourceTable = "Benefits Attachments";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Category"; Rec."Benefit Category")
                {
                    ToolTip = 'Specifies the value of the Benefit Category field.';
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    ToolTip = 'Specifies the value of the Benefit Description field.';
                }
                field("Attachment Code"; Rec."Attachment Code")
                {
                    ToolTip = 'Specifies the value of the Attachment Code field.';
                }
                field("Attachment Description"; Rec."Attachment Description")
                {
                    ToolTip = 'Specifies the value of the Attachment Description field.';
                }
                field("Attachment Type"; Rec."Attachment Type")
                {
                    ToolTip = 'Specifies the value of the Attachment Type field.';
                }
            }
        }
    }

    actions
    {
    }
}