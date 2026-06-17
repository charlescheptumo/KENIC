table 99504 "Leave Plan Detailed Lines"
{
    Caption = 'Leave Plan Detailed Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            Editable = false;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get(Rec."Employee No.") then begin
                    Rec."Shortcut Dimension 3 Code" := Emp."Shortcut Dimension 3";
                end;
            end;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Leave Type"; Code[50])
        {
            Caption = 'Leave Type';
            // Editable = false;
        }
        field(5; "Days Applied"; Decimal)
        {
            Caption = 'No. of Days';
            trigger onvalidate()
            begin
                if Rec."Start Date" <> 0D then
                    Validate("Start Date");
            end;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                if "Days Applied" > 0 then begin
                    HRLeaveType.Reset();
                    HRLeaveType.SetRange(Annual, true);
                    if HRLeaveType.FindFirst() then begin
                        Rec."End Date" := Customfunction.BaseCalendarRemoveNonWorkingDays(Rec."Start Date", Rec."Days Applied", HRLeaveType."Inclusive of Holidays", HRLeaveType."Inclusive of Saturday", HRLeaveType."Inclusive of Sunday");
                        Rec."End Date" := Customfunction.CheckIfEndDateIsNonWorking(Rec."End Date", HRLeaveType."Inclusive of Holidays", HRLeaveType."Inclusive of Saturday", HRLeaveType."Inclusive of Sunday");
                    end;
                end;
            end;
        }
        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(8; "Leave Period"; Code[10])
        {
            Editable = false;
            TableRelation = "HR Leave Periods";
        }

        field(9; Reliever; Code[50])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                //DISPLAY RELEIVERS NAME
                if HREmp.Get(Reliever) then
                    "Reliever Name" := HREmp.FullName;
            end;
        }
        field(10; "Reliever Name"; Text[100])
        {
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            FieldClass = Normal;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
    }
    keys
    {
        key(PK; "Document No.", "Employee No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        LeavePlanDetailedLines: Record "Leave Plan Detailed Lines";
        HRLeaveTypes: Record "HR Leave Types";
        LeaveLine: Record "HR Leave Planner Lines";
    begin
        LeavePlanDetailedLines.Reset();
        LeavePlanDetailedLines.SetRange("Document No.", Rec."Document No.");
        LeavePlanDetailedLines.SetRange("Employee No.", Rec."Employee No.");
        if LeavePlanDetailedLines.FindLast() then
            Rec."Line No." := LeavePlanDetailedLines."Line No." + 1
        else
            Rec."Line No." := 1;

        HRLeaveTypes.Reset();
        HRLeaveTypes.SetRange(Annual, true);
        if HRLeaveTypes.FindFirst() then
            Rec."Leave Type" := HRLeaveTypes.Code;
        LeaveLine.Reset();
        LeaveLine.SetRange("Application Code", Rec."Document No.");
        if LeaveLine.FindFirst() then
            Rec."Leave Period" := LeaveLine."Leave Period";
    end;

    var
        Customfunction: Codeunit "Custom Function";
        HRLeaveType: Record "HR Leave Types";
        HREmp: Record Employee;
}
