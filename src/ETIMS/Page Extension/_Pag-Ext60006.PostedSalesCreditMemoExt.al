pageextension 60006 "Posted Sales Credit Memo Ext" extends "Posted Sales Credit Memo"
{
    layout
    {

        modify("External Document No.")
        {
            ApplicationArea = Basic;
            ToolTip = 'Specifies the value of the External Document No. field.';
            Editable = true;
        }
        modify("Your Reference")
        {
            ApplicationArea = Basic;
            Editable = true;
        }
        addafter("Shipping and Billing")
        {
            group(ETIMS)
            {
                Editable = false;
                field("ETIMS Local Invoice Number"; Rec."ETIMS Local Invoice Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ETIMS Local Invoice Number field.', Comment = '%';
                }
                field("Date"; Rec.EtimsDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Time"; Rec.EtimsTime)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("SCU ID"; Rec."SCU ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SCU ID field.';
                }
                field("CU Invoice Number"; Rec."CU Invoice Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CU Invoice Number field.';
                }
                field("Internal Data"; Rec."Internal Data")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Data field.';
                }
                field("Receipt Signature"; Rec."Receipt Signature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Signature field.';
                }
                field("Kra QR Code"; Rec."Kra QR Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Kra QR Code';
                    Editable = false;
                }
                field("QRCodeUrl"; Rec."QRCodeUrl")
                {
                    ApplicationArea = Basic;
                    Caption = 'KRA QR Code URL';
                    Editable = false;
                    ExtendedDatatype = URL;

                }
                // group(EtimsResponse)
                // {
                //     Caption = 'Etims Responses';
                //     part(eTimsPushCredit; EtimsResponses)
                //     {
                //         Caption = 'Etims Responses';
                //         ApplicationArea = Basic, Suite;
                //         SubPageLink = Code = field("No.");
                //     }
                // }
            }
        }
    }
    actions
    {
        addbefore("Send by &Email")
        {
            //New docs update 

            // action("Update Ext Document")
            // {

            //     Caption = 'Update External & Your Reference Info';
            //     Image = Edit;
            //     ToolTip = 'Add new information that is relevant to the document, such as information from the shipping agent. You can only edit a few fields because the document has already been posted.';
            //     ApplicationArea = Basic;


            //     Ellipsis = true;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     trigger OnAction()
            //     var
            //         PstdSalesCrMemoUpdate: Page "Posted Sales Cr. M. Update Doc";
            //     begin
            //         PstdSalesCrMemoUpdate.LookupMode := true;
            //         PstdSalesCrMemoUpdate.SetRec(Rec);
            //         PstdSalesCrMemoUpdate.RunModal();
            //     end;
            // }
            action(ResendToetims)
            {
                ApplicationArea = Basic;
                Caption = 'Resend to Etims';
                Image = "Invoicing-MDL-Send";
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    WebService: Codeunit ETimsWebService;
                begin
                    // WebService.PushCreditNotes2(Rec."No.");
                end;
            }
        }
        addafter(Print)
        {
            action("Send to KRA")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send To KRA';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                Visible = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    CRL: Record "Custom Report Layout";
                    Customer: Record Customer;
                    URL: Text;
                    EtimsCodeunit: Codeunit ETimsWebService;
                    Confirmed: Boolean;
                    ProgressDilog: Dialog;
                begin
                    Confirmed := Confirm('Are you sure you want to post this Invoice to Etims?', false);
                    if Confirmed then begin
                        ProgressDilog.Open('Syncing To Etims, Please wait...');
                        EtimsCodeunit.PushCreditNote(Rec."No.");
                        Sleep(5000);
                        ProgressDilog.Close();
                        Message('Syncing Complete');
                    end;
                    //();//(Rec."No.")
                    //SendToKRA(Rec."No.");
                end;
            }
            action("Re-Generate KRA QR Code")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Re-Generate KRA QR Code';
                Image = BarCode;
                Promoted = true;
                PromotedCategory = Report;
                Visible = true;

                trigger OnAction()
                var
                    SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                    Confirmed: Boolean;
                    EtimsCodeunit: Codeunit ETimsWebService;
                begin
                    SalesCrMemoHeader.Reset();
                    SalesCrMemoHeader.SetRange("No.", Rec."No.");
                    if not SalesCrMemoHeader.FindFirst() then
                        Error('Sales Credit Memo %1 was not found.', Rec."No.");

                    // Check whether credit memo has been posted to KRA
                    if not SalesCrMemoHeader."Posted To Etims" then
                        Error('This credit memo has not been posted to KRA.');

                    // Check whether QR Code already exists
                    SalesCrMemoHeader.CalcFields("Kra QR Code");
                    if SalesCrMemoHeader."Kra QR Code".HasValue() then
                        Error('A KRA QR Code already exists for this credit memo.');
                    if SalesCrMemoHeader."QRCodeUrl" = '' then
                        Error('KRA QR Code URL is missing. Please synchronize with eTIMS first.');

                    Confirmed := Confirm(
                        'Generate KRA QR Code for credit memo %1?',
                        false,
                        Rec."No.");
                    if not Confirmed then
                        exit;

                    EtimsCodeunit.GenerateBarcodeCr(
                        SalesCrMemoHeader."QRCodeUrl",
                        SalesCrMemoHeader);

                    Message('KRA QR Code generation completed.');
                end;
            }
        }
    }
}
