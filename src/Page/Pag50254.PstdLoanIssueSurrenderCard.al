namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Inventory.Journal;
using Microsoft.Foundation.Attachment;

page 50254 "Pstd Loan Issue Surrender Card"
{
    ApplicationArea = All;
    Caption = 'Loan Issue Surrender Card';
    SourceTable = "Purchase Header";
    PageType = Document;
    RefreshOnActivate = true;
    PopulateAllFields = true;
    DeleteAllowed = false;
    InsertAllowed = false;

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
                field("Loan Issue No."; Rec."Loan Issue No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Issue No. field.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PHeader: Record "Purchase Header";
                    begin
                        PHeader.Reset;
                        if Page.RunModal(Page::"Posted Loan Issue Req.", PHeader) = Action::LookupOK then
                            Rec."Loan Issue No." := PHeader."No.";
                    end;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issue Date field.', Comment = '%';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Return Date field.', Comment = '%';
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
            }
            part("Item Lines"; "Loan Item Surrender Lines")
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
                        Report.Run(Report::"EEM Loan Issue Surrender Form", true, true, Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            // group(Category_New)
            // {
            //     Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 3.';
            //     // actionref(SalesInvoice_Promoted; "Sales Invoice")
            //     // {
            //     // }

            // }
            group(Category_Process)
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