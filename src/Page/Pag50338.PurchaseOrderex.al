namespace KICD.KICD;

using Microsoft.Purchases.Document;
pageextension 50338 "Purchase Order Exten" extends "Purchase Order"
{
    layout
    {
        modify("Quotation No.")
        {
            Caption = 'Reference No.';
        }
    }

    actions
    {
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            var
                Err001: Label 'Please Validate the Reference Number';
            begin
                if Rec."Quotation No." = '' then
                    Error(Err001);

                Rec.Validate("Your Reference", Rec."Quotation No.");
                Rec.Modify(true);
            end;
        }

        addlast(processing)
        {
            action(CreatePurchaseInvoice)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Purchase Invoice';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = NewPurchaseInvoice;
                ToolTip = 'This action assists in creation of purchase invoices for processing by Finance Department.';

                trigger OnAction()
                var
                    Purch38: Record "Purchase Header";
                    PurchLine: Record "Purchase Line";
                    ProcurementProcessing: Codeunit "Procurement Processing";
                    text001: Label 'Vendor invoice already exists for this Purchase Order.';
                begin
                    // Check for existing invoice
                    Purch38.Reset();
                    Purch38.SetRange("Document Type", Purch38."Document Type"::Invoice);
                    Purch38.SetRange("Vendor Invoice No.", Rec."Vendor Invoice No.");

                    if Purch38.FindSet() then
                        Error(text001);

                    // Validate Purchase Lines
                    PurchLine.Reset();
                    PurchLine.SetRange("Document No.", Rec."No.");
                    if PurchLine.FindFirst() then begin
                        repeat
                            if PurchLine."Qty. to Receive" = 0 then
                                Error('Kindly indicate the quantity to invoice');
                        until PurchLine.Next() = 0;
                    end;

                    // Invoice creation logic
                    if not Rec."Purchase Invoice Created " then begin
                        if Confirm('Are you sure you want to upload vendor invoice for this Purchase Order?', true) then begin
                            if Rec.Status <> Rec.Status::Released then
                                Error('This document must be fully approved for you to upload a vendor invoice!!');
                            ProcurementProcessing.CreateInvoice(Rec);
                        end;
                    end else begin
                        if Confirm('Are you sure you want to create another vendor invoice for this Purchase Order?', true) then begin
                            if Rec.Status <> Rec.Status::Released then
                                Error('This document must be fully approved for you to create a vendor invoice!!');
                            ProcurementProcessing.CreateInvoice(Rec);
                        end;
                    end;
                end;
            }
        }
    }
}

// {
//     layout
//     {
//         modify("Quotation No.")
//         {
//             Caption = 'Reference No.';
//         }
//     }

//     actions
//     {
//         modify(SendApprovalRequest)
//         {
//             trigger OnBeforeAction()
//             var
//                 Err001: Label 'Please Validate the Reference Number';
//             begin
//                 if Rec."Quotation No." = '' then
//                     Error(Err001);

//                 Rec.Validate("Your Reference", Rec."Quotation No.");
//                 Rec.Modify(true);
//             end;
//         }
//         modify(Email)
//         {
//          action(CreatePurchaseInvoice)
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Create Purchase Invoice';
//                     Ellipsis = true;
//                     Image = NewPurchaseInvoice;
//                     ToolTip = 'This action assists in creation of purchase invoices for processing by Finance Department.';

//                     trigger OnAction()
//                     var

//                         Purch38: Record "Purchase Header";
//                         PurchLine: Record "Purchase Line";
//                         ProcurementProcessing: Codeunit "Procurement Processing";

//                         text001: Label 'Vendor invoice already exists for this Purchase Order.';

//                     begin
//                         // Check for existing invoice
//                         Purch38.Reset();
//                         Purch38.SetRange("Document Type", Purch38."Document Type"::Invoice);
//                         Purch38.SetRange("Vendor Invoice No.", Rec."Vendor Invoice No.");

//                         if Purch38.FindSet() then
//                             Error(text001);

//                         // Validate Purchase Lines
//                         PurchLine.Reset();
//                         PurchLine.SetRange("Document No.", Rec."No.");
//                         if PurchLine.FindFirst() then begin
//                             repeat
//                                 if PurchLine."Qty. to Receive" = 0 then
//                                     Error('Kindly indicate the quantity to invoice');
//                             until PurchLine.Next() = 0;
//                         end;

//                         // Invoice creation logic
//                         if not Rec."Purchase Invoice Created " then begin
//                             if Confirm('Are you sure you want to upload vendor invoice for this Purchase Order?', true) then begin
//                                 if Rec.Status <> Rec.Status::Released then
//                                     Error('This document must be fully approved for you to upload a vendor invoice!!');
//                                 ProcurementProcessing.CreateInvoice(Rec);
//                                 //ProcurementProcessing.CreateInvoice(Rec);
//                             end;
//                         end else begin
//                             if Confirm('Are you sure you want to create another vendor invoice for this Purchase Order?', true) then begin
//                                 if Rec.Status <> Rec.Status::Released then
//                                     Error('This document must be fully approved for you to create a vendor invoice!!');
//                                 ProcurementProcessing.CreateInvoice(Rec);
//                             end;
//                         end;
//                     end;

//                     // DocPrint: Codeunit "Document-Print";
//                     //PurchaseHeader: Record "Purchase Header";

//                     // IF "Invoice Created"=FALSE THEN BEGIN 
//                     // IF CONFIRM('Are you sure you want to upload vendor invoice for this Purchase Order?',TRUE) THEN BEGIN
//                     //IF Status<>Status::Released THEN 
//                     // ERROR('This document must be fully approved for you to upload a vendor invoice!!');
//                     //ProcurementProcessing.CreateInvoice(Rec);
//                     //END;
//                     // END;



//                     // begin
//                     // DocPrint.EmailPurchHeader(Rec);
//                     //end;
//                 }


//     }
//     }
// }
