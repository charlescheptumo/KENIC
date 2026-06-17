#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72017 "Road Study Initiatives"
{
    PageType = List;
    SourceTable = "Road Study Initiative";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Study Area Code"; Rec."Study Area Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Area Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Overall Owner"; Rec."Overall Owner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Owner field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Completion Percentage"; Rec."Completion Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion Percentage field.';
                }
            }
        }
    }

    actions
    {
    }
}

