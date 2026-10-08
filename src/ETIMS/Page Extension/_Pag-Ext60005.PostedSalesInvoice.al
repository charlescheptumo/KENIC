pageextension 60005 "Posted Sales Invoice" extends "Posted Sales Invoice"
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
        addafter("Update Document")
        {
            action("ResendToetims")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Resend to Etims';
                Image = "Invoicing-MDL-Send";

                trigger OnAction()
                var
                    WebService: Codeunit ETimsWebService;
                begin
                    WebService.PushSalesInvoice(Rec."No.");
                end;
            }
        }

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
        }
    }

    trigger OnOpenPage()
    var
        webservice: Codeunit ETimsWebService;
    begin
        // webservice.pushSalesInvoices();
    end;
}