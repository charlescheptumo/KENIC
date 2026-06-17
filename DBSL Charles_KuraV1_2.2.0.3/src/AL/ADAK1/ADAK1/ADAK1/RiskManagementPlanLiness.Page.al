#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95316 "Risk Management Plan Liness"
{
    PageType = List;
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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
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
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rate Scale ID field.';
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Rating Scale ID field.';
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Rating Scale ID field.';
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Appetite Rating Scale ID field.';
                }
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
                field("No. of Planed Risk Resp. Actns"; Rec."No. of Planed Risk Resp. Actns")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planed Risk Resp. Actns field.';
                }
                field("No. of Actual Risk Resp. Actns"; Rec."No. of Actual Risk Resp. Actns")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Actual Risk Resp. Actns field.';
                }
                field("No. of Impacted Project Tasks"; Rec."No. of Impacted Project Tasks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Impacted Project Tasks field.';
                }
                field("No. of Pos. Risk Incidences"; Rec."No. of Pos. Risk Incidences")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Pos. Risk Incidences field.';
                }
                field("No. of Neg. Risk Incidences"; Rec."No. of Neg. Risk Incidences")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Neg. Risk Incidences field.';
                }
                field("Actual Financial Impact (LCY)"; Rec."Actual Financial Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Financial Impact (LCY) field.';
                }
                field("Actual Delay Impact (Days)"; Rec."Actual Delay Impact (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Delay Impact (Days) field.';
                }
                field("New Risk Voucher ID"; Rec."New Risk Voucher ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Risk Voucher ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

