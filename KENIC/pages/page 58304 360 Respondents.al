page 58304 "360 Respondents"
{
    Caption = '360 Respondents';
    PageType = List;
    SourceTable = "360 Evaluation Header";
    ApplicationArea = All;
    UsageCategory = None;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluator Employee No."; Rec."Evaluator Employee No.") { ApplicationArea = All; }
                field("Evaluator Name"; Rec."Evaluator Name") { ApplicationArea = All; }
            }
        }
    }
}