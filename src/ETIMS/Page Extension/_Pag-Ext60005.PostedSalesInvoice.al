pageextension 60005 "Posted Sales Invoice" extends "Posted Authentication Sales"
{
    layout
    {
        addafter("Foreign Trade")
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

    actions
    {
        // addafter("Update Document")
        // {
        //     action("ResendToetims")
        //     {
        //         ApplicationArea = Basic, Suite;
        //         Caption = 'Resend to Etims';
        //         Image = "Invoicing-MDL-Send";

        //         trigger OnAction()
        //         var
        //             WebService: Codeunit ETimsWebService;
        //         begin
        //             WebService.PushSalesInvoice(Rec."No.");
        //         end;
        //     }
        // }

        addafter(Email)
        {

            // =========================================================
            // NEW ACTION: DOWNLOAD INVOICE USING EXTERNAL DOCUMENT NO.
            // =========================================================
            // action("Download Invoice (GRN NO.)")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Download Invoice (GRN No.)';
            //     Image = Export;
            //     Promoted = true;
            //     PromotedCategory = Report;

            //     trigger OnAction()
            //     var
            //         SalesInvHeader: Record "Sales Invoice Header";
            //         RecRef: RecordRef;
            //         TempBlob: Codeunit "Temp Blob";
            //         OutS: OutStream;
            //         InS: InStream;
            //         FileName: Text;
            //     begin
            //         // Get record
            //         SalesInvHeader.Get(Rec."No.");

            //         // Build filename using External Document No.
            //         if SalesInvHeader."GRN No." <> '' then
            //             FileName := SalesInvHeader."GRN No." + '.pdf'
            //         else
            //             FileName := SalesInvHeader."No." + '.pdf';

            //         // Convert record to RecordRef
            //         RecRef.GetTable(SalesInvHeader);

            //         // Create output stream (PDF will be written here)
            //         TempBlob.CreateOutStream(OutS);

            //         // Save report into stream (IMPORTANT: correct signature)
            //         Report.SaveAs(
            //             Report::"Sales - Invoice test",
            //             '',
            //             ReportFormat::Pdf,
            //             OutS,
            //             RecRef
            //         );

            //         // Convert to InStream for download
            //         TempBlob.CreateInStream(InS);

            //         // Download file
            //         DownloadFromStream(
            //             InS,
            //             '',
            //             '',
            //             '',
            //             FileName
            //         );
            //     end;
            // }
            // =========================================================
            // END NEW ACTION
            // =========================================================
            // action("Update Ext Document")
            // {
            //     Caption = 'Update External & Your Reference Info';
            //     Image = Edit;
            //     ApplicationArea = Basic;
            //     Ellipsis = true;
            //     Promoted = true;
            //     PromotedCategory = Process;

            //     trigger OnAction()
            //     var
            //         PstdSalesCrMemoUpdate: Page "Posted Sales Inv. - Update Cus";
            //     begin
            //         PstdSalesCrMemoUpdate.LookupMode := true;
            //         PstdSalesCrMemoUpdate.SetRec(Rec);
            //         PstdSalesCrMemoUpdate.RunModal();
            //     end;
            // }

            action("Send to KRA")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send To KRA';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    EtimsCodeunit: Codeunit ETimsWebService;
                    ProgressDialog: Dialog;
                    Confirmed: Boolean;
                begin
                    Confirmed := Confirm('Are you sure you want to post this Invoice to Etims?', false);
                    if Confirmed then begin
                        ProgressDialog.Open('Syncing To Etims, Please wait...');
                        EtimsCodeunit.PushSalesInvoice(Rec."No.");
                        Sleep(5000);
                        ProgressDialog.Close();
                        Message('Syncing Complete');
                    end;
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
                    SalesInvHeader: Record "Sales Invoice Header";
                    Confirmed: Boolean;
                    EtimsCodeunit: Codeunit ETimsWebService;
                begin
                    SalesInvHeader.Reset();
                    SalesInvHeader.SetRange("No.", Rec."No.");
                    if not SalesInvHeader.FindFirst() then
                        Error('Sales Invoice %1 was not found.', Rec."No.");

                    // Check whether invoice has been posted to KRA
                    if not SalesInvHeader."Posted To Etims" then
                        Error('This invoice has not been posted to KRA.');

                    // Check whether QR Code already exists
                    SalesInvHeader.CalcFields("Kra QR Code");
                    if SalesInvHeader."Kra QR Code".HasValue() then
                        Error('A KRA QR Code already exists for this invoice.');
                    if SalesInvHeader."QRCodeUrl" = '' then
                        Error('KRA QR Code URL is missing. Please synchronize with eTIMS first.');

                    Confirmed := Confirm(
                        'Generate KRA QR Code for invoice %1?',
                        false,
                        Rec."No.");
                    if not Confirmed then
                        exit;

                    EtimsCodeunit.GenerateBarcode(
                        SalesInvHeader."QRCodeUrl",
                        SalesInvHeader);

                    Message('KRA QR Code generation completed.');
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        webservice: Codeunit ETimsWebService;
    begin
        // webservice.pushSalesInvoices();
    end;
}