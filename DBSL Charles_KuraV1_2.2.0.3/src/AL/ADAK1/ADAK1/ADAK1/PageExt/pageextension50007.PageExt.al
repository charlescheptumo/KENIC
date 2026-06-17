#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50007 "pageextension50007" extends "Customer Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Customer Card"(Page 21)".

    layout
    {
        modify("No.")
        {
            Editable = false;
        }

        addafter(Name)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = Basic;
                Caption = 'Customer Type';
                Visible = false;
                ToolTip = 'Specifies the value of the Customer Type field.';
            }
        }
        moveafter("NAME"; "VAT Registration No.")
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN';
            //ShowMandatory = true;
            trigger OnBeforeValidate()
            var
                vendor1: Record Vendor;
            begin

                // IF vendor1.GET(REC."VAT Registration No.") then
                //     Error('Vat Registration Number Already Exists!');

            end;
        }
        addafter("Privacy Blocked")
        {
            field("Funding Class"; Rec."Funding Class")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Funding Class field.';
            }
        }
        addafter("Disable Search by Name")
        {
            field("Advance Payment Contractor No"; Rec."Advance Payment Contractor No")
            {
                ApplicationArea = Basic;
                Editable = true;
                ToolTip = 'Specifies the value of the Advance Payment Contractor No field.';
            }
        }
        addafter("Preferred Bank Account Code")
        {
            field("Customer's Bank"; Rec."Employee's Bank")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee''s Bank field.';
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Bank Name field.';
            }
            field("Bank Branch"; Rec."Bank Branch")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Bank Branch field.';
            }
            field("Bank Branch Name"; Rec."Bank Branch Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Bank Branch Name field.';
            }
            field("Bank Account Number"; Rec."Bank Account Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Bank Account Number field.';
            }

        }
    }
    actions
    {
        //  modify(NewSalesInvoiceAddin)
        //          {
        //              Visible = false;
        //          }

        // modify(NewSalesInvoiceAddin)
        // {
        //     Visible = false;
        // }
        // modify(Flow)
        // {
        //     Visible = false;
        // }
        // addafter(NewSalesQuoteAddin)
        // {
        //     action(NewSalesInvoiceAddin)
        //     {
        //         AccessByPermission = TableData "Sales Header"=RIM;
        //         ApplicationArea = Basic,Suite;
        //         Caption = 'Sales Invoice';
        //         Image = NewSalesInvoice;
        //         Promoted = true;
        //         PromotedCategory = Category4;
        //         PromotedOnly = true;
        //         ToolTip = 'Create a sales invoice for the customer.';
        //         Visible = IsOfficeAddin;

        //         trigger OnAction()
        //         begin
        //             CreateAndShowNewInvoice;
        //         end;
        //     }
        // }
        // addafter(CancelApprovalRequest)
        // {
        //     group(Flow)
        //     {
        //         Caption = 'Flow';
        //     }
        // }
        addafter(Email)
        {
            action(SendSMS)
            {
                ApplicationArea = All;
                Caption = 'Send SMS';
                Image = Send;
                ToolTip = 'Send an SMS to this customer.';

                // 🔥 ADD THESE
                Promoted = true;
                PromotedCategory = Category4; // Same group as Email usually
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SMSDialog: Page "Send SMS Dialog";
                    DefaultMessage: Text;
                begin
                    // Validate phone number
                    if Rec."Mobile Phone No." = '' then
                        Error('Customer does not have a mobile phone number.');

                    // Default message (optional)
                    DefaultMessage := StrSubstNo('Dear %1, ', Rec.Name);

                    // Open dialog
                    SMSDialog.SetDefaults(Rec."Mobile Phone No.", DefaultMessage);
                    SMSDialog.RunModal();
                end;
            }
        }
    }
    //Unsupported feature: Property Deletion (RefreshOnActivate).
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement officer" = false then begin
                if UserSetup."Procurement Manager" = false then
                    error('You Do Not Have Permissions For This Action,Consult ICT or Supply Chain Office');
            end;
        end;
    end;

    var
        UserSetup: Record "User Setup";

}

