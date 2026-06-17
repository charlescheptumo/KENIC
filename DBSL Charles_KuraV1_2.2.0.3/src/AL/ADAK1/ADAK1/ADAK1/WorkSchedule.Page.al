#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72117 "Work Schedule"
{
    PageType = List;
    SourceTable = "Work Schedule";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Q1(LCY)"; Rec."Q1(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1(LCY) field.';
                }
                field("Q2(LCY)"; Rec."Q2(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2(LCY) field.';
                }
                field("Q3(LCY)"; Rec."Q3(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3(LCY) field.';
                }
                field("Q4(LCY)"; Rec."Q4(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4(LCY) field.';
                }
                field("Total(LCY)"; Rec."Total(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total(LCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

