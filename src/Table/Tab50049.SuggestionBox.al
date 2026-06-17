table 50049 "Suggestion Box"
{
    Caption = 'Suggestion Box';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[50])
        {
        }
        field(2; "Requested By"; Code[100])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSet.Reset();
                UserSet.SetRange("User ID", "Requested By");
                if UserSet.Find('-') then begin
                    "Requested By Name" := UserSet."Employee Name";
                    "Requester Email" := UserSet."E-Mail";

                end;
            end;

        }
        field(3; "Requested By Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Proposal"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Admin Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Admin Email"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "ICT Feedback"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Approval Status"; Enum "App Status")
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Requester Email"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Has Feedback"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "System Type"; Enum "System Type")
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Raised Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Project Team"; Code[100])
        {
            TableRelation = "Project Teams".Code;

            trigger OnValidate()
            var
                ProjTeam: Record "Project Teams";
            begin
                ProjTeam.Reset();
                ProjTeam.SetRange(Code, "Project Team");
                if ProjTeam.Find('-') then begin
                    "Project Team Name" := ProjTeam."Team Name";
                end;
            end;
        }
        field(15; "Project Team Name"; Code[100])
        {

        }
        field(16; "Process Status"; Enum "Suggestion Process Status")
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Rejection Reason"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Created Preliminary Report"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Created TOR"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Reviewed User Requirements/Technical Specifications"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Checked Workplan and Verified Budget"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "System Testing"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Logical and Physical Design Upload"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "User Manual"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Training Report"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "System Acceptance Report"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Handing Over Report"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Minimum Requirements"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "No Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            HRSet.Get();
            HRSet.TestField("Suggestion Box Nos");
          rec."No" := NoSeriesMgt.GetNextNo(HRSET."Suggestion Box Nos", WorkDate(), true);
        end;

        UserSet.Get(UserId);
        if UserSet.find('-') then begin
            "Requested By" := UserSet."User ID";
            "Requested By Name" := UserSet."Employee Name";
            "Requester Email" := UserSet."E-Mail";
        end;

        "Raised Date" := Today;
        "Created Preliminary Report" := false;
        "Checked Workplan and Verified Budget" := false;
        "Created TOR" := false;
        "Handing Over Report" := false;
        "Created TOR" := false;
        "Handing Over Report" := false;
        "Logical and Physical Design Upload" := false;
        "Reviewed User Requirements/Technical Specifications" := false;
        "System Acceptance Report" := false;
        "System Testing" := false;
        "Training Report" := false;
        "User Manual" := false;
    end;

    var
        HRSet: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UserSet: Record "User Setup";
}
