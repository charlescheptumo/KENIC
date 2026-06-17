#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75348 "Prequalification criteria"
{
    // Editable = false;
    PageType = ListPart;
    SourceTable = "Bid Score Requirement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group ID field.';
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Requirement field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = CreditMemo;
                    ToolTip = 'Executes the Score Guide action.';

                    trigger OnAction()
                    var
                        BidscoreGuide: Record "Bid Score Guide";
                        BidscoreGuides: Page "Bid Score Guide";
                    begin
                        Rec.TestField("Template ID");

                        BidscoreGuide.FilterGroup(2);
                        BidscoreGuide.SetRange("Template ID", Rec."Template ID");
                        BidscoreGuide.SetRange("Criteria Group ID", Rec."Criteria Group ID");
                        BidscoreGuide.SetRange("Requirement ID", Rec."Requirement ID");
                        BidscoreGuide.FilterGroup(0);
                        BidscoreGuides.SetTableview(BidscoreGuide);
                        BidscoreGuides.Editable := true;
                        BidscoreGuides.Run;
                    end;
                }
            }
        }
    }
}

