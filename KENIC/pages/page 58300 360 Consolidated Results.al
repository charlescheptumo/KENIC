
page 58300 "360 Consolidated Results"
{
    Caption = '360 Consolidated Results';
    PageType = List;
    SourceTable = "360 Consolidated Result";
    CardPageId = "360 Consolidated Result Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluatee Employee No."; Rec."Evaluatee Employee No.") { ApplicationArea = All; }
                field("Evaluatee Name"; Rec."Evaluatee Name") { ApplicationArea = All; }
                field("Evaluatee Category"; Rec."Evaluatee Category") { ApplicationArea = All; }
                field("Year Reporting Code"; Rec."Year Reporting Code") { ApplicationArea = All; }
                field("No. of Responses"; Rec."No. of Responses") { ApplicationArea = All; }
                field("Overall Average"; Rec."Overall Average") { ApplicationArea = All; }
                field("Self Average"; Rec."Self Average") { ApplicationArea = All; }
            }
        }
    }
}
