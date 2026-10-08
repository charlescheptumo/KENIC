pageextension 50160 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
{

    layout
    {
        addafter(General)
        {
            group(ETIMS)
            {
                Editable = true;
                field("Posted To Etims"; Rec."Posted To Etims")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted To ETIMS field.';
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
                field("ETIMS Local Invoice Number"; Rec."ETIMS Local Invoice Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ETIMS Local Invoice Number field.';
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
        //             compInfo: Record "Company Information";
        //             count: Integer;
        //         begin
        //             // WebService.pushSalesInvoices2(Rec."No.");                    
        //             WebService.PushSalesInvoice(Rec."No.");
        //         end;
        //     }
        // }
        addfirst(processing)
        {
            // action("Update Ext Document")
            // {
            //     Caption = 'Update KRA External & Your Reference Info';
            //     Image = Edit;
            //     ToolTip = 'Add new information that is relevant to the document, such as information from the vendor or shipping agent. You can only edit a few fields because the document has already been posted.';
            //     ApplicationArea = Basic;

            //     Ellipsis = true;
            //     Promoted = true;
            //     PromotedCategory = Process;

            //     trigger OnAction()
            //     var
            //         PstdPurchInvUpdate: Page "Posted Purch. Inv. - Update Cu";
            //     begin
            //         PstdPurchInvUpdate.LookupMode := true;
            //         PstdPurchInvUpdate.SetRec(Rec);
            //         PstdPurchInvUpdate.RunModal();
            //     end;
            // }
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
                    compInfo: Record "Company Information";
                    count: Integer;
                begin
                    Confirmed := Confirm('Are you sure you want to post this Invoice to Etims?', false);
                    if Confirmed then begin
                        ProgressDilog.Open('Syncing To Etims, Please wait...');
                        EtimsCodeunit.PushPurchaseInvoice(Rec."No.");
                        Sleep(5000);
                        ProgressDilog.Close();
                        Message('Syncing Complete');
                    end;
                    //(Rec."No.")
                    //SendToKRA(Rec."No.");
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
