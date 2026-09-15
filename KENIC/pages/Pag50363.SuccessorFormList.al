namespace KENIC.KENIC;


page 50363 "Successor Form List"
{
    PageType = List;
    SourceTable = "Successor Form Header";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Successor Form Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Successor"; Rec."Successor")
                {
                    ApplicationArea = All;
                }
                field("Successor Job Title"; Rec."Successor Job Title")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

