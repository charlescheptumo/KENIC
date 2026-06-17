
/// <summary>
/// Page Incidence Mitigation Strategy (ID 60012).
/// </summary>
page 60012 "Incidence Mitigation Strategy"
{
    PageType = ListPart;
    SourceTable = "Incidence Mitigation Strategy";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Mitigation Strategy"; Rec."Mitigation Strategy")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Mitigation Strategy field.';
                }
                field("Mitigation Strategy Descriptio"; Rec."Mitigation Strategy Descriptio")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Mitigation Strategy Descriptio field.';
                }
                field("Noted By"; Rec."Noted By")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Noted By field.';
                }
                field("Noted At"; Rec."Noted At")
                {
                    ApplicationArea = BasicHr;
                    ToolTip = 'Specifies the value of the Noted At field.';
                }
            }
        }
    }

    actions
    {
    }
}


