table 50064 "Leave Plan Header Archive"
{
    Caption = 'Leave Plan Header Archive';
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
        // field(20; Quantity; Decimal)
        // {
        //     CalcFormula = sum("Leave Plan Detail Archive".Quantity where("Leave Plan No." = field("No."),
        //                                                                   Status = field("Status Filter"),
        //                                                                   "Job No." = field("Job No. Filter"),
        //                                                                   "Job Task No." = field("Job Task No. Filter"),
        //                                                                   Date = field("Date Filter"),
        //                                                                   Posted = field("Posted Filter"),
        //                                                                   Type = field("Type Filter")));
        //     Caption = 'Quantity';
        //     FieldClass = FlowField;
        // }
        field(26; Comment; Boolean)
        {
            CalcFormula = exist("Leave Plan Comment Line" where("No." = field("No."),
                                                                 "Leave Plan Line No." = const(0)));
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
        // field(35; "Type Filter"; Enum "Leave Plan Line Type")
        // {
        //     Caption = 'Type Filter';
        //     FieldClass = FlowFilter;
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
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Starting Date", "Ending Date", "Employee No.")
        {
        }
    }

    trigger OnDelete()
    var
        LeavePlanLineArchive: Record "Leave Plan Line Archive";
        LeavePlanCmtLineArchive: Record "Leave Plan Cmt. Line Archive";
    begin
        LeavePlanLineArchive.SetRange("Leave Plan No.", "No.");
        LeavePlanLineArchive.DeleteAll(true);

        LeavePlanCmtLineArchive.SetRange("No.", "No.");
        LeavePlanCmtLineArchive.SetRange("Leave Plan Line No.", 0);
        LeavePlanCmtLineArchive.DeleteAll();
    end;

    var
        LeavePlanMgt: Codeunit "Leave Plan Management";

    procedure FindLastLeavePlanArchiveNo(FilterFieldNo: Integer): Code[20]
    begin
        Reset();
        SetCurrentKey("Employee No.", "Starting Date");

        LeavePlanMgt.FilterLeavePlansArchive(Rec, FilterFieldNo);
        SetFilter("Starting Date", '%1..', WorkDate());
        if not FindFirst() then begin
            SetRange("Starting Date");
            SetRange("Ending Date");
            FindLast();
        end;
        exit("No.");
    end;
}
