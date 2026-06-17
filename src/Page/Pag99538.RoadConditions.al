page 99538 "Road Conditions"
{
    ApplicationArea = All;
    Caption = 'Road Conditions';
    PageType = List;
    SourceTable = "Road Conditions";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("RICS Type"; Rec."RICS Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RICS Type field.';
                }
                field("Condition Code"; Rec."Condition Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum Percentage"; Rec."Minimum Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Percentage field.';
                }
                field("Maximum Percentage"; Rec."Maximum Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Percentage field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }

            }
        }
    }
}
