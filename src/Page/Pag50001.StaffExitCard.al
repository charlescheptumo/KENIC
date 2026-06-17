/// <summary>
/// Page Staff Exit Card (ID 50001).
/// </summary>
page 50001 "Staff Exit Card"
{
    Caption = 'Staff Exit Card';
    PageType = Card;
    SourceTable = "Staff Exit";
    PopulateAllFields = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s first name.';
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s middle name.';
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s last name.';
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s job title.';
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s address.';
                    Editable = false;
                    Importance = Additional;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies additional address information.';
                    Editable = false;
                    Importance = Additional;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s telephone number.';
                    Editable = false;
                    Importance = Additional;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s private email address.';
                    Editable = false;
                    Importance = Additional;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                // field("Department Name"; CustomFunction.DimensionName(3, Rec."Shortcut Dimension 3 Code"))
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Department Name field.';
                //     Editable = false;
                // }
                // field("Region Name"; CustomFunction.DimensionName(1, rec."Global Dimension 1 Code"))
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Region Name field.';
                //     Editable = false;
                // }
                // field(Workstation; Rec.Workstation)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Workstation field.';
                //     Editable = false;
                // }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s gender.';
                    Editable = false;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Notice Period field.', Comment = '%';
                }
                field("Use Leave Days"; Rec."Use Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Use Leave Days field.', Comment = '%';
                }
                field("No of Leave Days to Use"; Rec."No of Leave Days to Use")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Leave Days to Use field.', Comment = '%';
                    Editable = LeaveDays;
                }
                field("Notice Start Date"; Rec."Notice Start Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Notice Start Date field.';
                }
                field("Exit Date"; Rec."Date Of Leaving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Staff Exit Code"; Rec."Staff Exit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Exit Code field.';
                    trigger OnValidate()
                    begin
                        EnableControls();
                    end;
                }
                field("Staff Exit Description"; Rec."Staff Exit Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Exit Description field.';
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allow Re-Employment In Future field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Last Working Date"; Rec."Last Working Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Working Date field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                // field("Last Date Modified"; Rec."Last Date Modified")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Last Date Modified field.';
                //     Importance = Additional;
                // }
            }
            group("Administration Details")
            {
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the date of birth here to calculate retirement date';
                    Editable = false;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                    Editable = false;
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                    Editable = false;
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                    Editable = false;
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Category field.';
                    Editable = false;
                }
            }
            part("Termination Grounds"; "Exit Termination Grounds CardP")
            {
                // Visible = TerminationGrounds;
                Visible = VisibleOnDocApproved AND TerminationGrounds;
                Caption = 'Termination Details';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
            // part("Staff Exit Interview Questions"; "Staff Exit Interview Questions")
            // {
            //     Caption = 'Staff Exit Interview Questions';
            //     Editable = true;
            //     ApplicationArea = All;
            //     Visible = VisibleOnDocApproved;
            //     // SubPageLink = Code = field("No."),
            //     //                 "Employee No" = field("No."),
            //     //                 "No." = field("No.");
            //     SubPageLink = "Document No." = field("No.");
            // }
            group("Exit Interview")
            {
                Visible = /*ExitInterview AND*/ VisibleOnDocApproved;
                field("Exit Question Template"; Rec."Exit Question Template")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Exit Question Template field.';
                }
                field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Conducted field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Comments"; Rec."Exit Interview Comments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Comments field.';
                }
            }
            // part("Staff Clearance"; "Staff Clearance Subform")
            // {
            //     // Visible = Clearance;
            //     Caption = 'Staff Clearance';
            //     Editable = true;
            //     Visible = VisibleOnDocApproved AND Clearance;
            //     ApplicationArea = All;
            //     // SubPageLink = "Document No." = field("No."),
            //     //                 "Employee No" = field("No."),
            //     //                 "No." = field("No.");
            //     SubPageLink = "Document No." = field("No."),
            //                     "Employee No" = field("Employee No.");
            // }
            group("Payroll Details")
            {
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID Number field.';
                    Editable = false;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                    Editable = false;
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                    Editable = false;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Social Security No. field.';
                    Editable = false;
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                    Importance = Additional;
                    Editable = false;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                    Editable = false;
                    // Importance = Additional;
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                    Editable = false;
                    Importance = Additional;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                    Editable = false;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(50073), "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(Close)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Close - Staff Exit';
                Image = CloseDocument;
                Visible = VisibleOnDocApproved;
                ToolTip = 'Executes the Close - Staff Exit action.';
                trigger OnAction()
                var
                    CloseDocument: Codeunit "HR Make Leave Ledg. Entry";
                    ExitClearanceH: Record "Staff Exit Clearance Header";
                    Err001: Label 'Clearance Document is required.';
                begin
                    Rec.Testfield("Approval Status", Rec."Approval Status"::Approved);

                    ExitClearanceH.Reset();
                    ExitClearanceH.SetRange("Document No.", Rec."No.");
                    ExitClearanceH.SetRange("Employee No.", Rec."Employee No.");
                    if ExitClearanceH.FindFirst() then begin
                        ExitClearanceH.Testfield("Approval Status", Rec."Approval Status"::Approved);
                    end else begin
                        Error(Err001);
                    end;

                    CloseDocument.CloseStaffExit(Rec);
                end;
            }
        }
        area(Processing)
        {
            action("Clearance Certificate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Clearance Certificate';
                Image = Suggest;
                ToolTip = 'Clearance Certificate';
                Visible = VisibleOnDocApproved;
                trigger OnAction()
                begin
                    StaffExit.Reset();
                    StaffExit.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Clearance Certificate", true, true, StaffExit);
                end;
            }

            action("Exit Clearance Form")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Clearance Form';
                Image = RelatedInformation;
                ToolTip = 'Clearance Form';
                Visible = VisibleOnDocApproved;
                RunObject = page "Staff Exit Clearance Header";
                RunPageLink = "Document No." = field("No.");
            }
            action("Handing Over Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Handing Over Report';
                Image = Suggest;
                ToolTip = 'Handing Over Report';
                Visible = VisibleOnDocApproved;
                trigger OnAction()
                begin
                    StaffExit.Reset();
                    StaffExit.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Handing Over Report", true, true, StaffExit);
                end;
            }
            // action("Suggest Clearance Lines")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Suggest Clearance Lines';
            //     Image = Suggest;
            //     ToolTip = 'Suggest Clearance Lines.';
            //     Visible = Clearance AND VisibleOnDocApproved;

            //     trigger OnAction()
            //     begin
            //         Rec.FnSuggestClearanceLines();
            //     end;
            // }
            group(Staff)
            {
                action("Send Exit Letter")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send Exit Letter';
                    Image = Email;
                    ToolTip = 'Send staff an exit letter.';
                    Visible = VisibleOnDocApproved;

                    trigger OnAction()
                    begin

                    end;
                }
                action("Send Certificate of Service")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send Certificate of Service';
                    Image = Email;
                    ToolTip = 'Send staff a certificate of service.';
                    Visible = VisibleOnDocApproved;

                    trigger OnAction()
                    var
                        Employee: Record Employee;
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        //Report.Run(50019, true, true, Rec);
                        Report.Run(50087, true, true, Rec);
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';

                    trigger OnAction()
                    var
                        Var_Varaint: Variant;
                        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                        DocumentCount: integer;
                        Err002: Label 'Attachment is required.';
                        DocAttach: Record "Document Attachment";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);//status must be open.

                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", Database::"Staff Exit");
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.FindSet;
                        DocumentCount := DocAttach.Count;

                        if DocumentCount = 0 then
                            Error(Err002);

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
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                        CustomApprovalEntry: record "Approval Entry";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                        // CustomApprovalEntry.Reset;
                        // CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        // CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        // CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        // if CustomApprovalEntry.FindSet then
                        //     repeat
                        //         //   OldStatus :=ApprovalEntry.Status;
                        //         CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                        //         CustomApprovalEntry.Modify(true);
                        //     until CustomApprovalEntry.Next = 0;

                        // Rec."Approval Status" := Rec."Approval Status"::Open;

                        // Rec.Modify(true);
                        // Message('An Approval Requested Has Been Cancelled.');
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
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
                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(CloseDocument_Promoted; Close)
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(ClearanceForm_Promoted; "Exit Clearance Form")
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref(ClearanceCertificate_Promoted; "Clearance Certificate")
                {
                }
                actionref(HandingOverReport_Promoted; "Handing Over Report")
                {
                }
                actionref(CertificateOfService_Promoted; "Send Certificate of Service")
                {
                }
                actionref(ExitLetter_Promoted; "Send Exit Letter")
                {
                }
            }

        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        EnableControls();
        SetControlAppearance();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Staff Exit";
        LeaveDays := false;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Use Leave Days" then
            LeaveDays := true;
    end;

    var
        CustomFunction: Codeunit "Custom Function";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

        ExitInterview: Boolean;
        Clearance: Boolean;
        Notice: Boolean;
        TerminalBenefits: Boolean;
        TerminationGrounds: Boolean;
        ModifyCard: Boolean;
        LeaveDays: Boolean;
        VisibleOnDocApproved: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        StaffExit: Record "Staff Exit";

    local procedure EnableControls()
    begin
        ExitInterview := Rec.RequiresInterview();
        Clearance := Rec.RequiresClearance();
        Notice := Rec.RequiresNotice();
        TerminalBenefits := Rec.HasTerminalBenefits();
        TerminationGrounds := Rec.HasTerminationGrounds();
        VisibleOnDocApproved := Rec.CheckIfDocStatusApproved();
    end;

    local procedure SetControlAppearance()
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}
