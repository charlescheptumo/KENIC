page 50123 "Staff Exit Interview Questions"
{
    ApplicationArea = All;
    Caption = 'Staff Exit Interview Questions';
    PageType = ListPart;
    SourceTable = "Staff Exit Interview Questions";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                // field("Question Category"; Rec."Question Category")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field(Answer; Rec.Answer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Answer field.';
                }
                field("Evaluation Comments"; Rec."Evaluation Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }
}
