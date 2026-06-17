namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Foundation.Attachment;
using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Posting;

page 50252 "Appr. Loan Issue Surrender"
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
                ApplicationArea = All;
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
            group("P&osting")
            {
                Caption = 'P&ost';
                Image = Post;
                action(Posting)
                {
                    ApplicationArea = All;
                    Caption = 'Post';
                    Image = PostOrder;
                    ToolTip = 'Executes the P&ost action.';

                    trigger OnAction()
                    var
                        StoreLedgers: Record "Store Requisition Notes";
                        entryNo: Integer;
                        ProcurementSetup: Record "Procurement Setup";
                        ItemGnl: Record "Item Journal Line";
                        Linenumber: integer;
                        RequisitionLine: Record "Purchase Line";
                    begin
                        //Post(CODEUNIT::"Purch.-Post (Yes/No)");

                        //TESTFIELD("Budget Item");
                        //TESTFIELD("Job Task No.");
                        if Confirm('Are you sure you would like to surrender this requisition?', false) = true then begin

                            //TESTFIELD("Taken By");
                            Rec.TestField(Rec."Posting Date");
                            ProcurementSetup.Get();
                            //if
                            ItemGnl.Reset;
                            // ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            // ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", ProcurementSetup."Item Journal Template Name");
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", ProcurementSetup."Item Journal Batch Name");
                            ItemGnl.DeleteAll(true);

                            //  ItemGnl.

                            ItemGnl.Reset;
                            // ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            // ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", ProcurementSetup."Item Journal Template Name");
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", ProcurementSetup."Item Journal Batch Name");
                            if ItemGnl.FindLast then
                                Linenumber := ItemGnl."Line No."
                            else
                                Linenumber := 10000;
                            //MESSAGE('%1',Linenumber);

                            RequisitionLine.Reset;

                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine.Type, RequisitionLine.Type::Item);

                            // RequisitionLine.SetRange(RequisitionLine.Select, true);
                            //RequisitionLine.SETRANGE(RequisitionLine."HOD Action",RequisitionLine."HOD Action"::Approved);
                            //RequisitionLine.GET(RequisitionLine."Journal Batch Name");
                            if RequisitionLine.Find('-') then begin
                                repeat
                                    //MESSAGE('RERE');
                                    //MESSAGE("No.");

                                    // if RequisitionLine."Quantity To  Issue" = 0 then
                                    //     Error('YOU CANNOT ISSUE ZERO QUANTITIES.PLEASE CHECK!!');

                                    ItemGnl.Init;

                                    // ItemGnl."Journal Template Name" := 'ITEM';
                                    // ItemGnl."Journal Batch Name" := 'REQ';
                                    ItemGnl."Journal Template Name" := ProcurementSetup."Item Journal Template Name";
                                    ItemGnl."Journal Batch Name" := ProcurementSetup."Item Journal Batch Name";
                                    ItemGnl."Document No." := Rec."No.";
                                    //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                                    //ItemGnl."Posting Date":=20070201D;
                                    //ItemGnl."Posting Date":=RequisitionLine."Order Date";
                                    ItemGnl."Posting Date" := Rec."Posting Date";
                                    ItemGnl."Entry Type" := ItemGnl."entry type"::"Positive Adjmt.";
                                    ItemGnl."Item No." := RequisitionLine."No.";
                                    ItemGnl.Validate("Item No.");
                                    ItemGnl.Description := 'Items issued to:' + Rec."Request-By Name";
                                    ItemGnl."Job No." := RequisitionLine."Job No.";
                                    ItemGnl."Location Code" := RequisitionLine."Location Code";
                                    ItemGnl.Validate(ItemGnl."Job No.");
                                    ItemGnl."Job Task No." := RequisitionLine."Job Task No.";
                                    ItemGnl.Validate(ItemGnl."Job Task No.");

                                    ItemGnl.Quantity := RequisitionLine."Quantity Returned";
                                    ItemGnl.Validate(Quantity);
                                    ItemGnl."Unit of Measure Code" := RequisitionLine."Unit of Measure Code";
                                    ItemGnl.Validate("Unit of Measure Code");

                                    //ItemGnl."ISBN No.":="Taken By";
                                    //Ushindi.....
                                    ItemGnl."Gen. Bus. Posting Group" := RequisitionLine."Gen. Bus. Posting Group";
                                    ItemGnl."External Document No." := RequisitionLine."IR Line Reference";
                                    //Ushindi
                                    ItemGnl."Gen. Prod. Posting Group" := RequisitionLine."Gen. Prod. Posting Group";
                                    ItemGnl."Line No." := Linenumber;
                                    //MESSAGE('%1',RequisitionLine."Dimension Set ID");
                                    ItemGnl.CopyDim(RequisitionLine."Dimension Set ID");
                                    ////ItemGnl."Dimension Set ID":=RequisitionLine."Dimension Set ID";
                                    // ItemGnl."Dimension Set ID":= DimMgt.GetDimensionSetID(RequisitionLine."Dimension Set ID");

                                    //ItemGnl.VALIDATE(ItemGnl."Dimension Set ID");

                                    ItemGnl.Insert(true);


                                    Linenumber := Linenumber + 10000;
                                until RequisitionLine.Next = 0;






                                //post journal.
                                ItemGnl.Reset;
                                // ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                                // ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                                ItemGnl.SetRange(ItemGnl."Journal Template Name", ProcurementSetup."Item Journal Template Name");
                                ItemGnl.SetRange(ItemGnl."Journal Batch Name", ProcurementSetup."Item Journal Batch Name");
                                // ItemGnl.SETRANGE(ItemGnl."Document No.", Rec."No.");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemGnl);

                                Rec."Fully Issued" := true;
                                Rec."Posted By" := UserId;
                                Rec."Posting Date" := Today;
                                Rec.Modify;


                                if PurchaseHeader.Get(PurchaseHeader."Document Type"::"Loan Issue Requisition", Rec."Loan Issue No.") then begin
                                    PurchaseHeader.Surrendered := true;
                                    PurchaseHeader."Surrender Date" := Today;
                                    PurchaseHeader.Modify;
                                end;



                            end else begin
                                //ERROR('YOU HAVE NOT SELECTED ANY LINE.PLEASE CHECK!!');
                            end;

                        end;

                        Rec."Taken By" := '';
                        Rec.Modify;
                        RequisitionLine.Reset;
                        RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                        RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                        // RequisitionLine.SetRange(RequisitionLine.Select, true);
                        if RequisitionLine.Find('-') then begin
                            repeat
                                RequisitionLine."Last Issued By" := UserId;
                                RequisitionLine."Last Issue date" := Today;
                                RequisitionLine."Last Issue Time" := Time;
                                //{IF RequisitionLine."Quantity  issued"<>0 THEN
                                // RequisitionLine."Quantity Partial Issued" := RequisitionLine."Quantity To  Issue";
                                //ELSE
                                //RequisitionLine."Quantity Partial Issued":=0;
                                // RequisitionLine."Quantity  issued" := RequisitionLine."Quantity  issued" + RequisitionLine."Quantity To  Issue";
                                //store requisition ledgers

                                // StoreLedgers.Reset;
                                // if StoreLedgers.FindLast then
                                //     entryNo := StoreLedgers."Entry No";

                                // StoreLedgers.Init;
                                // StoreLedgers."Entry No" := entryNo + 1;
                                // StoreLedgers."Document No" := Rec."No.";
                                // StoreLedgers."Qty. Requested" := RequisitionLine."Qty. Requested";
                                // StoreLedgers."Qty. Approved" := RequisitionLine."Qty Approved";
                                // StoreLedgers."Qty. Issued" := RequisitionLine."Quantity To  Issue";
                                // StoreLedgers."Employee No" := RequisitionLine."Employee No";
                                // StoreLedgers."Employee Name" := RequisitionLine."Employee Name";
                                // StoreLedgers."Item No" := RequisitionLine."No.";
                                // StoreLedgers."Unit Measures" := RequisitionLine."Unit of Measure Code";
                                // StoreLedgers.Description := RequisitionLine.Description;
                                // StoreLedgers."Remaining Qty" := RequisitionLine."Qty Approved" - RequisitionLine."Quantity  issued";
                                // StoreLedgers.Insert(true);


                                // RequisitionLine."Quantity To  Issue" := 0;
                                //

                                RequisitionLine.Select := false;
                                // if RequisitionLine."Quantity  issued" = RequisitionLine."Qty. Requested" then begin
                                //     RequisitionLine."Fully Issued" := true;
                                // end;
                                if RequisitionLine."Quantity Returned" = RequisitionLine."Quantity  issued" then begin
                                    RequisitionLine."Fully Issued" := true;
                                    RequisitionLine."Remaining Quantity" := 0;
                                end else begin
                                    RequisitionLine."Remaining Quantity" := RequisitionLine."Quantity  issued" - RequisitionLine."Quantity Returned";
                                end;
                                RequisitionLine.Modify;






                            until RequisitionLine.Next = 0;

                        end;


                        RequisitionLine.Reset;
                        RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                        RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                        RequisitionLine.SetRange(RequisitionLine."Fully Issued", false);

                        if RequisitionLine.Count > 0 then begin
                            Rec."Partially Issued" := true;
                            Rec."Posting Date" := Today;
                            Rec.Modify;
                        end else begin
                            Rec."Fully Issued" := true;
                            Rec."Partially Issued" := false;
                            Rec."Posting Date" := Today;
                            Rec.Modify;
                        end;


                    end;

                    /*

                    Req.RESET;
                    Req.SETRANGE(Req."Requisition No.","Requisition No.");

                    REPORT.RUN(51061,TRUE,TRUE,Req);
                    END;

                    */
                    //notify the person who requested
                    // EmailNotification.SendStoreRequisitonIssued(Rec);

                }
            }
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
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 3.';
                actionref(Post_Promoted; Posting)
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 1.';
                actionref(Print_Promoted; Print)
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

        PurchaseHeader: Record "Purchase Header";


    local procedure SetControlAppearance()
    begin

    end;
}