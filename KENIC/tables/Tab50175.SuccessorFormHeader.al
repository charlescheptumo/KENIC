table 50175 "Successor Form Header"
{
    Caption = 'Successor Form';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            TableRelation = Employee;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                EmployeeRec: Record Employee;
            begin
                if EmployeeRec.Get(Rec."Name") then begin
                    "Job Title" := EmployeeRec."Job Title";

                end;
            end;
        }
        field(3; "Job Title"; Text[100])
        {
            Caption = 'Job Title';
            DataClassification = ToBeClassified;
        }
        field(4; "Successor"; Text[100])
        {
            Caption = 'Successor';
            TableRelation = Employee;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                EmployeeRec: Record Employee;
            begin
                if EmployeeRec.Get(Rec."Successor") then begin
                    "Successor Job Title" := EmployeeRec."Job Title";
                end;
            end;
        }
        field(5; "Successor Job Title"; Text[100])
        {
            Caption = 'Successor Job Title';
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Completion Date"; Date)
        {
            Caption = 'Completion Date';
            DataClassification = ToBeClassified;
        }
        field(20; "Job Holder Signature"; Text[100])
        {
            Caption = 'Job Holder Signature';
            DataClassification = ToBeClassified;
        }
        field(21; "Job Holder Signature Date"; Date)
        {
            Caption = 'Job Holder Signature Date';
            DataClassification = ToBeClassified;
        }
        field(22; "Successor Signature"; Text[100])
        {
            Caption = 'Successor Signature';
            DataClassification = ToBeClassified;
        }
        field(23; "Successor Signature Date"; Date)
        {
            Caption = 'Successor Signature Date';
            DataClassification = ToBeClassified;
        }
        field(24; "No. Series"; Code[30])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(25; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,"Pending Approval",Released;
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
            HumanResourcesSetup.TestField("Successor Form Nos.");
            "No. Series" := HumanResourcesSetup."Successor Form Nos.";
            "No." := NoSeriesMgt.GetNextNo("No. Series", WorkDate(), true);
        end;
    end;
}