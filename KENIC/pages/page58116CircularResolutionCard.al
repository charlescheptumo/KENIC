page 58116 "Circular Resolution Card"
{
    PageType = Document;
    SourceTable = "Circular Resolution Header";
    Caption = 'Circular Resolution Card';
    PromotedActionCategories = 'New,Process,Navigate,Report,Approve,Approval,Approvals';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique resolution number.';
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution title.';
                    Editable = IsDocumentEditable;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies detailed description/text of the resolution.';
                    MultiLine = true;
                    Editable = IsDocumentEditable;
                }
                field("Resolution Type"; Rec."Resolution Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution category.';
                    Editable = IsDocumentEditable;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the operational status of the resolution.';
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the internal approval workflow status.';
                    Editable = false;
                }
                field("Voting Deadline"; Rec."Voting Deadline")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the final deadline for accepting votes.';
                    Editable = IsDocumentEditable;
                }
            }

            part(OptionsSubform; "Resolution Options Subform")
            {
                Caption = 'Voting Options';
                ApplicationArea = All;
                SubPageLink = "Resolution No." = field("No.");
                Editable = IsDocumentEditable;
            }

            part(VotesSubform; "Resolution Votes Subform")
            {
                Caption = 'Voters & Status';
                ApplicationArea = All;
                SubPageLink = "Resolution No." = field("No.");
                Editable = IsDocumentEditable;
            }

            group(SystemAudit)
            {
                Caption = 'System Audit';
                Editable = false;

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                }
                field("Last Modified By"; Rec."Last Modified By")
                {
                    ApplicationArea = All;
                }
                field("Last Modified DateTime"; Rec."Last Modified DateTime")
                {
                    ApplicationArea = All;
                }
                field("Total Members"; Rec."Total Members")
                {
                    ApplicationArea = All;
                }
                field("Total Votes Cast"; Rec."Total Votes Cast")
                {
                    ApplicationArea = All;
                }
                field("Winning Option"; Rec."Winning Option")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = All;
                Visible = false;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Member Generation")
            {
                Caption = 'Member Generation';
                Image = Employee;
                Visible = IsDocumentEditable;

                action(GenerateMembers)
                {
                    ApplicationArea = All;
                    Caption = 'Generate Members';
                    ToolTip = 'Add voters to this resolution using various criteria.';
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Selection: Integer;
                    begin
                        Rec.TestField("No.");
                        if not IsDocumentEditable then
                            exit;

                        Selection := StrMenu(
                            'Employee,Responsibility Center,Operating Unit Type,Branch',
                            1);

                        case Selection of
                            1:
                                AddEmployee();
                            2:
                                AddByResponsibilityCenter();
                            3:
                                AddByOperatingUnitType();
                            4:
                                AddByBranch();
                        end;
                        CurrPage.Update(false);
                    end;
                }

                action(RemoveAllVoters)
                {
                    ApplicationArea = All;
                    Caption = 'Remove All Voters';
                    ToolTip = 'Remove all voters currently listed under this circular resolution.';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ResVote: Record "Circular Resolution Vote";
                    begin
                        Rec.TestField("No.");
                        if not IsDocumentEditable then
                            exit;
                        if Confirm('Are you sure you want to delete all voter lines from this resolution?', false) then begin
                            ResVote.Reset();
                            ResVote.SetRange("Resolution No.", Rec."No.");
                            if not ResVote.IsEmpty() then begin
                                ResVote.DeleteAll(true);
                                Message('All voter lines have been cleared.');
                            end;
                            CurrPage.Update(false);
                        end;
                    end;
                }
            }

            group("Functions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist and IsDocumentEditable;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        ResOption: Record "Circular Resolution Option";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                        
                        ResOption.Reset();
                        ResOption.SetRange("Resolution No.", Rec."No.");
                        if ResOption.IsEmpty() then begin
                            Error('You must add at least one voting option before sending for approval.');
                            exit;
                        end;
                        
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
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

    trigger OnOpenPage()
    begin
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        IsDocumentEditable := Rec."Approval Status" = Rec."Approval Status"::Open;
    end;

    local procedure InsertVoter(EmployeeNo: Code[20]): Boolean
    var
        ResVote: Record "Circular Resolution Vote";
        NextLineNo: Integer;
    begin
        if EmployeeNo = '' then
            exit(false);
        ResVote.Reset();
        ResVote.SetRange("Resolution No.", Rec."No.");
        ResVote.SetRange("Employee No.", EmployeeNo);
        if not ResVote.IsEmpty() then
            exit(false);
        ResVote.Reset();
        ResVote.SetRange("Resolution No.", Rec."No.");
        if ResVote.FindLast() then
            NextLineNo := ResVote."Line No." + 1
        else
            NextLineNo := 10000;
        ResVote.Init();
        ResVote."Resolution No." := Rec."No.";
        ResVote."Line No." := NextLineNo;
        ResVote.Validate("Employee No.", EmployeeNo);
        ResVote."Vote Status" := ResVote."Vote Status"::Pending;
        ResVote."Notification Sent" := false;
        ResVote.Insert(true);
        exit(true);
    end;

    local procedure AddEmployee()
    var
        Employee: Record Employee;
    begin
        Employee.Reset();
        Employee.SetRange(Status, Employee.Status::Active);
        if Page.RunModal(Page::"Employee List", Employee) = Action::LookupOK then begin
            if InsertVoter(Employee."No.") then
                Message('Employee %1 has been added as a voter.', Employee."No.")
            else
                Message('Employee %1 is already a voter for this resolution.', Employee."No.");
        end;
    end;

    local procedure AddByResponsibilityCenter()
    var
        RespCenter: Record "Responsibility Center";
        Employee: Record Employee;
        AddedCount: Integer;
        SkippedCount: Integer;
    begin
        RespCenter.Reset();
        if Page.RunModal(Page::"Responsibility Center List", RespCenter) = Action::LookupOK then begin
            Employee.Reset();
            Employee.SetRange(Status, Employee.Status::Active);
            Employee.SetRange("Responsibility Center", RespCenter.Code);
            if Employee.FindSet() then begin
                repeat
                    if InsertVoter(Employee."No.") then
                        AddedCount += 1
                    else
                        SkippedCount += 1;
                until Employee.Next() = 0;
                Message('%1 eligible employees added from Responsibility Center %2. %3 were already voters.', 
                    AddedCount, RespCenter.Code, SkippedCount);
            end else
                Message('No active employees found under Responsibility Center %1.', RespCenter.Code);
        end;
    end;

    local procedure AddByOperatingUnitType()
    var
        RespCenterSelect: Record "Responsibility Center";
        RespCenterFilter: Record "Responsibility Center";
        Employee: Record Employee;
        AddedCount: Integer;
        SkippedCount: Integer;
        FilterText: Text;
    begin
        RespCenterSelect.Reset();
        if Page.RunModal(Page::"Responsibility Center List", RespCenterSelect) = Action::LookupOK then begin
            RespCenterFilter.Reset();
            RespCenterFilter.SetRange("Operating Unit Type", RespCenterSelect."Operating Unit Type");
            if RespCenterFilter.FindSet() then begin
                FilterText := '';
                repeat
                    if FilterText <> '' then
                        FilterText += '|' + RespCenterFilter.Code
                    else
                        FilterText := RespCenterFilter.Code;
                until RespCenterFilter.Next() = 0;

                Employee.Reset();
                Employee.SetRange(Status, Employee.Status::Active);
                Employee.SetFilter("Responsibility Center", FilterText);
                if Employee.FindSet() then begin
                    repeat
                        if InsertVoter(Employee."No.") then
                            AddedCount += 1
                        else
                            SkippedCount += 1;
                    until Employee.Next() = 0;
                    
                    Message('%1 active employees added from all %2 structures (%3 total departments/units). %4 were already voters.', 
                        AddedCount, 
                        Format(RespCenterSelect."Operating Unit Type"), 
                        RespCenterFilter.Count(), 
                        SkippedCount);
                end else
                    Message('No active employees found belonging to any %1 structures.', Format(RespCenterSelect."Operating Unit Type"));
            end;
        end;
    end;

    local procedure AddByBranch()
    var
        DimVal: Record "Dimension Value";
        Employee: Record Employee;
        AddedCount: Integer;
        SkippedCount: Integer;
    begin
        DimVal.Reset();
        DimVal.SetRange("Dimension Code", 'BRANCH');
        if Page.RunModal(Page::"Dimension Values", DimVal) = Action::LookupOK then begin
            Employee.Reset();
            Employee.SetRange(Status, Employee.Status::Active);
            Employee.SetRange("Branch", DimVal.Code);
            if Employee.FindSet() then begin
                repeat
                    if InsertVoter(Employee."No.") then
                        AddedCount += 1
                    else
                        SkippedCount += 1;
                until Employee.Next() = 0;
                Message('%1 active employees added from Branch %2. %3 were already voters.', 
                    AddedCount, DimVal.Name, SkippedCount);
            end else
                Message('No active employees found belonging to Branch %1.', DimVal.Name);
        end;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        IsDocumentEditable: Boolean;
}