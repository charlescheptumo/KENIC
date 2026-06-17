#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72025 "Study Cost Benefit Analysis"
{
    PageType = List;
    SourceTable = "Study Cost Benefit Matrix";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field("Option ID"; Rec."Option ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Option ID field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Year code"; Rec."Year code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Amount/Value (LCY)"; Rec."Amount/Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount/Value (LCY) field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Findings)
            {
                ApplicationArea = Basic;
                Caption = 'Findings';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Findings";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Findings action.';
            }
            action(Coclusions)
            {
                ApplicationArea = Basic;
                Caption = 'Coclusions';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Conclusions";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Coclusions action.';
            }
            action(Recommendations)
            {
                ApplicationArea = Basic;
                Caption = 'Recommendations';
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Recommendations";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Recommendations action.';
            }
            action(Section)
            {
                ApplicationArea = Basic;
                Caption = 'Sections';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Sections";
                RunPageLink = "Study ID" = field("Study ID");
                ToolTip = 'Executes the Sections action.';
            }
        }
    }
}

