
page 58293 "360 Evaluation List"
{
    Caption = '360 Evaluations';
    PageType = List;
    SourceTable = "360 Evaluation Header";
    CardPageId = "360 Evaluation Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("Evaluatee Employee No."; Rec."Evaluatee Employee No.") { ApplicationArea = All; }
                field("Evaluatee Name"; Rec."Evaluatee Name") { ApplicationArea = All; }
                field("Evaluatee Category"; Rec."Evaluatee Category") { ApplicationArea = All; }
                field("Self Evaluation"; Rec."Self Evaluation") { ApplicationArea = All; }
                field("Year Reporting Code"; Rec."Year Reporting Code") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Evaluate CEO")
            {
                ApplicationArea = All;
                Image = NewDocument;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Creates a new evaluation for the CEO with the questions already loaded. Pick yourself as the evaluator on the card.';

                trigger OnAction()
                var
                    Header: Record "360 Evaluation Header";
                begin
                    Header.Init();
                    Header.Insert(true);
                    Header.Validate("Evaluatee Employee No.", Header.FindCEO());
                    Header.Modify(true);
                    Header.SuggestQuestions();
                    Page.Run(Page::"360 Evaluation Card", Header);
                end;
            }
        }
        area(processing)
        {
            action(ShowAll)
            {
                ApplicationArea = All;
                Caption = 'All';
                Image = ClearFilter;
                ToolTip = 'Show all my evaluations.';

                trigger OnAction()
                begin
                    ClearViewFilters();
                end;
            }
            action(ShowCEO)
            {
                ApplicationArea = All;
                Caption = 'CEO';
                Image = Filter;
                ToolTip = 'Show evaluations of the CEO.';

                trigger OnAction()
                begin
                    ShowCategory(Rec."Evaluatee Category"::CEO);
                end;
            }
            action(ShowManagers)
            {
                ApplicationArea = All;
                Caption = 'Managers';
                Image = Filter;
                ToolTip = 'Show evaluations of managers.';

                trigger OnAction()
                begin
                    ShowCategory(Rec."Evaluatee Category"::Manager);
                end;
            }
            action(ShowColleagues)
            {
                ApplicationArea = All;
                Caption = 'Colleagues';
                Image = Filter;
                ToolTip = 'Show evaluations of colleagues.';

                trigger OnAction()
                begin
                    ShowCategory(Rec."Evaluatee Category"::Colleague);
                end;
            }
            action(ShowSelf)
            {
                ApplicationArea = All;
                Caption = 'Self';
                Image = Filter;
                ToolTip = 'Show my self-evaluations.';

                trigger OnAction()
                begin
                    ClearViewFilters();
                    Rec.SetRange("Self Evaluation", true);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    local procedure ClearViewFilters()
    begin
        Rec.SetRange("Evaluatee Category");
        Rec.SetRange("Self Evaluation");
        CurrPage.Update(false);
    end;

    local procedure ShowCategory(Category: Enum "360 Category")
    begin
        ClearViewFilters();
        Rec.SetRange("Evaluatee Category", Category);
        CurrPage.Update(false);
    end;

    trigger OnOpenPage()
    begin

        Rec.FilterGroup(2);
        Rec.SetRange("Created By", UserId);
        Rec.FilterGroup(0);
    end;
}



