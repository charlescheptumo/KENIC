
PageExtension 50019 "pageextension50019" extends "Purchase Order"
{


    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Description"(Control 110)".

        modify("Vendor Order No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Vendor Order No."(Control 16)".


            //Unsupported feature: Property Modification (Name) on ""Vendor Order No."(Control 16)".

        }
        modify("Vendor Invoice No.")
        {
            Visible = true;
        }
        addafter("Assigned User ID")
        {
            field("Requester ID"; Rec."Requester ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Requester ID field.';
            }
            field("Request-By Name"; Rec."Request-By Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Request-By Name field.';
            }

        }

        modify("Vendor Shipment No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Vendor Shipment No."(Control 18)".


            //Unsupported feature: Property Modification (Name) on ""Vendor Shipment No."(Control 18)".

        }


        modify("Assigned User ID")
        {
            Editable = false;
        }
        modify(Status)
        {
            Editable = false;
        }
        modify("Job Queue Status")
        {
            ApplicationArea = Basic;


        }



        modify("No. of Archived Versions")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }



        addafter("Order Date")
        {
            field("Procurement Type"; Rec."Procurement Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Procurement Type field.';
            }
            field(PRN; Rec.PRN)
            {
                ApplicationArea = All;
                Caption = 'Linked PRN';
                ToolTip = 'Specifies the value of the PRN field.';
            }
            field("Procurement Method"; Rec."PP Procurement Method")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the PP Procurement Method field.';
            }
            field("Procurement Preference"; Rec."PP Preference/Reservation Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the PP Preference/Reservation Code field.';
            }

        }
        addafter("Assigned User ID")
        {
            // field("Your Reference"; Rec."Your Reference")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'External Document No.';
            // }
        }
        addafter("Buy-from Vendor Name")
        {
            FIELD("Quotation No."; Rec."Quotation No.")
            {
                ApplicationArea = BASIC;
                ToolTip = 'Specifies the value of the Quotation No. field.';
            }

            FIELD("Quotation Description"; Rec."Quotation Description")
            {
                ApplicationArea = BASIC;
                Visible = true;
                ToolTip = 'Specifies the value of the Quotation Description field.';
            }
        }
        addafter(Status)
        {
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Receiving No. Series field.';
            }
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Posting No. field.';
            }
        }
        moveafter("Due Date"; "Job Queue Status")
        moveafter("Vendor Invoice No."; "Vendor Shipment No.")
        moveafter("Order Date"; "Responsibility Center")
        //   moveafter("Requisition No";Status)
        //  moveafter(Status; PurchLines)
        addafter(ApprovalFactBox)
        {
            systempart(Links;Links)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        modify("&Print")
        {
            Caption = 'Print LPO';
            // VISIBLE = FALSE;

        }







        addafter("Co&mments")
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FALSE;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadPurchaseorderDocuments(Rec."No.", 'Imprest Memo', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
        }
        addafter("F&unctions")
        {
            group(Committment)
            {
                Caption = 'Committment';
                action("Commit Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Commit Entries';
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Commit Entries action.';

                    trigger OnAction()
                    begin
                        CommittmentMgt.LPOCommittment(Rec);
                    end;
                }
                action("Reverse Commit Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reverse Commit Entries';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Reverse Commit Entries action.';

                    trigger OnAction()
                    begin
                        //CommittmentMgt.ReverseLPOCommittment(Rec);
                    end;
                }
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Check Budget Availability action.';

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        CommittmentMgt.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Budget Commitment action.';

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
                action("Print Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Purchase Order';
                    Image = PrintVoucher;
                    Promoted = true;
                    PromotedCategory = Category10;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print Purchase Order action.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        CurrPage.SetSelectionFilter(Rec);
                        Report.Run(50000, true, false, Rec)
                    end;
                }
            }
        }
        addfirst(Print)
        {
            action("Print LSO")
            {
                ApplicationArea = Basic;
                Caption = 'Print LSO';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category10;
                PromotedIsBig = true;
                Visible = FALSE;
                ToolTip = 'Executes the Print LSO action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    CurrPage.SetSelectionFilter(Rec);
                    Report.Run(70027, true, false, Rec)
                end;
            }
            action("Print Purchase Order1")
            {
                ApplicationArea = Basic;
                Caption = 'Print Purchase Order';
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Category10;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Purchase Order action.';
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Reset;
                    CurrPage.SetSelectionFilter(Rec);
                    Report.Run(50000, true, false, Rec)
                end;
            }

        }

    }
    trigger OnOpenPage()
    begin
        IF (rec.Status = rec.Status::"Pending Approval") then
            CurrPage.Editable := false;

        editable := true;

    end;

    var
        editable: Boolean;
        CommittmentMgt: Codeunit "Procurement Processing";
        DeleteCommitment: Record "Commitment Entries1";
        PVLines: Record "Purchase Line";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        UserMgt: record "User Setup";




}


PageExtension 50153 "pageextension50153" extends "Purchase Order List"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Quotation Description";
            Rec."Quotation Description")
            {
                ApplicationArea = basic;
                ToolTip = 'Specifies the value of the Quotation Description field.';
            }
        }
        addafter("Quotation Description")
        {
            field(PRN; Rec.PRN)
            {
                ApplicationArea = basic;
                caption = 'Linked PRN';

                Editable = FALSE;
                ToolTip = 'Specifies the value of the PRN field.';
            }
        }
        addlast(Control1)
        {
            field(Rejected; Rec.Rejected)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Rejected field.';
            }
        }
    }
}


