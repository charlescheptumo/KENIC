#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

table 58165 "Probationary Assessment Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Probationary Assessment Header';

    fields
    {
        field(1; "Assessment No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Rec."Assessment No." <> xRec."Assessment No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Probation Assessment Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee.FullName();
                    "Job Title/Position" := Employee."Job Title";
                    "Department Code" := Employee."Department Code";
                    "Date Engaged" := Employee."Employment Date";
                end else begin
                    "Employee Name" := '';
                    "Job Title/Position" := '';
                    "Department Code" := '';
                    "Date Engaged" := 0D;
                end;
            end;
        }
        field(4; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(6; "Job Title/Position"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Date Engaged"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Probation Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Probation End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Highest Qualification"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Supervisor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Supervisor No.") then
                    "Supervisor Name" := Employee.FullName()
                else
                    "Supervisor Name" := '';
            end;
        }
        field(12; "Supervisor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Completed,Cancelled';
            OptionMembers = Open,"Pending Approval",Completed,Cancelled;
        }

        // Section C: Performance Ratings & Qualitative Remarks
        field(20; "Job Knowledge Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(21; "Job Knowledge Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Work Output Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(23; "Work Output Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Work Quality Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(25; "Work Quality Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Attitude to Work Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(27; "Attitude to Work Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Initiative Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(29; "Initiative Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Planning & Organising Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(31; "Planning & Organising Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Co-operation Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(33; "Co-operation Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Attendance & Timing Rating"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsatisfactory,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Fair,Good,"Very Good",Excellent;
        }
        field(35; "Attendance & Timing Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        // Supervisor & HR Management Recommendations
        field(40; "Supervisor Recommendations"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "HR Manager Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Employee Signed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Employee Signed Date"; Date)
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
        key(Key1; "Assessment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Assessment No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Probation Assessment Nos.");
            "Assessment No." := NoSeriesMgt.GetNextNo(HRSetup."Probation Assessment Nos.", WorkDate(), true);
        end;
        "Created On" := CurrentDateTime;
        "Created By" := UserId;
        "Document Date" := WorkDate();
    end;

    var
        HRSetup: Record "Human Resources Setup";
        Employee: Record Employee;
        NoSeriesMgt: Codeunit "No. Series";
}