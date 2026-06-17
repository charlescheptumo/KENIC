

PageExtension 50033 "pageextension50033" extends "G/L Budget Names"
{



    layout
    {
        addafter(Description)
        {
            field("Start Date"; Rec."Start Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Start Date field.';
            }
            field("End Date"; Rec."End Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the End Date field.';
            }
            field("Budget Type"; Rec."Budget Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Type field.';
            }
            field("Original Budget"; Rec."Original Budget")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Original Budget field.';
            }
        }
    }
    actions
    {
        addafter(ReportTrialBalance)
        {
            action("Supplementary/Original")
            {
                ApplicationArea = Suite;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Supplementary/Original action.';

                trigger OnAction()
                begin
                    Rec.SetRange(Name, Rec.Name);
                    Report.Run(57008, true, false, Rec);
                end;
            }
        }
    }
}



