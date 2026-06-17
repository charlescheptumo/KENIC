namespace KICD.KICD;
using Microsoft.HumanResources.Employee;
using System.Automation;
using System.Security.User;
using Microsoft.Foundation.Comment;

page 50322 "Imprest Requisition Card"
{
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            "Archive Document" = filter(false));
    ApplicationArea = All;
    caption = 'Imprest Requisition';
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
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
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the cheque No./ EFT No. field.';
                }
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
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the JobNo field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                    // DrillDownPageID = "Posted Imprest Memos";
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Imprest Memo No field.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ImpMemo: Record "Imprest Memo";
                    begin
                        ImpMemo.Reset;
                        if Page.RunModal(Page::"Posted Imprest Memos", ImpMemo) = Action::LookupOK then
                            Rec."Imprest Memo No" := ImpMemo."No.";
                    end;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Description';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Program Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Program Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
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
                    ToolTip = 'Specifies the value of the Employee Bank Branch Name field.';
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Bank Account Number field.';
                }
            }
            part(Control1000000017; "Imprest Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
            }
            part(Control19; "Approval Entry")
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
                ApplicationArea = ALL;
                Visible = false;
                SubPageLink = "No." = FIELD("No.");
            }
            part("Previous Attachments"; "Sharepoint File List")
            {
                ApplicationArea = Basic;
                Caption = 'Previous Attachments';
                Visible = true;
                SubPageLink = "No." = FIELD("Imprest Memo No");
            }
            part("Previous Portal Attachments"; "Portal Documents")
            {
                ApplicationArea = ALL;
                Caption = 'Portal Attachments';
                SubPageLink = ApplicationNo = FIELD("Imprest Memo No");
            }
            // part("Attached Documents"; "Doc. Attachment List Factbox")
            // {
            //     ApplicationArea = ALL;
            //     Visible = true;
            //     Caption = 'Attachment';
            //     SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");

            // }
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
            // part("Attached Documents1"; "Doc. Attachment List Factbox")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachment';
            //     SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");//, "Document Type" = filter();
            //                                                                   // SystemCreatedBy = field(SystemCreatedBy);

            // }
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
                    RunPageLink = "No." = field("No.");
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            action("Attach from Imprest Memo")
            {
                ApplicationArea = Basic;
                Enabled = ShowAttach;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Attach from Imprest Memo action.';

                trigger OnAction()
                begin
                    Rec.AttachLines(Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send Approval Request action.';

                    trigger OnAction()
                    var
                        Var_Varaint: Variant;
                        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                                                                //TESTFIELD("Created By",USERID);
                                                                //Rec.TestField(JobNo);
                                                                // Rec.TestField("Job Task No");//control so that only the initiator of the document can send for approval
                                                                //TESTFIELD("Imprest Memo No");
                                                                //Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Payment Narration");
                        if Rec."Imprest Amount" = 0 then
                            Error(Text001, Rec."No.");
                        //if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        // ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                        //Rec.Status := Rec.Status::Released;
                        //Rec.Modify(TRUE);
                        Var_Varaint := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Varaint) then
                            CustomApprovalMgt.OnSendDocForApproval(Var_Varaint);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                        CustomApprovalEntry: record "Approval Entry";
                    begin
                        // Rec.TestField(Status, Rec.Status::"Pending Approval");
                        // VarVariant := Rec;
                        // CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);



                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                //   OldStatus :=ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec.Status := Rec.Status::Open;

                        Rec.Modify(true);
                        Message('An Approval Requested Has Been Cancelled.');
                    end;
                }
                separator(Action1000000037)
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
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        // Rec.Reset;
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57004, true, true, Rec);
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
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
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
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000031)
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
                    ToolTip = 'Executes the P&ost action.';

                    trigger OnAction()
                    begin
                        //Control the posting of the imprest requisitions David
                        UserSetup.Get(UserId);
                        if UserSetup."Post Requisition" = false then
                            Error(Text001);
                        PaymentPost."Post Imprest"(Rec);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.GetApprovalComment(Rec);
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
                    Visible = FALSE;
                    ToolTip = 'Executes the Attach Document action.';

                    trigger OnAction()
                    begin
                        //  DMSManagement.UploadImprestrequisitionsDocuments(REC."No.", 'Imprest /Requisition', RECORDID , REC."Shortcut Dimension 1 Code");
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
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec."Archive Document" := true;
                        Rec.Modify;
                        CurrPage.Close;
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
        Doctype := Doctype::"Imprest Requisition";
        CurrPage.Attachments.Page.Documenttype(Doctype, Rec."No.");
    end;

    trigger OnAfterGetRecord()
    var
        Emp: Record Employee;
        EmployeePaymentInformation: Record "Employee Payment Information";
        Employee: Record Employee;
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;

        // case Rec."Account Type" of
        //     Rec."account type"::Employee:
        //         begin
        //             Emp.Reset;
        //             Emp.SetRange("No.", Rec."Account No.");
        //             if Emp.FindSet then begin
        //                 Rec."Account Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        //                 Rec.Payee := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        //                 Rec."Directorate Code" := Emp."Directorate Code";
        //                 Rec."Department Code" := Emp."Department Code";
        //                 Rec.Division := Emp.Division;
        //                 Rec.HOD := Emp.HOD;
        //                 // "Regional Manager":=Emp."Regional Manager";
        //                 Rec."Directorate Head" := Emp."Directorate Head";
        //                 Rec."Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
        //                 Rec."Shortcut Dimension 2 Code" := Emp."Global Dimension 2 Code";
        //                 Rec."Employee Ban Account Name" := emp."Bank Name";
        //                 Rec."Employee Bank Account Code" := Emp."Employee's Bank";
        //                 Rec."Employee Bank Branch Name" := Emp."Bank Branch Name";
        //                 Rec."Employee Bank Account Number" := Emp."Bank Account Number";
        //                 Rec."Employee Mobile No" := Emp."Mobile Phone No.";
        //                 Rec.Modify(true);
        //             end;
        //         end;
        // end;
        // if xRec."Account No." <> Rec."Account No." then begin
        //     Rec."Employee Bank Account Code" := '';
        //     Rec."Employee Ban Account Name" := '';
        //     Rec."Employee Bank Brach Code" := '';
        //     Rec."Employee Bank Branch Name" := '';
        //     Rec."Employee Bank Account Number" := '';
        //     Rec."Employee Mobile No" := '';
        // end;


        // EmployeePaymentInformation.Reset;
        // EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee No", Rec."Account No.");
        // //EmployeePaymentInformation.SETRANGE(EmployeePaymentInformation."Employee Bank Code",'<>%1','');
        // if EmployeePaymentInformation.FindLast then begin
        //     Rec."Employee Bank Account Code" := EmployeePaymentInformation."Employee Bank Code";
        //     Rec."Employee Ban Account Name" := EmployeePaymentInformation."Employee Bank Name";
        //     Rec."Employee Bank Brach Code" := EmployeePaymentInformation."Employee Bank Branch Code";
        //     Rec."Employee Bank Branch Name" := EmployeePaymentInformation."Employee Bank Branch Name";
        //     Rec."Employee Bank Account Number" := EmployeePaymentInformation."Employee Bank Account Number";
        //     Rec."Employee Mobile No" := EmployeePaymentInformation."Employee Mobile No";
        // end;
        Employee.Reset;
        Employee.SetRange("No.", Rec."Account No.");
        if Employee.FindSet then begin
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            //"Shortcut Dimension 2 Code":=Employee."Global Dimension 2 Code";
            //MODIFY(TRUE);
        end;

        Employee.Reset;
        Employee.SetRange("No.", Rec."Account No.");
        if Employee.FindSet then begin
            //"Responsibility Center":=Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            // Validate(Rec."Shortcut Dimension 1 Code");
        end;
    end;
    // end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ERROR('You are not Allowed to Create a New Requisition!');
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Document Type" := Rec."document type"::Imprest;
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    var
        Emp: Record Employee;
        EmployeePaymentInformation: Record "Employee Payment Information";
        Employee: Record Employee;
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;


        // case Rec."Account Type" of
        //     Rec."account type"::Employee:
        //         begin
        //             Emp.Reset;
        //             Emp.SetRange("No.", Rec."Account No.");
        //             if Emp.FindSet then begin
        //                 Rec."Account Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        //                 Rec.Payee := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        //                 Rec."Directorate Code" := Emp."Directorate Code";
        //                 Rec."Department Code" := Emp."Department Code";
        //                 Rec.Division := Emp.Division;
        //                 Rec.HOD := Emp.HOD;
        //                 // "Regional Manager":=Emp."Regional Manager";
        //                 Rec."Directorate Head" := Emp."Directorate Head";
        //                 Rec."Shortcut Dimension 1 Code" := Emp."Global Dimension 1 Code";
        //                 Rec."Shortcut Dimension 2 Code" := Emp."Shortcut Dimension 3";
        //                 Rec."Employee Ban Account Name" := emp."Bank Name";
        //                 Rec."Employee Bank Account Code" := Emp."Employee's Bank";
        //                 Rec."Employee Bank Branch Name" := Emp."Bank Branch";
        //                 Rec."Employee Bank Account Number" := Emp."Bank Account Number";
        //                 Rec."Employee Mobile No" := Emp."Mobile Phone No.";
        //                 Rec.Modify(true);
        //             end;
        //         end;
        // end;
        // if xRec."Account No." <> Rec."Account No." then begin
        //     Rec."Employee Bank Account Code" := '';
        //     Rec."Employee Ban Account Name" := '';
        //     Rec."Employee Bank Brach Code" := '';
        //     Rec."Employee Bank Branch Name" := '';
        //     Rec."Employee Bank Account Number" := '';
        //     Rec."Employee Mobile No" := '';
        // end;


        // EmployeePaymentInformation.Reset;
        // EmployeePaymentInformation.SetRange(EmployeePaymentInformation."Employee No", Rec."Account No.");
        // //EmployeePaymentInformation.SETRANGE(EmployeePaymentInformation."Employee Bank Code",'<>%1','');
        // if EmployeePaymentInformation.FindLast then begin
        //     Rec."Employee Bank Account Code" := EmployeePaymentInformation."Employee Bank Code";
        //     Rec."Employee Ban Account Name" := EmployeePaymentInformation."Employee Bank Name";
        //     Rec."Employee Bank Brach Code" := EmployeePaymentInformation."Employee Bank Branch Code";
        //     Rec."Employee Bank Branch Name" := EmployeePaymentInformation."Employee Bank Branch Name";
        //     Rec."Employee Bank Account Number" := EmployeePaymentInformation."Employee Bank Account Number";
        //     Rec."Employee Mobile No" := EmployeePaymentInformation."Employee Mobile No";
        // end;
        // Employee.Reset;
        // Employee.SetRange("No.", Rec."Account No.");
        // if Employee.FindSet then begin
        //     Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
        //"Shortcut Dimension 2 Code":=Employee."Global Dimension 2 Code";
        //MODIFY(TRUE);
        // end;

        // Employee.Reset;
        // Employee.SetRange("No.", Rec."Account No.");
        // if Employee.FindSet then begin
        //     //"Responsibility Center":=Employee."Global Dimension 1 Code";
        //     Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
        //     // Validate(Rec."Shortcut Dimension 1 Code");
        // end;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        //[InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Txt0001: label 'You Can only Print Fully Approved Imprest Requisition';
        users: Record "User Setup";
        Text001: label 'Imprest Amount for document number %1 cannot be 0. Kindly check the lines. Attach memo.';
        UserSetup: Record "User Setup";
        Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}
