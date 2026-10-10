
page 58296 "360 Evaluation Card"
{
    Caption = '360 Evaluation';
    PageType = Card;
    SourceTable = "360 Evaluation Header";
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Rec.Status = Rec.Status::Open;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Evaluator Employee No."; Rec."Evaluator Employee No.") { ApplicationArea = All; }
                field("Evaluator Name"; Rec."Evaluator Name") { ApplicationArea = All; }
                field("Evaluatee Employee No."; Rec."Evaluatee Employee No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if Rec."Evaluatee Employee No." = '' then
                            exit;
                        CurrPage.Update(true);      
                        Rec.SuggestQuestions();     
                        CurrPage.Update(false);
                    end;
                }
                field("Evaluatee Name"; Rec."Evaluatee Name") { ApplicationArea = All; }
                field("Evaluatee Category"; Rec."Evaluatee Category") { ApplicationArea = All; }
                field("Self Evaluation"; Rec."Self Evaluation") { ApplicationArea = All; }
                field("Year Reporting Code"; Rec."Year Reporting Code") { ApplicationArea = All; }
                field("Document Date"; Rec."Document Date") { ApplicationArea = All; }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Submitted On"; Rec."Submitted On") { ApplicationArea = All; }
                field("Average Score"; Rec."Average Score") { ApplicationArea = All; }
            }
            part(ClosedLines; "360 Closed Lines")
            {
                ApplicationArea = All;
                Caption = 'Closed Questions (rate each statement)';
                SubPageLink = "Evaluation No." = field("No.");
            }
            part(OpenLines; "360 Open Lines")
            {
                ApplicationArea = All;
                Caption = 'Open-ended Questions';
                SubPageLink = "Evaluation No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Suggest Questions")
            // {
            //     ApplicationArea = All;
            //     Image = Suggest;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     ToolTip = 'Reloads the closed and open questions for the evaluatee category. Existing answers are replaced.';

            //     trigger OnAction()
            //     begin
            //         if not Confirm('This will replace the current questions and any answers. Continue?', false) then
            //             exit;
            //         Rec.SuggestQuestions();
            //         CurrPage.Update(false);
            //     end;
            // }
            action(Submit)
            {
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Submits the evaluation. It cannot be changed afterwards.';

                trigger OnAction()
                begin
                    if not Confirm('Submit this evaluation? You will not be able to change it afterwards.', false) then
                        exit;
                    Rec.Submit();
                    CurrPage.Update(false);
                    Message('Evaluation %1 has been submitted.', Rec."No.");
                end;
            }
        }
    }
}