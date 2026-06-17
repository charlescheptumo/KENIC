table 50059 "Leave Plan Header"
{
    Caption = 'Leave Plan Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(5; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                HRSetup.Get();
                if "Employee No." <> '' then begin
                    Employee.Get("Employee No.");
                    CheckEmployeePrivacyBlocked(Employee);

                    IsHandled := false;
                    OnValidateEmployeeNoOnBeforeTestFields(Employee, IsHandled);
                    if IsHandled then
                        exit;

                    Employee.TestField(Disabled, false);
                    // Employee.TestField("Leave Plan Owner User ID");
                    // Employee.TestField("Leave Plan Approver User ID");
                    // "Owner User ID" := Employee."Leave Plan Owner User ID";
                    // "Approver User ID" := Employee."Leave Plan Approver User ID";
                end;
            end;
        }
        field(6; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            FieldClass = FlowField;
            CalcFormula = Lookup(Employee."First Name" where("No." = field("Employee No.")));
            Editable = false;
        }
        field(7; "Owner User ID"; Code[50])
        {
            Caption = 'Owner User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(8; "Approver User ID"; Code[50])
        {
            Caption = 'Approver User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        // field(11; "Unit of Measure"; Code[10])
        // {
        //     CalcFormula = Lookup(Employee."Base Unit of Measure" where("No." = field("Employee No.")));
        //     Caption = 'Unit of Measure';
        //     FieldClass = FlowField;
        //     Editable = false;
        // }
        field(12; "Open Exists"; Boolean)
        {
            CalcFormula = exist("Leave Plan Lines" where("Leave Plan No." = field("No."),
                                                         Status = const(Open)));
            Caption = 'Open Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Submitted Exists"; Boolean)
        {
            CalcFormula = exist("Leave Plan Lines" where("Leave Plan No." = field("No."),
                                                         Status = const(Submitted)));
            Caption = 'Submitted Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Rejected Exists"; Boolean)
        {
            CalcFormula = exist("Leave Plan Lines" where("Leave Plan No." = field("No."),
                                                         Status = const(Rejected)));
            Caption = 'Rejected Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Approved Exists"; Boolean)
        {
            CalcFormula = exist("Leave Plan Lines" where("Leave Plan No." = field("No."),
                                                         Status = const(Approved)));
            Caption = 'Approved Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Posted Exists"; Boolean)
        {
            CalcFormula = exist("Leave Plan Posting Entry" where("Leave Plan No." = field("No.")));
            Caption = 'Posted Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Book for Leave"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        // field(20; Quantity; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail".Quantity where("Leave Plan No." = field("No."),
        //                                                           Status = field("Status Filter"),
        //                                                           "Job No." = field("Job No. Filter"),
        //                                                           "Job Task No." = field("Job Task No. Filter"),
        //                                                           Date = field("Date Filter"),
        //                                                           Posted = field("Posted Filter"),
        //                                                           Type = field("Type Filter")));
        //     Caption = 'Quantity';
        //     FieldClass = FlowField;
        // }
        // field(21; "Posted Quantity"; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Posting Entry".Quantity where("Leave Plan No." = field("No.")));
        //     Caption = 'Posted Quantity';
        //     FieldClass = FlowField;
        // }
        field(26; Comment; Boolean)
        {
            // CalcFormula = exist("Leave Plan Comment Line" where("No." = field("No."),
            //                                                      "Leave Plan Lines No." = const(0)));
            CalcFormula = exist("Leave Plan Comment Line" where("No." = field("No."), "Leave Plan Line No." = const(0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Status Filter"; Enum "Leave Plan Status")
        {
            Caption = 'Status Filter';
            FieldClass = FlowFilter;
        }
        field(31; "Job No. Filter"; Code[20])
        {
            Caption = 'Job No. Filter';
            FieldClass = FlowFilter;
        }
        field(32; "Job Task No. Filter"; Code[20])
        {
            Caption = 'Job Task No. Filter';
            FieldClass = FlowFilter;
        }
        field(33; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(34; "Posted Filter"; Boolean)
        {
            Caption = 'Posted Filter';
            FieldClass = FlowFilter;
        }
        // field(35; "Type Filter"; Enum "Leave Plan Lines Type")
        // {
        //     Caption = 'Type Filter';
        //     FieldClass = FlowFilter;
        // }
        // field(40; "Quantity Open"; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail".Quantity where("Leave Plan No." = field("No."),
        //                                                  Status = const(Open)));
        //     Caption = 'Quantity Open';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(41; "Quantity Submitted"; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail".Quantity where("Leave Plan No." = field("No."),
        //                                                  Status = const(Submitted)));
        //     Caption = 'Quantity Submitted';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(42; "Quantity Approved"; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail".Quantity where("Leave Plan No." = field("No."),
        //                                                  Status = const(Approved)));
        //     Caption = 'Quantity Approved';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(43; "Quantity Rejected"; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail".Quantity where("Leave Plan No." = field("No."),
        //                                                  Status = const(Rejected)));
        //     Caption = 'Quantity Rejected';
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Employee No.", "Starting Date")
        {
        }
        key(Key3; "Owner User ID")
        {
        }
        key(Key4; "Approver User ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Starting Date", "Ending Date", "Employee No.")
        {
        }
        fieldgroup(Brick; "No.", "Starting Date", "Ending Date", "Employee No.")
        {
        }
    }

    trigger OnDelete()
    var
        LeavePlanCommentLine: Record "Leave Plan Comment Line";
    begin
        if "Employee No." <> '' then begin
            Employee.Get("Employee No.");
            CheckEmployeePrivacyBlocked(Employee);
            Employee.TestField(Disabled, false);
        end;

        LeavePlanLines.SetRange("Leave Plan No.", "No.");
        LeavePlanLines.DeleteAll(true);

        LeavePlanCommentLine.SetRange("No.", "No.");
        LeavePlanCommentLine.SetRange("Leave Plan Line No.", 0);
        LeavePlanCommentLine.DeleteAll();

        RemoveFromMyLeavePlans();
    end;

    trigger OnInsert()
    begin
        if "Employee No." <> '' then begin
            Employee.Get("Employee No.");
            CheckEmployeePrivacyBlocked(Employee);
            Employee.TestField(Disabled, false);
            UserSetup.Get("Employee No.");
            if UserSetup."Employee No." <> '' then
                AddToMyLeavePlans(Employee."User ID");
        end;
    end;

    trigger OnModify()
    begin
        if "Employee No." <> '' then begin
            Employee.Get("Employee No.");
            CheckEmployeePrivacyBlocked(Employee);
            Employee.TestField(Disabled, false);
        end;
    end;

    trigger OnRename()
    begin
        if "Employee No." <> '' then begin
            Employee.Get("Employee No.");
            CheckEmployeePrivacyBlocked(Employee);
            Employee.TestField(Disabled, false);
        end;
    end;

    var
        Employee: Record Employee;
        HRSetup: Record "Human Resources Setup";
        LeavePlanLines: Record "Leave Plan Lines";
        UserSetup: Record "User Setup";

        Text001: Label '%1 does not contain lines.';
        Text002: Label 'No Leave Plans are available. The Leave Plan administrator must create Leave Plans before you can access them in this window.';
        PrivacyBlockedErr: Label 'You cannot use Employee %1 because they are marked as blocked due to privacy.', Comment = '%1=Employee no.';

    // procedure CalcQtyWithStatus(Status: Enum "Leave Plan Status"): Decimal
    // begin
    //     SetRange("Status Filter", Status);
    //     CalcFields(Quantity);
    //     exit(Quantity);
    // end;

    procedure Check()
    begin
        LeavePlanLines.SetRange("Leave Plan No.", "No.");
        if LeavePlanLines.FindSet() then
            repeat
                CheckLeavePlanLines(LeavePlanLines);
            until LeavePlanLines.Next() = 0
        else
            Error(Text001, "No.");
    end;

    local procedure CheckLeavePlanLines(LeavePlanLines: Record "Leave Plan Lines")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckLeavePlanLines(LeavePlanLines, IsHandled);
        if IsHandled then
            exit;

        LeavePlanLines.TestField(Status, LeavePlanLines.Status::Approved);
        LeavePlanLines.TestField(Posted, true);
    end;

    procedure GetLastLineNo(): Integer
    begin
        LeavePlanLines.Reset();
        LeavePlanLines.SetRange("Leave Plan No.", "No.");
        if LeavePlanLines.FindLast() then;
        exit(LeavePlanLines."Line No.");
    end;

    procedure FindLastLeavePlanNo(FilterFieldNo: Integer): Code[20]
    begin
        Reset();
        SetCurrentKey("Employee No.", "Starting Date");

        FilterLeavePlans(Rec, FilterFieldNo);
        SetFilter("Starting Date", '%1..', WorkDate());
        if FindFirst() then
            exit("No.");

        SetRange("Starting Date");
        SetRange("Ending Date");
        if FindLast() then
            exit("No.");

        Error(Text002);
    end;

    procedure FindCurrentLeavePlanNo(FilterFieldNo: Integer): Code[20]
    begin
        Reset();
        SetCurrentKey("Employee No.", "Starting Date");

        FilterLeavePlans(Rec, FilterFieldNo);
        if Rec.IsEmpty then
            Error(Text002);

        SetFilter("Starting Date", '..%1', WorkDate());
        if FindLast() then
            exit("No.");
    end;

    procedure FindLeavePlanList(FilterFieldNo: Integer): Code[20]
    begin
        Reset();
        SetCurrentKey("Employee No.", "Starting Date");

        FilterLeavePlans(Rec, FilterFieldNo);
    end;

    local procedure AddToMyLeavePlans(UserID: Code[50])
    var
        MyLeavePlans: Record "My Leave Planner";
    begin
        MyLeavePlans.Init();
        MyLeavePlans."User ID" := UserId;
        MyLeavePlans."Leave Plan No." := "No.";
        MyLeavePlans."Start Date" := "Starting Date";
        MyLeavePlans."End Date" := "Ending Date";
        // MyLeavePlans.Comment := Comment;
        MyLeavePlans.Insert();
    end;

    local procedure RemoveFromMyLeavePlans()
    var
        MyLeavePlans: Record "My Leave Planner";
    begin
        MyLeavePlans.SetRange("Leave Plan No.", "No.");
        if MyLeavePlans.FindFirst() then
            MyLeavePlans.DeleteAll();
    end;

    procedure FilterLeavePlans(var LeavePlanHeader: Record "Leave Plan Header"; FieldNo: Integer)
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeFilterLeavePlan(LeavePlanHeader, FieldNo, IsHandled);
        If IsHandled then
            exit;

        if UserSetup.Get(UserId) then;
        if not UserSetup."System Admin" then begin
            LeavePlanHeader.FilterGroup(2);
            case FieldNo of
                LeavePlanHeader.FieldNo("Owner User ID"):
                    LeavePlanHeader.SetRange("Owner User ID", UserId);
                LeavePlanHeader.FieldNo("Approver User ID"):
                    LeavePlanHeader.SetRange("Approver User ID", UserId);
            end;
            LeavePlanHeader.FilterGroup(0);
        end;
    end;


    local procedure CheckEmployeePrivacyBlocked(Employee: Record Employee)
    begin
        if Employee."Privacy Blocked" then
            Error(PrivacyBlockedErr, Employee."No.");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckLeavePlanLines(LeavePlanLines: Record "Leave Plan Lines"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnValidateEmployeeNoOnBeforeTestFields(Employee: Record Employee; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFilterLeavePlan(var LeavePlanHeader: Record "Leave Plan Header"; FieldNo: Integer; var IsHandled: Boolean)
    begin
    end;
}

