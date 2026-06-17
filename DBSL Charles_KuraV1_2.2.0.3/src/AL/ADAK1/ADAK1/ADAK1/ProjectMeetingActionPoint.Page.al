#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72259 "Project Meeting Action Point"
{
    PageType = List;
    SourceTable = "Project Meeting Action Point";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting ID"; Rec."Meeting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting ID field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Task Description"; Rec."Task Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Description field.';
                }
                field("Responsibility Category"; Rec."Responsibility Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Category field.';
                }
                field("Task Owner ID"; Rec."Task Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Owner ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

