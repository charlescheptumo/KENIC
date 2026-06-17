#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80416 "Sub Objectives and Outcomes"
{
    PageType = ListPart;
    SourceTable = "Sub Objective Evaluation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective/Initiative field.';
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Qty field.';
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final/Actual Qty field.';
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight % field.';
                }
            }
        }
    }

    actions
    {
    }
}

