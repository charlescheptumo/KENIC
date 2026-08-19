namespace KENIC.KENIC;


page 50360 "Succ. Sel. Justification List"
{
    PageType = List;
    SourceTable = "Succ. Sel. Justification Hdr";
    Caption = 'Successor Selection Justifications';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Succ. Sel. Justification Card";

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
                field("Department"; Rec."Department")
                {
                    ApplicationArea = All;
                }
                field("Current Role"; Rec."Current Role")
                {
                    ApplicationArea = All;
                }
                field("Successor Name"; Rec."Successor Name")
                {
                    ApplicationArea = All;
                }
                field("Current Position"; Rec."Current Position")
                {
                    ApplicationArea = All;
                }
                field("Date of Evaluation"; Rec."Date of Evaluation")
                {
                    ApplicationArea = All;
                }
                field("Total Score"; Rec."Total Score")
                {
                    ApplicationArea = All;
                }
                field("Overall Rating"; Rec."Overall Rating")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

