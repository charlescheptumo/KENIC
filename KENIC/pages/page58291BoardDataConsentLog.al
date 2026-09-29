page 58291 "Board Data Consent Log"
{
    Caption = 'Board Data Consent Log';
    PageType = List;
    SourceTable = "Board Data Consent Log";
    SourceTableView = sorting("Entry No.") order(descending);
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Personal No"; Rec."Personal No") { ApplicationArea = All; }
                field("Full Name"; Rec."Full Name") { ApplicationArea = All; }
                field("Action"; Rec."Action") { ApplicationArea = All; }
                field("Consent Date Time"; Rec."Consent Date Time") { ApplicationArea = All; }
                field("Consent Version"; Rec."Consent Version") { ApplicationArea = All; }
                field("Portal User"; Rec."Portal User") { ApplicationArea = All; }
                field("IP Address"; Rec."IP Address") { ApplicationArea = All; }
                field("User Agent"; Rec."User Agent") { ApplicationArea = All; }
                field("Recorded By"; Rec."Recorded By") { ApplicationArea = All; }
            }
        }
    }
}