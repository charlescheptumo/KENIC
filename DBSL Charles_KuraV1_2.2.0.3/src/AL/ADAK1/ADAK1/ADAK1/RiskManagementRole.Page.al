#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95024 "Risk Management Role"
{
    PageType = Card;
    SourceTable = "Risk Management Role";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directly Reports To field.';
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indirectly Reports To field.';
                }
                field("No. of Def Responsibilities"; Rec."No. of Def Responsibilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Def Responsibilities field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Risk Responsibilities")
            {
                ApplicationArea = Basic;
                Caption = 'Risk Responsibilities';
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt. Responsibilities";
                RunPageLink = "Role ID" = field(Code);
                ToolTip = 'Executes the Risk Responsibilities action.';
            }
        }
    }
}

