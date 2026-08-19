table 50175 "Successor Form Header"
{
    Caption = 'Successor Form';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Job Title"; Text[100])
        {
            Caption = 'Job Title';
            DataClassification = ToBeClassified;
        }
        field(4; "Successor"; Text[100])
        {
            Caption = 'Successor';
            DataClassification = ToBeClassified;
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
        field(24; "No. Series"; Code[20])
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
        CashMgtSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            CashMgtSetup.Get();
            CashMgtSetup.TestField("Successor Form Nos.");
            "No. Series" := CashMgtSetup."Successor Form Nos.";
            "No." := NoSeriesMgt.GetNextNo("No. Series", WorkDate(), true);
        end;
    end;
}