page 58141 "Compliance Calendar Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Compliance Calendar Entry";
    Caption = 'Compliance Calendar Entries';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Obligation No."; Rec."Obligation No.")
                {
                    ApplicationArea = All;
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = All;
                }
                field("Proof Attached"; Rec."Proof Attached")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}