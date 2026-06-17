namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Sales.Document;
using Microsoft.Foundation.Attachment;
using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Posting;

page 50248 "Posted Loan Issue Card"
{
    ApplicationArea = All;
    Caption = 'Posted Loan Issue Card';
    PageType = Document;
    SourceTable = "Purchase Header";
    RefreshOnActivate = true;
    PopulateAllFields = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                    ApplicationArea = Basic;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                    ApplicationArea = Basic;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the date when the related document was created.';
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = Basic;
                    Caption = 'Reason for borrowing';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                    ApplicationArea = Basic;
                }
                // field("Customer No."; Rec."Customer No.")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Customer No. field.';
                // }
                // field("Customer Name"; Rec."Customer Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Customer Name field.';
                // }
                field("Customer Name2"; Rec."Customer Name2")
                {
                    ToolTip = 'Specifies the value of the Customer Name2 field.', Comment = '%';
                    ApplicationArea = All;
                }



                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field(Address; Rec."Customer Address")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Address field.';
                    }
                    field("Address 2"; Rec."Customer Address2")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Address2 field.';
                    }
                    field(City; Rec."Customer City")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer City field.';
                    }
                    field("Post Code"; Rec."Customer Post Code")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Post Code field.';
                    }
                    field("Country/Region"; Rec."Customer Country")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Country field.';
                    }
                    field("Phone No."; Rec."Customer Phone")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Phone field.';
                    }
                    field("Mobile No."; Rec."Customer Phone2")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Phone2 field.';
                    }
                    field(Email; Rec."Customer Email")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer EMail field.';
                    }
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field(Amount; Rec."Loan Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Loan Amount field.';
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ToolTip = 'Specifies the value of the Surrendered field.', Comment = '%';
                }
            }
            part("Item Lines"; "Loan Item Req. Lines")
            {
                ApplicationArea = Basic;
                UpdatePropagation = Both;
                SubPageLink = "Document No." = field("No.");
            }
        }

        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Purchase Header"), "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            group(Invoicing)
            {
                Caption = 'Invoicing';
                Image = Invoice;
                action("Sales Invoice")
                {
                    Caption = 'Create Sales Invoice';
                    ApplicationArea = Basic;
                    Image = Invoice;
                    ToolTip = 'Executes the Create Sales Invoice action.';

                    trigger OnAction()
                    var
                        SHeader: Record "Sales Header";
                        SLines: Record "Sales Line";
                        PHeader: Record "Purchase Header";
                        PLines: Record "Purchase Line";
                    begin
                        PHeader.Reset;
                        PHeader.SetRange("No.", Rec."No.");
                        if PHeader.FindFirst() then begin
                            PHeader.CalcFields("Loan Amount");

                            SHeader.Init();
                            SHeader."Document Type" := SHeader."Document Type"::Invoice;
                            SHeader."Sell-to Customer No." := PHeader."Customer No.";
                            SHeader.Validate("Sell-to Customer No.");
                            SHeader."Document Date" := Today;
                            SHeader."Posting Date" := Today;
                            SHeader."VAT Reporting Date" := Today;
                            if SHeader.Insert() then begin
                                SLines.Init;
                                SLines."Document No." := SHeader."No.";
                                SLines."Document Type" := SHeader."Document Type";
                                SLines.Type := SLines.Type::"G/L Account";
                                SLines."No." := '';
                                SLines.Validate("No.");
                                SLines.Quantity := 1;
                                SLines.Validate(Quantity);
                                SLines."Unit Price" := PHeader."Loan Amount";
                                SLines.Validate("Unit Price");
                                SLines.Insert();

                                Page.Run(43, SHeader);
                            end;

                            // PLines.Reset;
                            // PLines.SetRange("Document No.", PHeader."No.");
                            // PLines.SetRange("Document Type", PHeader."Document Type");
                            // if PLines.FindSet() then begin

                            // end;
                        end;
                    end;
                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attach Documents';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = true;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }

                action("Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    ToolTip = 'Executes the Print action.';

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("No.", Rec."No.");
                        Rec.FindFirst();
                        Report.Run(Report::"EEM Loan Issue Form", true, true, Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 3.';
                actionref(SalesInvoice_Promoted; "Sales Invoice")
                {
                }

            }
            group(Category_Category4)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 1.';
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    var


    local procedure SetControlAppearance()
    begin

    end;
}