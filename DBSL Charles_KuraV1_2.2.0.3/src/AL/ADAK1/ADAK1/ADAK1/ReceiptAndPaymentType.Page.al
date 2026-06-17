#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57217 "Receipt And Payment Type"
{
    PageType = Card;
    SourceTable = "Receipts and Payment Types1";
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Chargeable field.';
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Chargeable field.';
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Code field.';
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Grouping field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Pending Voucher"; Rec."Pending Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Voucher field.';
                }
                field("Transation Remarks"; Rec."Transation Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transation Remarks field.';
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference field.';
                }
                field("Customer Payment On Account"; Rec."Customer Payment On Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Payment On Account field.';
                }
                field("Direct Expense"; Rec."Direct Expense")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Expense field.';
                }
                field("Calculate Retention"; Rec."Calculate Retention")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculate Retention field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code field.';
                }
                field("Subsistence?"; Rec."Subsistence?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subsistence? field.';
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';
                }
                field("Appear on Imprest?"; Rec."Appear on Imprest?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appear on Imprest? field.';
                }
                field("Account no"; Rec."Account no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account no field.';
                }
                field("Appear on sclaims"; Rec."Appear on sclaims")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appear on sclaims field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("PAYE Code"; Rec."PAYE Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Code field.';
                }
                field("PPRA Code"; Rec."PPRA Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PPRA Code field.';
                }
                field("PAYE Rate"; Rec."PAYE Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Rate field.';
                }
                field("PAYE Chargeable"; Rec."PAYE Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Chargeable field.';
                }
                field("PPRA Chargeble"; Rec."PPRA Chargeble")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the PPRA Chargeable field.';
                }
            }
        }
    }

    actions
    {
    }
}

