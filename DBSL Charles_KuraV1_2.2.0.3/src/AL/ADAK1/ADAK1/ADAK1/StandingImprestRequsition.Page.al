#pragma warning disable AA0005, AA0008, AL0603,AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57148 "Standing Imprest Requsition"
{
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest"), Posted = const(false));

    // UsageCategory = Tasks;
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Account No. field.';
                    Visible = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                    Visible = true;
                }
                field(StandingImprestType; Rec."Standing Imprest Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Standing Imprest Type field.';
                }
                field(PayMode; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                }
                field(ChequeNo; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the cheque No./ EFT No. field.';
                }
                field(ChequeDate; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field(TransferFrom; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer From';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transfer From field.';
                }
                field(BankName; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field(BudgetFundDescription; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget/Fund Description';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Budget/Fund Description field.';
                }
                field(ShortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(Department; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field(ShortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(ConstituencyName; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                    Visible = false;
                }
                field(RegionalManager; Rec."Regional Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Manager field.';
                    visible = false;
                }
                field(RegionalManagerName; Rec."Regional Manager Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Regional Manager Name field.';
                    Visible = false;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field(JobTaskNo; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field(JobName; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(TotalAmount; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Standing Imprest Limit"; Rec."Standing Imprest Limit")
                {
                    ToolTip = 'Specifies the value of the Standing Imprest Limit field.', Comment = '%';
                    Editable = false;
                }
                field(TotalNetAmountLCY; Rec."Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Net Amount LCY';
                    ToolTip = 'Specifies the value of the Total Net Amount LCY field.';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(PostedBy; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field(PostedDate; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
            }
            part(Control1000000021; "Standing Imprest Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No."), "Document Type" = field("Document Type");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(StandingImprest)
            {
                Caption = 'Standing Imprest';
                Image = "Order";
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        Var_Varaint: Variant;
                        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                        StLim: Record "Standing Imprest Limit";
                        CashMgtSetup: Record "Cash Management Setup";
                        FinYear: Code[20];
                        IssuedTotal: Decimal;
                    begin
                        Rec.TestField(Rec.JobNo);
                        Rec.TestField(Rec."Job Task No");
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Rec."Shortcut Dimension 1 Code");
                        Rec.TestField(Rec."Shortcut Dimension 2 Code");

                        CashMgtSetup.Get();
                        FinYear := CashMgtSetup."Current Financial Year";

                        // StLim.Reset();
                        // //  StLim.SetRange("Financial Year", FinYear);
                        // StLim.SetRange("Employee No", Rec."Account No.");
                        // if not StLim.FindFirst() then
                        //     Error(
                        //       'No Standing Imprest Limit exists for Employee %1 in Financial Year %2',
                        //       Rec."Account No.", FinYear);

                        // IssuedTotal := CalcIssuedAmount(FinYear, Rec."Account No.");

                        // if (IssuedTotal + Rec."Total Amount") > StLim."Limit" then
                        //     Error(
                        //       'Requested Amount exceeds Standing Imprest Limit. Limit=%1, Already Issued=%2, Requested=%3',
                        //       StLim."Limit", IssuedTotal, Rec."Total Amount");
                        Rec.CalcFields(Rec."Total Amount");
                        if Rec."Total Amount" > Rec."Standing Imprest Limit" then
                            Error('The Requested Amount %1 exceeds your Standing Imprest Limit %2,Kindly Apply Amount that is withinn your Limit', Rec."Total Amount", Rec."Standing Imprest Limit");

                        Var_Varaint := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Varaint) then
                            CustomApprovalMgt.OnSendDocForApproval(Var_Varaint);
                    end;
                }

                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                separator(Action1000000043)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action(Action1000000040)
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
                        //DocPrint.PrintPurchHeader(Rec);

                        Rec.SETRANGE("No.", Rec."No.");
                        REPORT.RUN(59098, TRUE, TRUE, Rec)//Standing Imprest Print Out

                        // Rec.SetRange(Rec."No.", Rec."No.");
                        // Report.Run(59099, true, true, Rec);//Authority To Incur Expenditure Print Out
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Action1000000038)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    Visible = false;
                    ToolTip = 'Executes the Re&lease action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Visible = false;
                    ToolTip = 'Executes the Re&open action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group(Posting)
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;
                    ToolTip = 'Executes the P&ost action.';

                    trigger OnAction()
                    var
                        payments: Record Payments;
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost."Post Standing Imprest"(Rec);
                        if Payments.Get(Rec."No.") then begin
                        
                    end;
                    end;
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // if UserSetup.Get(UserId) then begin
        //     if UserSetup."Allow Create Standing Imprest" = false then
        //         Error('You do not have permision to create a Standing Imprest');
        Rec."Payment Type" := Rec."payment type"::"Standing Imprest";
        Rec."Interim Standing Imprest" := false;
        Rec."Account Type" := Rec."Account Type"::Employee;
        //end;
        Rec."Document Type" := Rec."document type"::"Standing Imprest";
    end;

    trigger OnOpenPage()
    begin
        // if UserSetup.Get(UserId) then begin
        //     if UserSetup."Allow Create Standing Imprest" = false then
        //         Error('You are currently not allowed to Apply for Standing Imprest, Kindly seek advice from Accounts and Finance office');
        // end;
        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        DimensionValue: Record "Dimension Value";
        DimensionValueList: Page "Dimension Value List";
        UserSetup: Record "User Setup";
        CashMgtSetup: Record "Cash Management Setup";


    //added this procedure
    local procedure CalcIssuedAmount(FinYear: Code[20]; EmployeeNo: Code[20]): Decimal
    var
        Pay: Record Payments;
        Total: Decimal;
        FY: Record "Financial Year Code";
    begin
        if not FY.Get(FinYear) then
            exit(0);

        Pay.SetRange("Payment Type", Pay."Payment Type"::"Standing Imprest");
        Pay.SetRange("Account No.", EmployeeNo);
        Pay.SetRange("Posted", true);
        Pay.SetRange(Date, FY."Starting Date", FY."Ending Date");

        if Pay.FindSet() then
            repeat
                Total += Pay."Total Amount";
            until Pay.Next() = 0;

        exit(Total);
    end;




    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}
