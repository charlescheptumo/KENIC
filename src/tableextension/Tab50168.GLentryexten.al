tableextension 50168 "G/L Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50100; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            ToolTip = 'Specifies the employee number associated with this G/L entry.';
            FieldClass = FlowField;
            CalcFormula = lookup(payments."Account No." where("No." = field("Document No.")));
        }

        field(50101; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            ToolTip = 'Specifies the employee name associated with this G/L entry.';
             FieldClass = FlowField;
            CalcFormula = lookup(payments."Account Name" where("No." = field("Document No.")));
        }

        field(50102; "Paying Bank Account"; Code[20])
        {
            Caption = 'Paying Bank Account';
            ToolTip = 'Specifies the bank account used for payment related to this G/L entry.';
            TableRelation = "Bank Account";
        }

        field(50103; "Destination Narration"; Text[250])
        {
            Caption = 'Destination Narration';
            ToolTip = 'Specifies additional narration or description for the destination of this G/L entry.';
            //  FieldClass = FlowField;
            // CalcFormula = lookup(payments."Destination Narration" where("No." = field("Document No.")));
        }
        field(50104; "Bank Name"; Text[200])
        {
            Caption = 'Bank Name';
            ToolTip = 'Specifies the name of the bank associated with the paying bank account for this G/L entry.';
        }


    }

    keys
    {

    }
}