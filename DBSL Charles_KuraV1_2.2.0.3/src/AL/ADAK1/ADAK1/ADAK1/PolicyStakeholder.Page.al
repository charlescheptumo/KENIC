#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80168 "Policy Stakeholder"
{
    PageType = List;
    SourceTable = "Policy Stakeholder";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Stakeholder Group ID"; Rec."Stakeholder Group ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder Group ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Policy Stakeholder Roles")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Policy Stakeholder Roles";
                RunPageLink = "Policy ID" = field("Policy ID"),
                              Code = field(Code);
                ToolTip = 'Executes the Policy Stakeholder Roles action.';
            }
        }
    }
}

