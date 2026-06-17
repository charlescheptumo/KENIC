#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72257 "Project Meeting Agenda"
{
    PageType = List;
    SourceTable = "Project Meeting Agenda";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting ID"; Rec."Meeting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
                field(Owner; Rec.Owner)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Owner field.';
                }
                field("Estimate Time (Minutes)"; Rec."Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Time (Minutes) field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(" Project Meeting Summary")
            {
                ApplicationArea = Basic;
                Caption = ' Project Meeting Summary';
                Ellipsis = true;
                Image = StatisticsGroup;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Project Meeting Summary";
                RunPageLink = "Meeting ID" = field("Meeting ID"), "Agenda Code" = field("Agenda Code");
                ToolTip = 'Executes the  Project Meeting Summary action.';
            }
        }
    }
}

#pragma implicitwith restore

