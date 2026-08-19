table 50173 "Succ. Sel. Justification Hdr"
{
    Caption = 'Successor Selection Justification';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Department"; Code[20])
        {
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            DataClassification = ToBeClassified;
        }
        field(3; "Current Role"; Text[100])
        {
            Caption = 'Current Role';
            DataClassification = ToBeClassified;
        }
        field(4; "Successor Name"; Text[100])
        {
            Caption = 'Successor''s Name';
            TableRelation = Employee;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                EmployeeRec: Record Employee;

            begin
                if EmployeeRec.Get(Rec."Successor Name") then begin
                    "Current Role" := EmployeeRec."Job Title";
                    "Current Position" := EmployeeRec."Current Position ID";
                    Department:= EmployeeRec."Department Code";
                end;
            end;
        }
        field(5; "Current Position"; Text[100])
        {
            Caption = 'Current Position';
            DataClassification = ToBeClassified;
        }
        field(6; "Date of Evaluation"; Date)
        {
            Caption = 'Date of Evaluation';
            DataClassification = ToBeClassified;
        }
        field(7; "Total Score"; Integer)
        {
            Caption = 'Total Score';
            FieldClass = FlowField;
            CalcFormula = sum("Succ. Sel. Justification Line".Rating where("Document No." = field("No.")));
            Editable = false;
        }
        field(8; "Overall Rating"; Decimal)
        {
            Caption = 'Overall Rating (1-5)';
            DataClassification = ToBeClassified;
        }
        field(9; "Summary of Justification"; Blob)
        {
            Caption = 'Summary of Justification';
            DataClassification = ToBeClassified;
        }
        field(10; "Additional Comments"; Blob)
        {
            Caption = 'Additional Comments';
            DataClassification = ToBeClassified;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            HumanResourcesSetup.Get();
            HumanResourcesSetup.TestField("Succ. Sel. Justification Nos.");
            "No. Series" := HumanResourcesSetup."Succ. Sel. Justification Nos.";
            "No." := NoSeriesMgt.GetNextNo("No. Series", WorkDate(), true);
        end;
    end;
}