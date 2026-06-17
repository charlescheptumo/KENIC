#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50000 "test 22"
{
    PageType = List;
    SourceTable = "G/L Account";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Name field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Account Category"; Rec."Account Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Category field.';
                }
                field("Income/Balance"; Rec."Income/Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income/Balance field.';
                }
                field("Debit/Credit"; Rec."Debit/Credit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Debit/Credit field.';
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. 2 field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Direct Posting"; Rec."Direct Posting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Posting field.';
                }
                field("Reconciliation Account"; Rec."Reconciliation Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reconciliation Account field.';
                }
                field("New Page"; Rec."New Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Page field.';
                }
                field("No. of Blank Lines"; Rec."No. of Blank Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Blank Lines field.';
                }
                field(Indentation; Rec.Indentation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indentation field.';
                }
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Modified Date Time field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
                field("Global Dimension 1 Filter"; Rec."Global Dimension 1 Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Filter field.';
                }
                field("Global Dimension 2 Filter"; Rec."Global Dimension 2 Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Filter field.';
                }
                field("Balance at Date"; Rec."Balance at Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance at Date field.';
                }
                field("Net Change"; Rec."Net Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Change field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted Amount field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Totaling field.';
                }
                field("Budget Filter"; Rec."Budget Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Filter field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Budget at Date"; Rec."Budget at Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget at Date field.';
                }
                field("Consol. Translation Method"; Rec."Consol. Translation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consol. Translation Method field.';
                }
                field("Consol. Debit Acc."; Rec."Consol. Debit Acc.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consol. Debit Acc. field.';
                }
                field("Consol. Credit Acc."; Rec."Consol. Credit Acc.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consol. Credit Acc. field.';
                }
                field("Business Unit Filter"; Rec."Business Unit Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Unit Filter field.';
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Posting Type field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Debit Amount field.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Credit Amount field.';
                }
                field("Automatic Ext. Texts"; Rec."Automatic Ext. Texts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Automatic Ext. Texts field.';
                }
                field("Budgeted Debit Amount"; Rec."Budgeted Debit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted Debit Amount field.';
                }
                field("Budgeted Credit Amount"; Rec."Budgeted Credit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted Credit Amount field.';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Area Code field.';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Liable field.';
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Group Code field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("VAT Amt."; Rec."VAT Amt.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amt. field.';
                }
                field("Additional-Currency Net Change"; Rec."Additional-Currency Net Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional-Currency Net Change field.';
                }
                field("Add.-Currency Balance at Date"; Rec."Add.-Currency Balance at Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Add.-Currency Balance at Date field.';
                }
                field("Additional-Currency Balance"; Rec."Additional-Currency Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional-Currency Balance field.';
                }
                field("Exchange Rate Adjustment"; Rec."Exchange Rate Adjustment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exchange Rate Adjustment field.';
                }
                field("Add.-Currency Debit Amount"; Rec."Add.-Currency Debit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Add.-Currency Debit Amount field.';
                }
                field("Add.-Currency Credit Amount"; Rec."Add.-Currency Credit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Add.-Currency Credit Amount field.';
                }
                field("Default IC Partner G/L Acc. No"; Rec."Default IC Partner G/L Acc. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default IC Partner G/L Acc. No field.';
                }
                field("Omit Default Descr. in Jnl."; Rec."Omit Default Descr. in Jnl.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Omit Default Descr. in Jnl. field.';
                }
                field("Account Subcategory Entry No."; Rec."Account Subcategory Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Subcategory Entry No. field.';
                }
                field("Account Subcategory Descript."; Rec."Account Subcategory Descript.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Subcategory Descript. field.';
                }
                field("Dimension Set ID Filter"; Rec."Dimension Set ID Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID Filter field.';
                }
                field("Cost Type No."; Rec."Cost Type No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Type No. field.';
                }
                field("Default Deferral Template Code"; Rec."Default Deferral Template Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Deferral Template Code field.';
                }
                // field(Id;Id)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Budget Controlled"; Rec."Budget Controlled")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Controlled field.';
                }
                field("Account Category 1"; Rec."Account Category 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Category 1 field.';
                }
                field("Global Dimension 3 Filter"; Rec."Global Dimension 3 Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 3 Filter field.';
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Code field.';
                }
                field("Global Dimension 4 Filter"; Rec."Global Dimension 4 Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 4 Filter field.';
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
                }
                field("Global Dimension 4 Code"; Rec."Global Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
                }
                field("Global Dimension 5 Code"; Rec."Global Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

