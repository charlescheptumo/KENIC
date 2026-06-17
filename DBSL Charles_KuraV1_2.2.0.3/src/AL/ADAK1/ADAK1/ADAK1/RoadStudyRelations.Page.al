#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72023 "Road Study Relations"
{
    PageType = List;
    SourceTable = "Road Study Relation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study ID field.';
                }
                field("Related Study ID"; Rec."Related Study ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Related Study ID field.';
                }
                field("Related Study Description"; Rec."Related Study Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Related Study Description field.';
                }
                field("Study Relation Summary"; Rec."Study Relation Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Relation Summary field.';
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
        }
    }
}

