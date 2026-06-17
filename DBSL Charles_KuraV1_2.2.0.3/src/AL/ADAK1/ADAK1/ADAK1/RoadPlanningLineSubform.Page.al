#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52001 "Road Planning Line Subform"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Road Planning Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Planning ID"; Rec."Planning ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning ID field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity field.';
                }
                field("Planned Date"; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Date field.';
                }
                field("Actual Date"; Rec."Actual Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Date field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("% of Completion"; Rec."% of Completion")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % of Completion field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

