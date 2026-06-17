#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95031 "Risk Likeli Rating Scale Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Rating Scale Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Rating Scale Type field.';
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Rating Scale ID field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Min Probability Percentage"; Rec."Min Probability Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Probability Percentage field.';
                }
                field("Max Probability Percentage"; Rec."Max Probability Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Probability Percentage field.';
                }
                field("No. of Criteria"; Rec."No. of Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Criteria field.';
                }
                field("Rating Score"; Rec."Rating Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Score field.';
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
                Caption = '&Line';
                action("Probability Criteria")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    RunObject = Page "Risk Rating Criteria";
                    RunPageLink = "Risk Rating Scale Type" = filter("Likelihood Rating"),
                                  "Rating Scale ID" = field("Rating Scale ID"),
                                  Code = field(Code);
                    ToolTip = 'Executes the Probability Criteria action.';
                }
            }
        }
    }
}

