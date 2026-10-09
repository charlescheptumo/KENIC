page 58292 "360 Questions"
{
    Caption = '360 Questions';
    PageType = List;
    SourceTable = "360 Question";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code") { ApplicationArea = All; }
                field("Evaluatee Category"; Rec."Evaluatee Category") { ApplicationArea = All; }
                field("Question Type"; Rec."Question Type") { ApplicationArea = All; }
                field(Question; Rec.Question) { ApplicationArea = All; }
                field("Sort Order"; Rec."Sort Order") { ApplicationArea = All; }
                field(Active; Rec.Active) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load Default Questions")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Loads the CEO, Manager and Colleague questions from the 360 Performance Evaluation Guidelines. Existing codes are skipped.';

                trigger OnAction()
                var
                    SetupMgt: Codeunit "360 Setup Mgt.";
                begin
                    SetupMgt.LoadDefaultQuestions();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
