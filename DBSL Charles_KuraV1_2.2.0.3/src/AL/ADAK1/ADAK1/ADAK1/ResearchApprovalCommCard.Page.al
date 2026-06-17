#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65028 "Research Approval Comm Card"
{
    PageType = Card;
    SourceTable = "Research Approval Committee";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contact  ID"; Rec."Contact  ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact  ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Core Mandate"; Rec."Core Mandate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Core Mandate field.';
                }
                field("No of Research Submissions"; Rec."No of Research Submissions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Research Submissions field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup9)
            {
                action("GFO Approval Comm Entry List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "GFO Approval Comm Entry List";
                    RunPageLink = "RAC ID" = field("Contact  ID");
                    ToolTip = 'Executes the GFO Approval Comm Entry List action.';
                }
            }
        }
    }
}

