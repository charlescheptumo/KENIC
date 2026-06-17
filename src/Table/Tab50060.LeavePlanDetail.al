table 50060 "Leave Plan Detail"
{
    Caption = 'Leave Plan Detail';

    fields
    {
        field(1; "Leave Plan No."; Code[20])
        {
            Caption = 'Leave Plan No.';
            TableRelation = "Leave Plan Header";
        }
        field(2; "Leave Plan Lines No."; Integer)
        {
            Caption = 'Leave Plan Lines No.';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
        }
        // field(6; "Job No."; Code[20])
        // {
        //     Caption = 'Job No.';
        //     TableRelation = Job;
        // }
        // field(7; "Job Task No."; Code[20])
        // {
        //     Caption = 'Job Task No.';
        //     TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
        // }
        field(9; "Cause of Absence Code"; Code[10])
        {
            Caption = 'Cause of Absence Code';
            TableRelation = "Cause of Absence";
        }
        // field(13; "Service Order No."; Code[20])
        // {
        //     Caption = 'Service Order No.';
        //     TableRelation = if (Posted = const(false)) "Service Header"."No." where("Document Type" = const(Order));
        // }
        // field(14; "Service Order Line No."; Integer)
        // {
        //     Caption = 'Service Order Line No.';
        // }
        // field(15; Quantity; Decimal)
        field(15; Quantity; Integer)
        {
            Caption = 'Quantity';
            Editable = false;
        }
        // field(16; "Posted Quantity"; Decimal)
        // {
        //     Caption = 'Posted Quantity';
        // }
        // field(18; "Assembly Order No."; Code[20])
        // {
        //     Caption = 'Assembly Order No.';
        //     TableRelation = if (Posted = const(false)) "Assembly Header"."No." where("Document Type" = const(Order));
        // }
        // field(19; "Assembly Order Line No."; Integer)
        // {
        //     Caption = 'Assembly Order Line No.';
        // }
        field(20; Status; Enum "Leave Plan Status")
        {
            Caption = 'Status';
        }
        field(23; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
            ObsoleteState = Removed;
            ObsoleteReason = 'This functionality will be replaced by the systemID field';
            ObsoleteTag = '22.0';
        }
        field(8001; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
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
        key(Key1; "Leave Plan No.", "Leave Plan Lines No.", Date)
        {
            Clustered = true;
        }
        // key(Key2; Type, "Job No.", "Job Task No.", Status, Posted)
        // {
        //     IncludedFields = Quantity;
        // }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        CheckLeavePeriod(Date);
        SetLastModifiedDateTime();
        SetDimension();
    end;

    trigger OnModify()
    begin
        CheckLeavePeriod(Date);
        SetLastModifiedDateTime();
    end;

    trigger OnRename()
    begin
        SetLastModifiedDateTime();
    end;

    var
        TimeSheetMgt: Codeunit "Time Sheet Management";

    procedure CopyFromLeavePlanLines(LeavePlanLines: Record "Leave Plan Lines")
    begin
        "Leave Plan No." := LeavePlanLines."Leave Plan No.";
        "Leave Plan Lines No." := LeavePlanLines."Line No.";
        "Cause of Absence Code" := LeavePlanLines."Cause of Absence Code";
        Status := LeavePlanLines.Status;
        "Dimension Set ID" := LeavePlanLines."Dimension Set ID";

        OnAfterCopyFromLeavePlanLines(Rec, LeavePlanLines);
    end;

    procedure SetDimension()
    var
        LeavePlanLines: Record "Leave Plan Lines";
    begin
        if LeavePlanLines.Get("Leave Plan No.", "Leave Plan Lines No.") then
            if "Dimension Set ID" = 0 then
                "Dimension Set ID" := LeavePlanLines."Dimension Set ID";
    end;

    // procedure GetMaxQtyToPost(): Decimal
    // begin
    //     exit(Quantity - "Posted Quantity");
    // end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyFromLeavePlanLines(var LeavePlanDetail: Record "Leave Plan Detail"; LeavePlanLines: Record "Leave Plan Lines")
    begin
    end;

    local procedure SetLastModifiedDateTime()
    begin
        "Last Modified DateTime" := CurrentDateTime;
    end;

    local procedure CheckLeavePeriod(Date: Date)
    var
        LeavePeriod: Record "HR Leave Periods";
    begin
        if LeavePeriod.IsEmpty() then
            exit;
        LeavePeriod.SetFilter(Starts, '..%1', Date);
        LeavePeriod.FindLast();
        LeavePeriod.TestField(Closed, false);
    end;
}