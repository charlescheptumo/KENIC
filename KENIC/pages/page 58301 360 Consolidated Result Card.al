
page 58301 "360 Consolidated Result Card"
{
    Caption = '360 Consolidated Result';
    PageType = Card;
    SourceTable = "360 Consolidated Result";
    ApplicationArea = All;
    UsageCategory = None;
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Evaluatee Employee No."; Rec."Evaluatee Employee No.") { ApplicationArea = All; }
                field("Evaluatee Name"; Rec."Evaluatee Name") { ApplicationArea = All; }
                field("Evaluatee Category"; Rec."Evaluatee Category") { ApplicationArea = All; }
                field("Year Reporting Code"; Rec."Year Reporting Code") { ApplicationArea = All; }
                field("No. of Responses"; Rec."No. of Responses") { ApplicationArea = All; }
                field("Self Responses"; Rec."Self Responses") { ApplicationArea = All; }
                field("Overall Average"; Rec."Overall Average") { ApplicationArea = All; }
                field("Self Average"; Rec."Self Average") { ApplicationArea = All; }
                field("Last Consolidated On"; Rec."Last Consolidated On") { ApplicationArea = All; }
            }
            part(ClosedLines; "360 Consol. Closed Lines")
            {
                ApplicationArea = All;
                Caption = 'Closed Questions';
                SubPageLink = "Evaluatee Employee No." = field("Evaluatee Employee No."),
                              "Year Reporting Code" = field("Year Reporting Code");
            }
            part(OpenLines; "360 Consol. Open Lines")
            {
                ApplicationArea = All;
                Caption = 'Open-ended Responses (anonymous)';
                SubPageLink = "Evaluatee Employee No." = field("Evaluatee Employee No."),
                              "Year Reporting Code" = field("Year Reporting Code");
            }
        }
    }
}