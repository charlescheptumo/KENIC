#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57067 "Receipt"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = const(false), "Direct Income Voucher" = const(false));
    PromotedActionCategories = 'New,Process,Report,Approvals,';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Transaction No';
                    ToolTip = 'Specifies the value of the Transaction No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ToolTip = 'Specifies the value of the Total Net Amount field.', Comment = '%';
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ToolTip = 'Specifies the value of the Total VAT Amount field.', Comment = '%';
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                    visible = false;
                }
                field("Receipt Status"; Rec."Receipt Status")
                {
                    ToolTip = 'Specifies the value of the Receipt Status field.', Comment = '%';
                    ApplicationArea = Basic;
                    Enabled = Rec."Receipt Status" = Rec."Receipt Status"::Open;
                }

                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';

                    trigger OnAssistEdit()
                    begin
                        // Clear(ChangeExchangeRate);
                        // if Date <> 0D then
                        //   ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",Date)
                        // else
                        //   ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WorkDate);
                        // if ChangeExchangeRate.RunModal = Action::OK then begin
                        //   Validate("Currency Factor",ChangeExchangeRate.GetParameter);
                        //   CurrPage.Update;
                        // end;
                        // Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received From field.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Customer: Record Customer;
                    begin
                        if Page.RunModal(Page::"Customer Lookup", Customer) = Action::LookupOK then begin
                            Text := Customer.Name;
                            exit(true);
                        end;
                    end;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Behalf Of field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted Time field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                part("Attached Documents1"; "Doc. Attachment List Factbox1")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(56007), "No." = FIELD("No.");

                }
            }
            part(Control1000000017; "Receipt Lines")
            {
                SubPageLink = "Receipt No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Outlook)
            {
            }
            systempart(Control1000000024; Notes)
            {
            }
            systempart(Control1000000025; MyNotes)
            {
            }
            systempart(Control1000000026; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = New;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    /*
                    usersetup.GET(USERID);
                    IF usersetup."Post Receipts"=FALSE THEN
                    ERROR(Text0001);
                    usersetup.RESET;
                    IF usersetup."User ID"=Cashier THEN
                     ERROR('You cannot create and post the receipt, Alternative Cashier should post');
                     */

                    Rec.TestField("Received From");
                    Rec.TestField("On Behalf Of");

                    if Rec."Receipt Status" = Rec."Receipt Status"::Released then
                        PaymentPost.PostReceipt(Rec)

                    else
                        error('Receipt Must Be Fully Released.');
                    CurrPage.Close;


                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';

                trigger OnAction()
                begin
                    if Rec."Receipt Status" <> Rec."Receipt Status"::Released then
                        error('The receipt status must be set to Released before you can print it');
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Reversal A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send A&pproval Request action.';
                // Enabled = rec.Posted = true;
                Visible = isVisible;

                trigger OnAction()
                VAR
                    RecRef: RecordRef;
                    CustomApprovalEntry: Record "Custom Approval Entry";
                    OldStatus: Option;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    if not Confirm('Are you sure you want to send this receipt for Reversal approval?') then
                        exit;

                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                    //Check Applies to Doc No...
                    // ReceiptLines1.Reset;
                    // ReceiptLines1.SetRange(ReceiptLines1."Receipt No.","No.");
                    // ReceiptLines1.SetFilter(ReceiptLines1.Amount,'<>%1',0);
                    // if ReceiptLines1.FindSet then begin
                    //   if ReceiptLines1."Account Type" in[ReceiptLines1."account type"::Customer] then
                    //   repeat

                    //   ReceiptLines1.TestField("Applies to Doc. No");
                    //   until ReceiptLines1.Next=0;
                    //   end;
                    // if Status in [Status::Open] then begin
                    // if ApprovalsMgmt.CheckReceiptApprovalsWorkflowEnabled(Rec) then
                    // ApprovalsMgmt.OnSendReceiptForApproval(Rec);
                    // end;
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Reversal Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                // Enabled = rec.Posted = true;
                Visible = isVisible;

                trigger OnAction()
                var
                    RecRef: RecordRef;
                    CustomApprovalEntry: Record "Custom Approval Entry";
                    OldStatus: Option;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    // if Status in [Status::"Pending Approval"] then
                    //  ApprovalsMgmt.OnCancelReceiptApprovalRequest(Rec);
                    if not Confirm('Are you sure you want to CANCEL this receipt for approval?') then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                AccessByPermission = TableData "Approval Entry" = R;
                ApplicationArea = Suite;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                trigger OnAction()
                var
                    WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    ApprovalEntries: Page "Approval Entries";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
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
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                    Doc: Record "Document Attachment";
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                    // DMSManagement.UploadProcurementLawsDocuments("No.",'Receipt Processing',RecordId,"Responsibility Center");
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
    begin
        InitializeVisibility();
    end;

    local procedure InitializeVisibility()
    var

    begin
        if rec.Posted = true then
            isVisible := true;


    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        isVisible: Boolean;
}
#pragma implicitwith restore
