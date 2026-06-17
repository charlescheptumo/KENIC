#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57215 "Bill Discounting Header"
{
    PageType = Card;
    SourceTable = "Bill Discounting Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Crearted Time"; Rec."Crearted Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Crearted Time field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Bank No"; Rec."Bank No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bank No field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Branch No"; Rec."Bank Branch No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch No field.';
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Branch Name field.';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Account Name field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Approval  Status"; Rec."Approval  Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval  Status field.';
                }
                field("Total Discountable Amount"; Rec."Total Discountable Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Discounted Amount';
                    ToolTip = 'Specifies the value of the Total Discounted Amount field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted DateTime"; Rec."Posted DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted DateTime field.';
                }
                field("Total Discounted Amount"; Rec."Total Discounted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Gross Amount';
                    ToolTip = 'Specifies the value of the Total Gross Amount field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Wthheld six % field.';
                }
                field("Total Retention"; Rec."Total Retention")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Retention field.';
                }
                field("Total Advance Recovery"; Rec."Total Advance Recovery")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Advance Recovery field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Discountable Amount';
                    ToolTip = 'Specifies the value of the Total Discountable Amount field.';
                }
            }
            part(Control19; "Bill Discounting Line SubPage")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Contractor No" = field("Contractor No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin

                    if not Confirm('Are you sure you want to post the Bill?') then
                        exit;
                    //TESTFIELD(Posted);

                    // BillDiscountingLine.RESET;
                    // BillDiscountingLine.SETRANGE("Document No","Document No");
                    // BillDiscountingLine.SETRANGE("Contractor No","Contractor No");
                    // IF BillDiscountingLine.FINDSET THEN BEGIN
                    //  REPEAT
                    //    VendorLedgerEntry.RESET;
                    //    VendorLedgerEntry.SETRANGE("Document No.",BillDiscountingLine."Pending Certificate No.");
                    //    IF VendorLedgerEntry.FINDSET THEN BEGIN
                    //      VendorLedgerEntry.Discounted:=TRUE;
                    //      VendorLedgerEntry.MODIFY(TRUE);
                    //      END;
                    // UNTIL BillDiscountingLine.NEXT=0;
                    //  END;


                    BillDiscountingLine.Reset;
                    BillDiscountingLine.SetRange("Document No", Rec."Document No");
                    if BillDiscountingLine.FindSet then begin
                        PurchInvHeader.Reset;
                        PurchInvHeader.SetRange(PurchInvHeader."No.", BillDiscountingLine."Pending Certificate No.");
                        if PurchInvHeader.FindSet then begin
                            PurchInvHeader.Discounted := true;
                            PurchInvHeader.Modify(true);
                        end;
                    end;

                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted DateTime" := CreateDatetime(Today, Time);
                    Rec.Modify(true);
                    Message('Posted Successfully');
                    CurrPage.Close;
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadPaymentsDocuments(Rec."Document No", 'Bill Discounting', Rec.RecordId, Rec."Region Code");
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    // if ApprovalsMgmt.CheckBDiscountReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendBDiscountReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OnCancelBDiscountReqApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approve action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Basic;
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Delegate action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                end;
            }
            action("Bill Discount")
            {
                ApplicationArea = Basic;
                Caption = 'Bill Discounting Report';
                Image = PrintDocument;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Bill Discounting Report action.';

                trigger OnAction()
                var
                    PVLines: Record "PV Lines";
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
                    if Rec.FindSet then
                        Report.Run(59104, true, true, Rec);
                end;
            }
        }
    }

    var
        BillDiscHeader: Record "Bill Discounting Header";
        DMSManagement: Codeunit "DMS Management";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        BillDiscountingLine: Record "Bill Discounting Line";
        PurchInvHeader: Record "Purch. Inv. Header";
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

