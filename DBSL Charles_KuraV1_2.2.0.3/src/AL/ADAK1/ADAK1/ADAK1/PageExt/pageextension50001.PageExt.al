#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50001 "pageextension50001" extends "Company Information"
{
    layout
    {
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN.';
        }

        //Unsupported feature: Property Insertion (Visible) on "GLN(Control 7)".


        //Unsupported feature: Property Insertion (Visible) on ""Industrial Classification"(Control 76)".


        //Unsupported feature: Property Insertion (Visible) on ""Fax No."(Control 54)".


        //Unsupported feature: Property Insertion (Visible) on ""IC Partner Code"(Control 78)".


        //Unsupported feature: Property Insertion (Visible) on ""IC Inbox Type"(Control 80)".


        //Unsupported feature: Property Insertion (Visible) on ""IC Inbox Details"(Control 82)".


        //Unsupported feature: Property Insertion (Visible) on ""Auto. Send Transactions"(Control 91)".


        //Unsupported feature: Property Insertion (Visible) on ""Allow Blank Payment Info."(Control 3)".


        //Unsupported feature: Property Insertion (Visible) on ""Payment Routing No."(Control 22)".


        //Unsupported feature: Property Insertion (Visible) on ""Giro No."(Control 24)".


        //Unsupported feature: Property Insertion (Visible) on ""SWIFT Code"(Control 72)".


        //Unsupported feature: Property Insertion (Visible) on "IBAN(Control 74)".


        //Unsupported feature: Property Insertion (Visible) on "BankAccountPostingGroup(Control 30)".


        //Unsupported feature: Property Insertion (Visible) on "Shipping(Control 1906801201)".

        addafter("Phone No.")
        {
            field("Phone No. 2"; Rec."Phone No. 2")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Phone No. 2 field.';
            }
        }
        addafter(Picture)
        {
            field("N.S.SF. No."; Rec."N.S.SF. No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the N.S.SF. No. field.';
            }
            field("N.H.I.F No."; Rec."N.H.I.F No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the N.H.I.F No. field.';
            }
            field(RubberStamp; Rec.RubberStamp)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Picture field.';
            }
            field(Motto; Rec.Motto)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Motto field.';
            }
            field("Headed By"; Rec."Headed By")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Headed By field.';
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Current Head field.';
            }
            field("Current Head Name"; Rec."Current Head Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Current Head Name field.';
            }
        }
        addafter(Payments)
        {
            group("Outgoing Emails")
            {
                Caption = 'Outgoing Emails';
                field("Procurement Support E-mail"; Rec."Procurement Support E-mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Support E-mail field.';
                }
                field("Administrator Email"; Rec."Administrator Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Administrator Email field.';
                }
                field("Vendor  Email"; Rec."Vendor  Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor  Email field.';
                }
                field("ICT Email"; Rec."ICT Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Email field.';
                }
            }
            
            group(Files)
            {
                Caption = 'Files';
                field("HR Document Link"; Rec."HR Document Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Document Link field.';
                }
            }
        }
        addafter("Bank Name")
        {
            
            field(Bank; Rec.Bank)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank field.', Comment = '%';
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on ""Report Layouts"(Action 25)".


        //Unsupported feature: Property Insertion (Visible) on ""General Ledger Setup"(Action 52)".


        //Unsupported feature: Property Insertion (Visible) on ""Sales & Receivables Setup"(Action 46)".


        //Unsupported feature: Property Insertion (Visible) on ""Purchases & Payables Setup"(Action 48)".


        //Unsupported feature: Property Insertion (Visible) on ""Inventory Setup"(Action 45)".


        //Unsupported feature: Property Insertion (Visible) on ""Fixed Assets Setup"(Action 44)".


        //Unsupported feature: Property Insertion (Visible) on ""Jobs Setup"(Action 40)".


        //Unsupported feature: Property Insertion (Visible) on ""No. Series"(Action 26)".


        //Unsupported feature: Property Insertion (Visible) on ""Permission Sets"(Action 28)".


        //Unsupported feature: Property Insertion (Visible) on ""Email Account"(Action 23)".


        //Unsupported feature: Property Insertion (Visible) on "Action27(Action 27)".


        //Unsupported feature: Property Insertion (Visible) on ""Countries/Regions"(Action 19)".


        //Unsupported feature: Property Insertion (Visible) on ""Online Map Setup"(Action 15)".


        //Unsupported feature: Property Insertion (Visible) on "Languages(Action 12)".


        //Unsupported feature: Property Insertion (Visible) on ""Source Codes"(Action 9)".


        //Unsupported feature: Property Insertion (Visible) on ""Reason Codes"(Action 5)".

    }
}

