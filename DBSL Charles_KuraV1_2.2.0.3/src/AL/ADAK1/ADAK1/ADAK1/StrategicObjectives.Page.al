#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80028 "Strategic Objectives"
{
    PageType = List;
    SourceTable = "Strategic Objective";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plan ID field.';
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Theme ID field.';
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Strategies"; Rec."No. of Strategies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Strategies field.';
                }
                field("No. of Strategic Initiatives"; Rec."No. of Strategic Initiatives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Strategic Initiatives field.';
                }
            }
        }
    }

    actions
    {
    }
}

