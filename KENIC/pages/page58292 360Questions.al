
page 58292 "360 Questions"
{
    Caption = '360 Questions';
    PageType = List;
    SourceTable = "360 Question";
    SourceTableView = sorting("Evaluatee Category", "Question Type", "Sort Order");
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluatee Category"; Rec."Evaluatee Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Who the question is about: CEO, Manager or Colleague.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Closed = rated from Strongly Disagree to Strongly Agree. Open = free-text answer.';
                }
                field("Sort Order"; Rec."Sort Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Order in which the questions appear on the evaluation.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = All;
                    ToolTip = 'The question or statement shown to the evaluator.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Untick to stop using a question without deleting it.';
                }
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Evaluatee Category" := xRec."Evaluatee Category";
        Rec."Question Type" := xRec."Question Type";
        Rec."Sort Order" := xRec."Sort Order" + 10;
    end;
}
