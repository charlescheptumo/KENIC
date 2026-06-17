#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95050 "RMP Role"
{
    PageType = Card;
    SourceTable = "RMP Role";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
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
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Risk Management Team"; Rec."Risk Management Team")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Team field.';
                }
                field("Project Team (Internal Staff)"; Rec."Project Team (Internal Staff)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team (Internal Staff) field.';
                }
                field("Project Team(Contractor Staff)"; Rec."Project Team(Contractor Staff)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team(Contractor Staff) field.';
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
    }
}

