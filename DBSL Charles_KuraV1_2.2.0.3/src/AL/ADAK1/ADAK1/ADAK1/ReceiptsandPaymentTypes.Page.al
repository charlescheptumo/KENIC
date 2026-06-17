#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57010 "Receipts and Payment Types"
{
    ApplicationArea = Basic;
    CardPageID = "Receipt And Payment Type";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Receipts and Payment Types1";
    UsageCategory = Administration;

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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code field.';
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
                field("PPRA Code"; Rec."PPRA Code")
                {
                    ApplicationArea = Basic;
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
                field("Appear on Imprest?"; Rec."Appear on Imprest?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appear on Imprest? field.';
                }
                field("PAYE Chargeable"; Rec."PAYE Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Chargeable field.';
                }
                field("PPRA Chargeable"; Rec."PPRA Chargeble")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PPRA Chargeable field.';
                }
                field("PAYE Rate"; Rec."PAYE Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Rate field.';
                }
            }
        }
    }

    actions
    {
    }
    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        if not UserSetup."Accounts User" then
            Error('You do not have the required access rights to use this page. Please contact your system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}

