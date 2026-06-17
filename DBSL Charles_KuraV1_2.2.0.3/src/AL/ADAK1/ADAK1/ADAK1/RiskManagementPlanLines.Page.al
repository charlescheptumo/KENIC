#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95038 "Risk Management Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Management Plan Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                // field("Risk ID";"Risk ID")
                // {
                //     ApplicationArea = Basic;
                //     Visible = true;
                // }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Category field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Risk Source ID field.';
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Code field.';
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Code field.';
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Type field.';
                }
                field("Estimate Fin. Impact (LCY)"; Rec."Estimate Fin. Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Fin. Impact (LCY) field.';
                }
                field("Estimate Delay Impact (Days)"; Rec."Estimate Delay Impact (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Delay Impact (Days) field.';
                }
                field("Gen. Risk Response Strategy"; Rec."Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Risk Response Strategy field.';
                }
                field("Date Raised"; Rec."Date Raised")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Raised field.';
                }
                field("Risk Status"; Rec."Risk Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Status field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                // field("Risk Likelihood Rate Scale ID";"Risk Likelihood Rate Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Risk Impact Rating Scale ID";"Risk Impact Rating Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Overall Risk Rating Scale ID";"Overall Risk Rating Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Risk Appetite Rating Scale ID";"Risk Appetite Rating Scale ID")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Risk Likelihood Rating"; Rec."Risk Likelihood Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rating field.';
                }
                field("Risk Impact Rating"; Rec."Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Rating field.';
                }
                field("Overal Risk Rating"; Rec."Overal Risk Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overal Risk Rating field.';
                }
                field("Overall Risk Level Code"; Rec."Overall Risk Level Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Level Code field.';
                }
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Heat Zone field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Risk Ownership")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    RunObject = Page "RMP Line Risk Ownerships";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                    ToolTip = 'Executes the Risk Ownership action.';
                }
                action("Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "RMP Line Response Actions";
                    RunPageLink = "Risk ID" = field("Risk ID");
                    ToolTip = 'Executes the Risk Response Actions action.';
                }
                action("Line Dimensions")
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Dimension Set Entries";
                    ToolTip = 'Executes the Line Dimensions action.';
                }
            }
        }
    }
}

