#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56205 "Quarterly Appraisal Lines"
{
    PageType = ListPart;
    SourceTable = "Quarterly  Appraisal Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreed Performance Targets"; Rec."Agreed Performance Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agreed Performance Targets field.';
                }
                field("Acheived Targets for the Quart"; Rec."Acheived Targets for the Quart")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acheived Targets for the Quarter field.';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field("Percentage Cumulative Achievem"; Rec."Percentage Cumulative Achievem")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage Cumulative Achievement field.';
                }
            }
        }
    }

    actions
    {
    }
}

