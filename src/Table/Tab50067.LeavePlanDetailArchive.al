table 50067 "Leave Plan Detail Archive"
{
    Caption = 'Leave Plan Detail Archive';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Leave Plan No."; Code[20])
        {
            Caption = 'Leave Plan No.';
            TableRelation = "Leave Plan Header Archive";
        }
        field(2; "Leave Plan Line No."; Integer)
        {
            Caption = 'Leave Plan Line No.';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        // field(4; Type; Enum "Leave Plan Line Type")
        // {
        //     Caption = 'Type';
        // }
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
        // {
        //     Caption = 'Quantity';
        //     Editable = false;
        // }
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
        field(24; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(25; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
    }

    keys
    {
        key(Key1; "Leave Plan No.", "Leave Plan Line No.", Date)
        {
            Clustered = true;
        }
        // key(Key2; Type, "Job No.", "Job Task No.", Status, Posted)
        // {
        //     SumIndexFields = Quantity;
        // }
    }

    fieldgroups
    {
    }
}
