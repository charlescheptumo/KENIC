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

        // Section Sign-off Controls (legacy)
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

        // Header UserID capture (auto-stamped on first signoff by each party)
        field(53; "Employee User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(54; "Facilitator User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Documentation
        field(60; "Documentation Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Documentation Employee Signoff", "Documentation Employee UserID");
                "Documentation Signed" := "Documentation Employee Signoff" and "Documentation Facilitator Signoff";
            end;
        }
        field(61; "Documentation Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(62; "Documentation Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Documentation Facilitator Signoff", "Documentation Facilitator UserID");
                "Documentation Signed" := "Documentation Employee Signoff" and "Documentation Facilitator Signoff";
            end;
        }
        field(63; "Documentation Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Orientation
        field(64; "Orientation Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Orientation Employee Signoff", "Orientation Employee UserID");
                "Orientation Signed" := "Orientation Employee Signoff" and "Orientation Facilitator Signoff";
            end;
        }
        field(65; "Orientation Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(66; "Orientation Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Orientation Facilitator Signoff", "Orientation Facilitator UserID");
                "Orientation Signed" := "Orientation Employee Signoff" and "Orientation Facilitator Signoff";
            end;
        }
        field(67; "Orientation Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Health & Safety
        field(68; "Health & Safety Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Health & Safety Employee Signoff", "Health & Safety Employee UserID");
                "Health & Safety Signed" := "Health & Safety Employee Signoff" and "Health & Safety Facilitator Signoff";
            end;
        }
        field(69; "Health & Safety Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70; "Health & Safety Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Health & Safety Facilitator Signoff", "Health & Safety Facilitator UserID");
                "Health & Safety Signed" := "Health & Safety Employee Signoff" and "Health & Safety Facilitator Signoff";
            end;
        }
        field(71; "Health & Safety Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Marketing & Comm
        field(72; "Marketing & Comm Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Marketing & Comm Employee Signoff", "Marketing & Comm Employee UserID");
                "Marketing & Comm Signed" := "Marketing & Comm Employee Signoff" and "Marketing & Comm Facilitator Signoff";
            end;
        }
        field(73; "Marketing & Comm Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(74; "Marketing & Comm Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Marketing & Comm Facilitator Signoff", "Marketing & Comm Facilitator UserID");
                "Marketing & Comm Signed" := "Marketing & Comm Employee Signoff" and "Marketing & Comm Facilitator Signoff";
            end;
        }
        field(75; "Marketing & Comm Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Business Dev
        field(76; "Business Dev Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Business Dev Employee Signoff", "Business Dev Employee UserID");
                "Business Dev Signed" := "Business Dev Employee Signoff" and "Business Dev Facilitator Signoff";
            end;
        }
        field(77; "Business Dev Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(78; "Business Dev Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Business Dev Facilitator Signoff", "Business Dev Facilitator UserID");
                "Business Dev Signed" := "Business Dev Employee Signoff" and "Business Dev Facilitator Signoff";
            end;
        }
        field(79; "Business Dev Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Data Protection & QA
        field(80; "Data Protect Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Data Protect Employee Signoff", "Data Protect Employee UserID");
                "Data Protection & QA Signed" := "Data Protect Employee Signoff" and "Data Protect Facilitator Signoff";
            end;
        }
        field(81; "Data Protect Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(82; "Data Protect Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Data Protect Facilitator Signoff", "Data Protect Facilitator UserID");
                "Data Protection & QA Signed" := "Data Protect Employee Signoff" and "Data Protect Facilitator Signoff";
            end;
        }
        field(83; "Data Protect Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Conditions of Work
        field(84; "Conditions Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Conditions Employee Signoff", "Conditions Employee UserID");
                "Conditions of Work Signed" := "Conditions Employee Signoff" and "Conditions Facilitator Signoff";
            end;
        }
        field(85; "Conditions Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(86; "Conditions Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Conditions Facilitator Signoff", "Conditions Facilitator UserID");
                "Conditions of Work Signed" := "Conditions Employee Signoff" and "Conditions Facilitator Signoff";
            end;
        }
        field(87; "Conditions Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Finance & Strategy
        field(88; "Finance & Strategy Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Finance & Strategy Employee Signoff", "Finance & Strategy Employee UserID");
                "Finance & Strategy Signed" := "Finance & Strategy Employee Signoff" and "Finance & Strategy Facilitator Signoff";
            end;
        }
        field(89; "Finance & Strategy Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(90; "Finance & Strategy Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Finance & Strategy Facilitator Signoff", "Finance & Strategy Facilitator UserID");
                "Finance & Strategy Signed" := "Finance & Strategy Employee Signoff" and "Finance & Strategy Facilitator Signoff";
            end;
        }
        field(91; "Finance & Strategy Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // Technical & Security
        field(92; "Technical & Security Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("Technical & Security Employee Signoff", "Technical & Security Employee UserID");
                "Technical & Security Signed" := "Technical & Security Employee Signoff" and "Technical & Security Facilitator Signoff";
            end;
        }
        field(93; "Technical & Security Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(94; "Technical & Security Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("Technical & Security Facilitator Signoff", "Technical & Security Facilitator UserID");
                "Technical & Security Signed" := "Technical & Security Employee Signoff" and "Technical & Security Facilitator Signoff";
            end;
        }
        field(95; "Technical & Security Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        // CEO Connect
        field(96; "CEO Connect Employee Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampEmployeeUserID("CEO Connect Employee Signoff", "CEO Connect Employee UserID");
                "CEO Connect Signed" := "CEO Connect Employee Signoff" and "CEO Connect Facilitator Signoff";
            end;
        }
        field(97; "CEO Connect Employee UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(98; "CEO Connect Facilitator Signoff"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                StampFacilitatorUserID("CEO Connect Facilitator Signoff", "CEO Connect Facilitator UserID");
                "CEO Connect Signed" := "CEO Connect Employee Signoff" and "CEO Connect Facilitator Signoff";
            end;
        }
        field(99; "CEO Connect Facilitator UserID"; Code[50])
        {
            DataClassification = ToBeClassified;
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

    local procedure StampEmployeeUserID(SignoffValue: Boolean; var SectionUserID: Code[50])
    begin
        if SignoffValue then begin
            SectionUserID := UserId();
            if "Employee User ID" = '' then
                "Employee User ID" := UserId();
        end else
            SectionUserID := '';
    end;

    local procedure StampFacilitatorUserID(SignoffValue: Boolean; var SectionUserID: Code[50])
    begin
        if SignoffValue then begin
            SectionUserID := UserId();
            if "Facilitator User ID" = '' then
                "Facilitator User ID" := UserId();
        end else
            SectionUserID := '';
    end;
}
