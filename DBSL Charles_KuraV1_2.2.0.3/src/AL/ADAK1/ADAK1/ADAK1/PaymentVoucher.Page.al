#pragma warning disable AA0005, AA0008, AA0018,AL0603, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 57001 "Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = payments;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release';
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(false),
                            Status = filter(Open | "Pending Approval"));
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
                    //Editable = not OpenApprovalEntriesExist;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                    ShowMandatory = true;

                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Advance Payment"; Rec."Advance Payment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Payment field.';
                }

                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Archive Document field.';
                }


                group("Bank Details")
                {
                    Visible = VisibleOnDocApproved;
                    field("Paying Bank Account"; Rec."Paying Bank Account")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Paying Bank Account field.';

                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name field.';
                    }
                    field("Source Bank Acc No."; Rec."Source Bank Acc No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Source Bank Acc No. field.';
                    }
                    field("Pay Mode"; Rec."Pay Mode")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                    }
                    field("Cheque No/Reference No"; Rec."Cheque No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the cheque No./ EFT No. field.';
                    }
                    field("Cheque Date"; Rec."Cheque Date")
                    {
                        ApplicationArea = Basic;
                        Editable = not OpenApprovalEntriesExist;
                        Visible = false;
                        ToolTip = 'Specifies the value of the Cheque Date field.';
                    }
                }
                field("Retention Account"; Rec."Retention Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Retention Account field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Job No."; Rec.Job)
                {
                    ApplicationArea = basic;
                    ToolTip = 'Specifies the value of the Job field.';
                    ShowMandatory = true;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget/Exchequer Account';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Budget/Exchequer Account field.';
                    ShowMandatory = true;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Line';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Budget Line field.';
                    ShowMandatory = true;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross Amount Incl. VAT';
                    ToolTip = 'Specifies the value of the Gross Amount Incl. VAT field.';
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
                    Caption = 'VAT Wthheld Amount';
                    ToolTip = 'Specifies the value of the VAT Wthheld Amount field.';
                }
                field("Total PAYE Amount"; Rec."Total PAYE Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total PAYE Amount field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("PPRA Charge"; Rec."PCBL Charge")
                {
                    ApplicationArea = Basic;
                    Caption = 'PPRA Charge';
                    Editable = false;
                    ToolTip = 'Specifies the value of the PPRA Charge field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';
                }
                field("Total Liquidated Damages"; Rec."Total Liquidated Damages")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Liquidated Damages field.';
                }
                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obligation WHT field.';
                }
                field("Obligation VAT"; Rec."Obligation VAT")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obligation VAT field.';
                }
                field("Obligation Income Tax"; Rec."Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obligation Income Tax field.';
                }
                field("Total Obligation Amount"; Rec."Total Obligation Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Obligation Amount field.';
                }
                field("Total Supervision Cost"; Rec."Total Supervision Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Supervision Cost field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the PV Remaining Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = FALSE;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                group("Employee Bank Details")
                {
                    Caption = 'Employee Bank Details';
                    Editable = EmployeeDetailsEdit;
                    field("Employee Mobile No"; Rec."Employee Mobile No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee Mobile No field.';
                    }
                    field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee Bank Account Code field.';
                    }
                    field("Employee Ban Account Name"; Rec."Employee Ban Account Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Employee Ban Account Name field.';
                    }
                    field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee Bank Brach Code field.';
                    }
                    field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Employee Bank Branch Name field.';
                    }
                    field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee Bank Account Number field.';
                    }

                    part("Attached Documents1"; "Doc. Attachment List Factbox1")
                    {
                        ApplicationArea = All;
                        Caption = 'Attachment';
                        SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                        // SystemCreatedBy = field(SystemCreatedBy);

                    }
                    field("Vendor Type"; Rec."Vendor Type")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Vendor Type field.';
                    }

                }
            }
            part(Control1000000021; "PV Lines")
            {
                Editable = TRUE;//not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
            }
            part(Control12; "Approval Entry")
            {
                Caption = 'Tracking';
                Editable = false;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = Basic;
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
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
                    Promoted = true;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }

            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
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
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Message(Rec."Shortcut Dimension 1 Code");
                        DMSManagement.UploadPaymentsDocuments(Rec."No.", 'Payment Vouchers', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = true;//not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        //TESTFIELD("Funding Source");
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        Rec.TestField("Shortcut Dimension 1 Code");
                        if Rec.Job = '' then
                            error('Job should have a value');
                        If Rec."Job Task No" = '' then
                            error('Budget line should not be balnk');
                        If Rec.JobNo = '' then
                            error('Budget/Exchequer should not be Blank');


                        /*IF ("Advance Recovery"<>0) AND ("Account No."='')THEN
                        BEGIN
                          ERROR(text0001);
                        END;*/
                        /*IF "Advance Recovery"<>0 THEN
                          "Account Type":="Account Type"::"G/L Account";
                          "Account No."=1250020;*/
                        Rec.TestField("Payment Narration");
                        Rec.TestField(Payee);
                        // rec.TestField(rec.Job);
                        Rec.TestField(Date);
                        pvheader.Reset;
                        pvheader.SetRange(pvheader."No.", Rec."No.");
                        if pvheader.FindFirst() then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, pvheader."No.");
                            pvLines.SetFilter(pvLines."Account Type", '<>%1', pvLines."account type"::"G/L Account");
                            if pvLines.FindSet() then begin
                                repeat
                                    pvLines.TestField(pvLines."Applies to Doc. No");
                                    pvLines.testfield(pvLines.Description);
                                    pvLines.TestField("Project No");
                                    pvLines.TestField("Contractor No");
                                until pvLines.Next = 0;
                            end;
                        end;

                        if Rec."Staff Claim" = false then begin
                            pvheader.Reset;
                            pvheader.SetRange(pvheader."No.", Rec."No.");
                            pvheader.SetFilter(pvheader."Pay Mode", '<>%1', 'CHEQUE');
                            if pvheader.FindSet then begin
                                if pvheader."Pay Mode" <> 'CHEQUE' then begin
                                    pvLines.Reset;
                                    pvLines.SetRange(pvLines.No, pvheader."No.");
                                    pvLines.SetRange(pvLines."Account Type", pvLines."account type"::Vendor);
                                    if pvLines.FindSet then begin

                                        repeat
                                        // pvLines.TestField(pvLines."Payee Account Name");
                                        // pvLines.TestField(pvLines."Payee Bank Account Number");
                                        // pvLines.TestField(pvLines."Payee Bank Branch Code");
                                        //pvLines.TESTFIELD(pvLines."Vendor Bank Name");
                                        until pvLines.Next = 0;
                                    end;
                                end;
                            end;
                        end;

                        if Rec."Advance Payment" = true then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, Rec."No.");
                            pvLines.SetRange(pvLines."Account Type", pvLines."account type"::Vendor);
                            if pvLines.FindSet then
                                repeat
                                // pvLines.TestField("Obligation Total Amount");
                                // pvLines.TestField("Contractor No");
                                until pvLines.Next = 0;
                        end;

                        if Rec."Staff Claim" = true then begin
                            Rec.TestField("Employee Ban Account Name");
                            Rec.TestField("Employee Bank Account Code");
                            Rec.TestField("Employee Bank Account Number");
                            Rec.TestField("Employee Bank Brach Code");
                            Rec.TestField("Employee Bank Branch Name");
                        end;
                        //Check if the account will be overdrawn
                        Rec.Validate("Paying Bank Account");

                        /*    if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                              ApprovalsMgmt.OnSendPaymentsForApproval(Rec);*/
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);


                        CurrPage.Close();

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                                                                              //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                              //IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                                                                              //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                    var
                        UserSetup: Record "User Setup";
                        ResponsibilityCenter: Record "Responsibility Center";
                        PV: Record payments;
                    begin
                        PV.Reset();
                        PV.SetRange("No.", Rec."No.");
                        Report.Run(Report::"Payment Voucher", true, true, PV)
                        // if UserSetup.Get(UserId) then begin
                        //     if ResponsibilityCenter.Get(UserSetup."Responsibility Center") then begin
                        //         if ResponsibilityCenter.HQ then begin
                        //             PV.Reset();
                        //             PV.SetRange("No.", Rec."No.");
                        //             Report.Run(Report::"Payment Voucher", true, true, PV)
                        //         end else begin
                        //             PV.Reset();
                        //             PV.SetRange("No.", Rec."No.");
                        //             Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                        //         end;
                        //     end;
                        // end else begin
                        //     if ResponsibilityCenter.Get(Rec."Responsibility Center") then begin
                        //         if ResponsibilityCenter.HQ then begin
                        //             PV.Reset();
                        //             PV.SetRange("No.", Rec."No.");
                        //             Report.Run(Report::"Payment Voucher", true, true, PV)
                        //         end else begin
                        //             PV.Reset();
                        //             PV.SetRange("No.", Rec."No.");
                        //             Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                        //         end;
                        //     end;
                        // end;
                    end;
                }
                action("Regional PV Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Regional PV Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Regional Payment Voucher";
                    Visible = false;
                    ToolTip = 'Executes the Regional PV Print action.';

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        // IF "Responsibility Center"='R48' THEN BEGIN
                        // RESET;
                        // SETRANGE("No.","No.");
                        // IF FINDSET THEN
                        // REPORT.RUN(57000,TRUE,TRUE,Rec)
                        // END ELSE IF "Responsibility Center"<>'R48' THEN BEGIN
                        // RESET;
                        // SETRANGE("No.","No.");
                        // IF FINDSET THEN
                        // REPORT.RUN(57021,TRUE,TRUE,Rec);
                        // END;
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';

                    trigger OnAction()
                    var
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group("P&osting")
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
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost."Post Payment Voucher"(Rec);
                    end;
                }
                action("Test Azure Tenant ID")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Test Azure Tenant ID action.';

                    trigger OnAction()
                    var
                        SharePointIntegration: Codeunit "Sharepoint Integration";
                    begin
                        SharePointIntegration.Run();
                    end;
                }
                action("Suggest KRA Entries")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Suggests KRA Vendor Entries.';

                    trigger OnAction()
                    var
                        PVline: Record "PV Lines";
                        VendorLedgerEntry: Record "Vendor Ledger Entry";
                        lineNo: Integer;
                    begin
                        //Rec.TestField("Paying Bank Account");
                        Rec.TestField("Vendor Type");
                        VendorLedgerEntry.Reset;
                        VendorLedgerEntry.SetRange("Vendor No.", Rec."Vendor Type");
                        VendorLedgerEntry.SetRange(Open, true);
                        if VendorLedgerEntry.FindSet() then begin
                            PVline.Reset();
                            if PVline.FindLast() then
                                lineNo := PVline."Line No";
                            repeat
                                VendorLedgerEntry.CalcFields("Remaining Amount");
                                VendorLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                                PVline.Init;
                                lineNo += 1;
                                PVline.No := Rec."No.";
                                PVline."Line No" := lineNo;
                                PVline.Type := 'VENDOR N';
                                PVline.Validate(Type);
                                PVline."Account Type" := PVline."Account Type"::Vendor;
                                PVline."Account No" := VendorLedgerEntry."Vendor No.";
                                PVline.Validate("Account No");
                                PVline."Applies to Doc. No" := VendorLedgerEntry."Document No.";
                                PVline."Document Description" := VendorLedgerEntry.Description;
                                PVline.Validate("Applies to Doc. No");
                                PVline.Amount := Abs(VendorLedgerEntry."Remaining Amount");
                                PVline.Validate(Amount);
                                PVline.Description := VendorLedgerEntry.Description;
                                PVline.Insert();
                            until VendorLedgerEntry.Next() = 0;
                        end;


                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
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
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
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
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
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
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(Archive)
                {
                    ApplicationArea = Suite;
                    Caption = 'Archive';
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;
        EmployeeDetailsEdit := false;
        if Rec.Status = Rec.Status::Open then
            EmployeeDetailsEdit := true;

        // TxnReferenceVisible:=TRUE;
        // IF "Director Allowance"=TRUE THEN
        //  TxnReferenceVisible:=FALSE;
        DocType := DocType::"Payment Voucher";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        EmployeeDetailsEdit := false;
        if Rec.Status = Rec.Status::Open then
            EmployeeDetailsEdit := true;

        // TxnReferenceVisible:=TRUE;
        // IF "Director Allowance"=TRUE THEN
        //  TxnReferenceVisible:=FALSE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF USERID<>pvheader."Created By" THEN
          ERROR('%1',text0002);*///Machira

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        Rec."Account Type" := Rec."account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        EmployeeDetailsEdit := false;
        if Rec.Status = Rec.Status::Open then
            EmployeeDetailsEdit := true;

        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payment vouchers! Please contact the system administrator.');

        // TxnReferenceVisible:=TRUE;
        // IF "Director Allowance"=TRUE THEN
        //  TxnReferenceVisible:=FALSE;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record payments;
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        GLAccount: Record "G/L Account";
        cod: Integer;
        DMSManagement: Codeunit "DMS Management";
        EmployeeDetailsEdit: Boolean;
        TxnReferenceVisible: Boolean;
        VisibleOnDocApproved: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        VisibleOnDocApproved := Rec.CheckIfDocStatusApproved();
    end;


}



