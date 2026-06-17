#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57044 "Posted PV Lines"
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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Adavance Type field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    //Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Obligation Total Amount"; Rec."Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligation Total Amount field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
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
                    ToolTip = 'Specifies the value of the Applies to Doc. No field.';
                    //Editable = false;
                }
                field("Invoice No.";Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Number';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field(InvoiceDate;Rec.InvoiceDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Date';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Invoice Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                    //Editable = false;

                    trigger OnValidate()
                    begin
                        //TestField(Status, Status::Open);
                    end;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                    // Editable = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Rate field.';
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Six % Rate field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
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
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgetary Control A/C field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';

                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention  Amount field.';
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
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Code field.';
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
                field("PPRA Code";Rec."PPRA Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PPRA Code field.';
                }
                field("PCBL Charge";Rec."PCBL Charge")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PCBL Charge field.';
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the W/T VAT Code field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
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
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligation WHT field.';
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Pay field.';

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Number field.';
                }
                field("Payee Bank Account Number"; Rec."Payee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Bank Account Number field.';
                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.';
                }
                field("Payee Bank Branch Code"; Rec."Payee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Bank Branch Code field.';
                }
                field("Vendor Bank Name"; Rec."Vendor Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Bank Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Bill Discounting No"; Rec."Bill Discounting No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency notice Total Amount';
                    ToolTip = 'Specifies the value of the Agency notice Total Amount field.';
                }
                field("Agency Notice No."; Rec."Agency Notice No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency notice  VAT';
                    ToolTip = 'Specifies the value of the Agency notice  VAT field.';
                }
                field("Installment No."; Rec."Installment No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice Income Tax';
                    ToolTip = 'Specifies the value of the Agency Notice Income Tax field.';
                }
                field("Agency Notice WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice WHT';
                    ToolTip = 'Specifies the value of the Agency Notice WHT field.';
                }
            }
        }
    }

    actions
    {
    }
}

