#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

Table 58164 "Induction Signoff Form"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Induction No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Rec."Induction No." <> xRec."Induction No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Induction Signoff Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Offer ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employment Offer"."Offer ID";

            trigger OnValidate()
            begin
                if EmploymentOffer.Get("Offer ID") then begin
                    "Application No." := EmploymentOffer."Application No.";
                    "Candidate No." := EmploymentOffer."Candidate No.";
                    "Intern Name" := EmploymentOffer."First Name" + ' ' + EmploymentOffer."Middle Name" + ' ' + EmploymentOffer."Last Name";
                    "Position ID" := EmploymentOffer."Position ID";
                    "Position Title" := EmploymentOffer."Job Title/Designation";
                    "Reporting Date" := EmploymentOffer."Employment Start Date";
                    "Supervisor No." := EmploymentOffer."Lead HR Officer";
                    "Vacancy ID" := EmploymentOffer."Vacancy ID";
                end;
            end;
        }
        field(4; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Intern Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Supervisor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Supervisor No.") then
                    "Supervisor Name" := Employee.FullName();
            end;
        }
        field(8; "Supervisor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Position Title"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Reporting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Vacancy ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,In Progress,Completed,Cancelled';
            OptionMembers = Open,"In Progress",Completed,Cancelled;
        }

        // Section Sign-off Controls
        field(20; "Documentation Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Orientation Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Health & Safety Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Marketing & Comm Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Business Dev Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Data Protection & QA Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Conditions of Work Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Finance & Strategy Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Technical & Security Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "CEO Connect Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        // System Audit Fields
        field(50; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(51; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(52; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Induction No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Induction No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Induction Signoff Nos.");
            "Induction No." := NoSeriesMgt.GetNextNo(HRSetup."Induction Signoff Nos.", WorkDate(), true);
        end;
        "Created On" := CurrentDateTime;
        "Created By" := UserId;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        EmploymentOffer: Record "Employment Offer";
        Employee: Record Employee;
        NoSeriesMgt: Codeunit "No. Series";
}