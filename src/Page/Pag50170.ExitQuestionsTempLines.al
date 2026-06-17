/// <summary>
/// Page Exit Questions Temp Lines (ID 50170).
/// </summary>
page 50170 "Exit Questions Temp Lines"
{
    Caption = 'Exit Questions Temp Lines';
    PageType = ListPart;
    SourceTable = "Exit Interview Qns Temp Lines";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Question ID"; Rec."Question ID")
                {
                    ToolTip = 'Specifies the value of the Question ID field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ToolTip = 'Specifies the value of the Question Type field.', Comment = '%';
                }
            }
        }
    }
}
