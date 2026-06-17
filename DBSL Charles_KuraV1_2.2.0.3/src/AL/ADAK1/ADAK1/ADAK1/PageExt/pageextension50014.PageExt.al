#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50014 "pageextension50014" extends "General Journal"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Modification (Visible) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Insertion (Description) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Insertion (Description) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Insertion (Description) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Modification (Visible) on "Amount(Control 18)".


        //Unsupported feature: Property Modification (Visible) on ""Amount (LCY)"(Control 113)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account No."(Control 55)".


        //Unsupported feature: Property Modification (Visible) on "Correction(Control 114)".


        //Unsupported feature: Property Deletion (Visible) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Bus. Posting Group"(Control 41)".


        //Unsupported feature: Property Deletion (Visible) on ""VAT Prod. Posting Group"(Control 85)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 1 Code"(Control 136)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 2 Code"(Control 135)".

        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Line No. field.';
            }
        }
        // addafter("Posting Date")
        // {
        //     field("Posting Group"; Rec."Posting Group")
        //     {
        //         ApplicationArea = Basic;
        //         Editable = true;
        //         ToolTip = 'Specifies the value of the Posting Group field.';
        //     }
        // }
        addafter("Document No.")
        {
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the FA Posting Type field.';
            }
        }
        addafter("Account No.")
        {
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Quantity field.';
            }
        }
        addafter(AccountName)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project No. field.';
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Task No. field.';
            }
        }
        addafter(Description)
        {
            field("Project No"; Rec."Project No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project No field.';
            }
            field("Contractor No"; Rec."Contractor No")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Contractor No field.';
            }
        }
        addafter("Business Unit Code")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
            }

        }
        addafter("Gen. Prod. Posting Group")
        {
            field("Debits Amount"; Rec."Debit Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of Debit Amount';
            }
            field("Credits Amount"; Rec."Credit Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of Credit Amount';
            }


        }
       
        addafter(Control1)
        {
            group(TotalGroup)
            {
                ShowCaption = false;

                field(TotalDebit; TotalDebitAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Debit';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }

                field(TotalCredit; TotalCreditAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Credit';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }

        }

    }
    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CalculateTotals();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        CalculateTotals();
    end;

    local procedure CalculateTotals()
    var
        GenJnlLine: Record "Gen. Journal Line";
    begin
        TotalDebitAmount := 0;
        TotalCreditAmount := 0;

        GenJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        GenJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");

        if GenJnlLine.FindSet() then
            repeat
                TotalDebitAmount += GenJnlLine."Debit Amount";
                TotalCreditAmount += GenJnlLine."Credit Amount";
            until GenJnlLine.Next() = 0;
    end;

    var
        TotalDebitAmount: Decimal;
        TotalCreditAmount: Decimal;

}

#pragma implicitwith restore

