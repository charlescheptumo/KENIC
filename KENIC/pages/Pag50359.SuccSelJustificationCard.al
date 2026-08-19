namespace KENIC.KENIC;

page 50359 "Succ. Sel. Justification Card"
{
    PageType = Card;
    SourceTable = "Succ. Sel. Justification Hdr";
    caption = 'Successor Selection Justification';
    ApplicationArea = All;
    //UsageCategory = lists;

    layout
    {
        area(content)
        {
            group(Basic)
            {
                Caption = 'Basic Information';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                 field("Successor Name"; Rec."Successor Name")
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
                               field("Current Position"; Rec."Current Position")
                {
                    ApplicationArea = All;
                }
                field("Date of Evaluation"; Rec."Date of Evaluation")
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "Succ. Sel. Justif. Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            group(Overall)
            {
                Caption = 'Overall Recommendation';
                field("Total Score"; Rec."Total Score")
                {
                    ApplicationArea = All;
                }
                field("Overall Rating"; Rec."Overall Rating")
                {
                    ApplicationArea = All;
                }
                field("Summary of Justification"; SummaryText)
                {
                    ApplicationArea = All;
                    Caption = 'Summary of Justification';
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                       // Rec.SetSummaryText(SummaryText);
                    end;
                }
                field("Additional Comments"; AdditionalCommentsText)
                {
                    ApplicationArea = All;
                    Caption = 'Additional Comments';
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                      //  Rec.SetAdditionalCommentsText(AdditionalCommentsText);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
       // SummaryText := Rec.GetSummaryText();
       // AdditionalCommentsText := Rec.GetAdditionalCommentsText();
    end;

    var
        SummaryText: Text;
        AdditionalCommentsText: Text;
}

