#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80187 "Policy Objective Revision"
{
    PageType = List;
    SourceTable = "Policy Objective Revision";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Policy Strategies"; Rec."No. of Policy Strategies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Policy Strategies field.';
                }
            }
        }
    }

    actions
    {
    }
}

