#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57004 "PV Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Adavance Type field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Advance Recovery %"; Rec."Advance Recovery %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Recovery % field.';
                }
                field("Obligation Total Amount"; Rec."Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obligation Total Amount field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Retention Code2"; Rec."Retention Code2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code2 field.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applies-to Doc. Type field.';
                }
                field("Applies to Doc. No"; Rec."Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                    Lookup = true;
                    ToolTip = 'Specifies the value of the Applies to Doc. No field.';
                    // Editable = false;
                    // Enabled =false;
                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        Rec.CalculateTax();
                        Rec.Modify();
                    end;

                }
                field("Invoice No.";Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Number';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field(InvoiceDate; Rec.InvoiceDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Date';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Invoice Date field.';
                }
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Document Description field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                    ShowMandatory = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross Amount';
                    ToolTip = 'Specifies the value of the Gross Amount field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("PAYE Amount"; Rec."PAYE Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Amount field.';
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Rate field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'VAT With held Rate';
                    ToolTip = 'Specifies the value of the VAT With held Rate field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Retention Rate"; Rec."Retention Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Rate field.';
                }
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Withheld Amount field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Liquidated Damages"; Rec."Liquidated Damages")
                {
                    ApplicationArea = all;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Liquidated Damages field.';
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the W/Tax Code field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("PPRA Code"; Rec."PPRA Code")
                {
                    ApplicationArea = Basic;
                }
                field("PPRA Percentage Amount"; Rec."PPRA Percentage Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PPRA Charge"; Rec."PCBL Charge")
                {
                    ApplicationArea = Basic;
                    Caption = 'PPRA Charge';
                    Editable = true;
                }

                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the W/T VAT Code field.';
                }
                field("Retention Code1"; Rec."Retention Code1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code1 field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code field.';
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the W/Tax Amount field.';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention  Amount field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }

                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obligation WHT field.';
                }
                field(Control27; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obligation WHT field.';
                }
                field("Agency Notice No."; Rec."Agency Notice No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Agency Notice No. field.';
                }
                field("Installment No."; Rec."Installment No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Installment No. field.';
                }
                field("Bill Discounting No"; Rec."Bill Discounting No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Bill Discounting No field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Net Amount';
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Amount field.';
                }
                field("Actual to Date"; Rec."Actual to Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Actual to Date field.';
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Commitments field.';
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Available Funds field.';
                }
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgetary Control A/C field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Claim Doc No."; Rec."Claim Doc No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Doc No. field.';
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Net Pay field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Payee Bank Code"; Rec."Payee Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Bank Code field.';
                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.';
                }
                field("Payee Bank Branch Code"; Rec."Payee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee Bank Branch Code field.';
                }
                field("Payee Bank Account Number"; Rec."Payee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee Bank Account Number field.';
                }
                field("Payee Account Name"; Rec."Payee Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Account Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted Amount field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Committed Amount"; Rec."Committed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committed Amount field.';
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}



