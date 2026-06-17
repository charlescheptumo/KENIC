#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69749 "Apptitude Marking Scheme"
{
    PageType = List;
    SourceTable = "Apptitude Qn Marking Scheme";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field("Correct Choice ID"; Rec."Correct Choice ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Correct Choice ID field.';
                }
                field(Explanation; Rec.Explanation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Explanation field.';
                }
            }
        }
    }

    actions
    {
    }
}

