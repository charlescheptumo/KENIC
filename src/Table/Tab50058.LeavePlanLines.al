table 50058 "Leave Plan Lines"
{
    Caption = 'Leave Plan Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Leave Plan No."; Code[20])
        {
            Caption = 'Leave Plan No.';
            TableRelation = "Leave Plan Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Leave Plan Starting Date"; Date)
        {
            Caption = 'Leave Plan Starting Date';
            Editable = false;
        }
        field(5; "Leave Type"; Code[100])
        {
            Caption = 'Leave Type';
            TableRelation = "HR Leave Types".Code;

            trigger OnValidate()
            var
                CountLeaves: Integer;
                YearofApplication: Integer;
            begin
                HRLeaveTypes.Reset;
                HRLeaveTypes.SetRange(HRLeaveTypes.Code, "Leave Type");
                if HRLeaveTypes.Find('-') then begin
                    HREmp.Reset;
                    HREmp.SetRange(HREmp."No.", LeavePlanHeader."Employee No.");
                    HREmp.SetRange(HREmp.Gender, HRLeaveTypes.Gender);
                    if HREmp.Find('-') then
                        exit
                    else
                        if HRLeaveTypes.Gender <> HRLeaveTypes.Gender::Both then
                            Error('This leave type is restricted to the ' + Format(HRLeaveTypes.Gender) + ' gender');
                end;


                //Allow maximum of two Maternity Leaves
                YearofApplication := Date2dmy(Today, 3);
                CountLeaves := 0;
                if "Leave Type" = 'MATERNITY' then begin
                    objLeaveApps.Reset;
                    // objLeaveApps.SetRange(objLeaveApps.Status,objLeaveApps.Status::"10");
                    objLeaveApps.SetRange(objLeaveApps."Employee No", LeavePlanHeader."Employee No.");
                    objLeaveApps.SetRange(objLeaveApps."Leave Type", "Leave Type");
                    if objLeaveApps.FindSet then
                        repeat
                            Message(Format(objLeaveApps."Application Code"));
                            if Date2dmy(objLeaveApps."Application Date", 3) = YearofApplication then
                                CountLeaves := CountLeaves + 1;
                            Message(Format(CountLeaves));
                        until objLeaveApps.Next = 0;
                    if CountLeaves > 1 then Error(TEXT003);
                end;

                YearofApplication := Date2dmy(Today, 3);
                CountLeaves := 0;
                if "Leave Type" = 'TERMINAL' then begin
                    objLeaveApps.Reset;
                    objLeaveApps.SetRange(objLeaveApps."Employee No", LeavePlanHeader."Employee No.");
                    objLeaveApps.SetRange(objLeaveApps."Leave Type", "Leave Type");
                    if objLeaveApps.FindSet then
                        repeat
                            Message(Format(objLeaveApps."Application Code"));
                            if Date2dmy(objLeaveApps."Application Date", 3) = YearofApplication then
                                CountLeaves := CountLeaves + 1;
                            Message(Format(CountLeaves));
                        until objLeaveApps.Next = 0;
                    if CountLeaves > 1 then Error(TEXT003);
                end;


                //block multiple leave applications
                HRLeaveApp.Reset;
                HRLeaveApp.SetRange(HRLeaveApp."Leave Type", "Leave Type");
                HRLeaveApp.SetRange(HRLeaveApp."Employee No", LeavePlanHeader."Employee No.");
                HRLeaveApp.SetFilter(HRLeaveApp.Status, '%1|%2', HRLeaveApp.Status::Open, HRLeaveApp.Status::"Pending Approval");
                if HRLeaveApp.FindFirst then begin
                    //ERROR('Hi %1 Please not that you have an unused leave application %2, reuse this application',"Employee Name",HRLeaveApp."Application Code");
                end;
            end;
        }
        // field(6; "Job No."; Code[20])
        // {
        //     Caption = 'Job No.';
        //     TableRelation = Job;

        //     trigger OnValidate()
        //     begin
        //         if "Job No." <> '' then begin
        //             TestField(Type, Type::Job);
        //             Job.Get("Job No.");
        //             if Job.Blocked = Job.Blocked::All then
        //                 Job.TestBlocked();
        //             if Job.Status = Job.Status::Completed then
        //                 Job.TestStatusCompleted();
        //         end;
        //         Validate("Job Task No.", '');
        //         UpdateApproverID();
        //         UpdateJobId();
        //     end;
        // }
        // field(7; "Job Task No."; Code[20])
        // {
        //     Caption = 'Job Task No.';
        //     TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

        //     trigger OnValidate()
        //     begin
        //         if "Job Task No." <> '' then begin
        //             TestField(Type, Type::Job);
        //             JobTask.Get("Job No.", "Job Task No.");
        //             JobTask.TestField("Job Task Type", JobTask."Job Task Type"::Posting);
        //             Description := JobTask.Description;
        //         end;
        //     end;
        // }
        field(9; "Cause of Absence Code"; Code[10])
        {
            Caption = 'Cause of Absence Code';
            TableRelation = "Cause of Absence";

            trigger OnValidate()
            var
                Employee: Record Employee;
                CauseOfAbsence: Record "Cause of Absence";
            begin
                if "Cause of Absence Code" <> '' then begin
                    // TestField(Type, Type::Absence);
                    CauseOfAbsence.Get("Cause of Absence Code");
                    Description := CauseOfAbsence.Description;
                    LeavePlanHeader.Get("Leave Plan No.");
                    Employee.Get(LeavePlanHeader."Employee No.");
                    // Employee.TestField("Base Unit of Measure");
                    // Employee.TestField(Type, Employee.Type::Person);
                    Employee.Reset();
                    Employee.SetRange("No.", LeavePlanHeader."Employee No.");
                    if Employee.IsEmpty() then
                        Error(Text001, LeavePlanHeader."Employee No.");
                end;
            end;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                TestStatus();
            end;
        }
        // field(11; "Work Type Code"; Code[10])
        // {
        //     Caption = 'Work Type Code';
        //     TableRelation = "Work Type";

        //     trigger OnValidate()
        //     begin
        //         if ("Work Type Code" <> xRec."Work Type Code") and ("Work Type Code" <> '') then
        //             CheckWorkType();
        //     end;
        // }
        field(12; "Approver ID"; Code[50])
        {
            Caption = 'Approver ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = "User Setup"."Approver ID";
        }
        // field(13; "Service Order No."; Code[20])
        // {
        //     Caption = 'Service Order No.';
        //     TableRelation = if (Posted = const(false)) "Service Header"."No." where("Document Type" = const(Order));

        //     trigger OnValidate()
        //     var
        //         ServiceHeader: Record "Service Header";
        //     begin
        //         if "Service Order No." <> '' then begin
        //             TestField(Type, Type::Service);
        //             ServiceHeader.Get(ServiceHeader."Document Type"::Order, "Service Order No.");
        //             Description := CopyStr(
        //                 StrSubstNo(Text003, "Service Order No.", ServiceHeader."Customer No."),
        //                 1,
        //                 MaxStrLen(Description));
        //         end else
        //             Description := '';
        //     end;
        // }
        // field(14; "Service Order Line No."; Integer)
        // {
        //     Caption = 'Service Order Line No.';
        // }
        // field(15; "Total Quantity"; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail".Quantity where("Leave Plan No." = field("Leave Plan No."),
        //                                                           "Leave Plan Lines No." = field("Line No.")));
        //     Caption = 'Total Quantity';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(17; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
            InitValue = true;
        }
        // field(18; "Assembly Order No."; Code[20])
        // {
        //     Caption = 'Assembly Order No.';
        //     Editable = false;
        //     TableRelation = if (Posted = const(false)) "Assembly Header"."No." where("Document Type" = const(Order));
        // }
        // field(19; "Assembly Order Line No."; Integer)
        // {
        //     Caption = 'Assembly Order Line No.';
        //     Editable = false;
        // }
        field(20; Status; Enum "Leave Plan Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(21; "Approved By"; Code[50])
        {
            Caption = 'Approved By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = "User Setup";
        }
        field(22; "Approval Date"; Date)
        {
            Caption = 'Approval Date';
            Editable = false;
        }
        field(23; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }
        // field(26; Comment; Boolean)
        // {
        //     CalcFormula = exist("Leave Plan Comment Line" where("No." = field("Leave Plan No."),
        //                                                          "Leave Plan Lines No." = field("Line No.")));
        //     Caption = 'Comment';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        // field(8002; "Job Id"; Guid)
        // {
        //     Caption = 'Job Id';
        //     DataClassification = SystemMetadata;
        //     TableRelation = Job.SystemId;
        // }
    }

    keys
    {
        key(Key1; "Leave Plan No.", "Line No.")
        {
            Clustered = true;
        }
        // key(Key2; Type)
        // {
        // }
        key(Key3; "Leave Plan No.", Status, Posted)
        {
        }
        // key(Key4; Type, "Job No.")
        // {
        // }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Description, Status)
        {
        }
        fieldgroup(Brick; Description, Status)
        {
        }
    }

    // trigger OnDelete()
    // var
    //     TimeSheetCommentLine: Record "Leave Plan Comment Line";
    //     Employee: Record Employee;
    // begin
    //     TestStatus();

    //     GetLeavePlanEmployee(Employee);
    //     CheckEmployeePrivacyBlocked(Employee);
    //     Employee.TestField(Disabled, false);

    //     LeavePlanDetail.SetRange("Leave Plan No.", "Leave Plan No.");
    //     LeavePlanDetail.SetRange("Leave Plan Lines No.", "Line No.");
    //     LeavePlanDetail.DeleteAll();

    //     TimeSheetCommentLine.SetRange("No.", "Leave Plan No.");
    //     TimeSheetCommentLine.SetRange("Leave Plan Lines No.", "Line No.");
    //     TimeSheetCommentLine.DeleteAll();
    // end;

    trigger OnInsert()
    var
        Employee: Record Employee;
    begin
        GetLeavePlanEmployee(Employee);
        CheckEmployeePrivacyBlocked(Employee);
        Employee.TestField(Disabled, false);

        UpdateApproverID();
        "Leave Plan Starting Date" := LeavePlanHeader."Starting Date";
    end;

    trigger OnModify()
    var
        Employee: Record Employee;
    begin
        GetLeavePlanEmployee(Employee);
        CheckEmployeePrivacyBlocked(Employee);
        Employee.TestField(Disabled, false);

        UpdateDetails();
    end;

    var
        HRSetup: Record "Human Resources Setup";
        Job: Record Job;
        JobTask: Record "Job Task";
        LeavePlanHeader: Record "Leave Plan Header";
        LeavePlanDetail: Record "Leave Plan Detail";
        Text001: Label 'There is no employee linked with Employee %1.';
        Text002: Label 'Status must be Open or Rejected in line with Leave Plan No.=''%1'', Line No.=''%2''.';
        Text003: Label 'Service order %1 for customer %2';
        Text005: Label 'Select a type before you enter an activity.';
        PrivacyBlockedErr: Label 'You cannot use Employee %1 because they are marked as blocked due to privacy.', Comment = '%1=Employee no.';
        HREmp: Record Employee;
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        objLeaveApps: Record "HR Leave Applications";
        HRLeaveApp: Record "HR Leave Applications";
        UserSetup: Record "User Setup";

    procedure TestStatus()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeTestStatus(IsHandled, Rec);
        if IsHandled then
            exit;

        if not (Status in [Status::Open, Status::Rejected]) then
            Error(
              Text002,
              "Leave Plan No.",
              "Line No.");
    end;

    local procedure UpdateDetails()
    var
        LeavePlanDetail: Record "Leave Plan Detail";
    begin
        LeavePlanDetail.SetRange("Leave Plan No.", "Leave Plan No.");
        LeavePlanDetail.SetRange("Leave Plan Lines No.", "Line No.");
        if LeavePlanDetail.FindSet(true) then
            repeat
                LeavePlanDetail.CopyFromLeavePlanLines(Rec);
                LeavePlanDetail.Modify(true);
            until LeavePlanDetail.Next() = 0;
    end;

    local procedure GetLeavePlanEmployee(var Employee: Record Employee)
    begin
        LeavePlanHeader.Get("Leave Plan No.");
        Employee.Get(LeavePlanHeader."Employee No.");
    end;

    // local procedure GetJobApproverID() ApproverID: Code[50]
    // var
    //     Employee: Record Employee;
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeGetJobApproverID(ApproverID, IsHandled);
    //     if IsHandled then
    //         exit(ApproverID);

    //     Job.Get("Job No.");
    //     Job.TestField("Person Responsible");
    //     Employee.Get(Job."Person Responsible");
    //     Employee.TestField("Leave Plan Owner User ID");
    //     exit(Employee."Leave Plan Owner User ID");
    // end;

    procedure UpdateApproverID()
    var
        Employee: Record Employee;
    begin
        HRSetup.Get();
        GetLeavePlanEmployee(Employee);
        SetApproverIDFromEmployee(Employee);
        // if (Type = Type::Job) and ("Job No." <> '') and
        //    (((Employee.Type = Employee.Type::Person) and
        //      (HRSetup."Leave Plan by Job Approval" = HRSetup."Leave Plan by Job Approval"::Always)) or
        //     ((Employee.Type = Employee.Type::Machine) and
        //      (HRSetup."Leave Plan by Job Approval" in [HRSetup."Leave Plan by Job Approval"::"Machine Only",
        //                                                       HRSetup."Leave Plan by Job Approval"::Always])))
        // then
        //     "Approver ID" := GetJobApproverID()
        // else
        //     SetApproverIDFromEmployee(Employee);
        // OnAfterUpdateApproverID(Rec);
    end;

    local procedure SetApproverIDFromEmployee(Employee: Record Employee)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSetApproverIDFromEmployee(Employee, IsHandled);
        if IsHandled then
            exit;
        UserSetup.Get(UserId);
        UserSetup.TestField("Approver ID");
        "Approver ID" := UserSetup."Approver ID";
    end;

    // local procedure CheckWorkType()
    // var
    //     Employee: Record Employee;
    //     WorkType: Record "Work Type";
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeCheckWorkType(Rec, IsHandled);
    //     if IsHandled then
    //         exit;

    //     if WorkType.Get("Work Type Code") then begin
    //         GetLeavePlanEmployee(Employee);
    //         WorkType.TestField("Unit of Measure Code", Employee."Base Unit of Measure");
    //     end;
    // end;

    // procedure ShowLineDetails(ManagerRole: Boolean)
    // var
    //     LeavePlanLinesResDetail: Page "Leave Plan Lines Res. Detail";
    //     LeavePlanLinesJobDetail: Page "Leave Plan Lines Job Detail";
    //     LeavePlanLinesServiceDetail: Page "Leave Plan Lines Service Detail";
    //     LeavePlanLinesAssembDetail: Page "Leave Plan Lines Assemb. Detail";
    //     LeavePlanLinesAbsenceDetail: Page "Leave Plan Lines Absence Detail";
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeShowLineDetails(Rec, IsHandled, ManagerRole);
    //     if IsHandled then
    //         exit;

    //     case Type of
    //         Type::Employee:
    //             begin
    //                 LeavePlanLinesResDetail.SetParameters(Rec, ManagerRole);
    //                 if LeavePlanLinesResDetail.RunModal() = ACTION::OK then
    //                     LeavePlanLinesResDetail.GetRecord(Rec);
    //             end;
    //         Type::Job:
    //             begin
    //                 LeavePlanLinesJobDetail.SetParameters(Rec, ManagerRole);
    //                 if LeavePlanLinesJobDetail.RunModal() = ACTION::OK then
    //                     LeavePlanLinesJobDetail.GetRecord(Rec);
    //             end;
    //         Type::Absence:
    //             begin
    //                 LeavePlanLinesAbsenceDetail.SetParameters(Rec, ManagerRole);
    //                 if LeavePlanLinesAbsenceDetail.RunModal() = ACTION::OK then
    //                     LeavePlanLinesAbsenceDetail.GetRecord(Rec);
    //             end;
    //         Type::Service:
    //             begin
    //                 LeavePlanLinesServiceDetail.SetParameters(Rec, ManagerRole);
    //                 if LeavePlanLinesServiceDetail.RunModal() = ACTION::OK then
    //                     LeavePlanLinesServiceDetail.GetRecord(Rec);
    //             end;
    //         Type::"Assembly Order":
    //             begin
    //                 LeavePlanLinesAssembDetail.SetParameters(Rec);
    //                 if LeavePlanLinesAssembDetail.RunModal() = ACTION::OK then
    //                     LeavePlanLinesAssembDetail.GetRecord(Rec);
    //             end;
    //         else
    //             Error(Text005);
    //     end;
    //     Modify();
    // end;

    // procedure GetAllowEdit(FldNo: Integer; ManagerRole: Boolean) AllowEdit: Boolean
    // begin
    //     if ManagerRole then
    //         AllowEdit := (FldNo in [FieldNo("Work Type Code"), FieldNo(Chargeable)]) and (Status = Status::Submitted)
    //     else
    //         AllowEdit := Status in [Status::Open, Status::Rejected];

    //     OnAfterGetAllowEdit(FldNo, ManagerRole, AllowEdit);
    // end;

    local procedure CheckEmployeePrivacyBlocked(Employee: Record Employee)
    begin
        if Employee."Privacy Blocked" then
            Error(PrivacyBlockedErr, Employee."No.");
    end;

    // [Scope('OnPrem')]
    // procedure UpdateJobId()
    // var
    //     Job: Record Job;
    // begin
    //     if "Job No." = '' then begin
    //         Clear("Job Id");
    //         exit;
    //     end;

    //     if not Job.Get("Job No.") then
    //         exit;

    //     "Job Id" := Job.SystemId;
    // end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateApproverID(var LeavePlanLines: Record "Leave Plan Lines")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatus(var IsHandled: Boolean; var LeavePlanLines: Record "Leave Plan Lines")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeGetJobApproverID(var ApproverID: Code[50]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeSetApproverIDFromEmployee(Employee: Record Employee; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowLineDetails(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean; ManagerRole: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterGetAllowEdit(FldNo: Integer; ManagerRole: Boolean; var AllowEdit: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckWorkType(var LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean)
    begin
    end;
}