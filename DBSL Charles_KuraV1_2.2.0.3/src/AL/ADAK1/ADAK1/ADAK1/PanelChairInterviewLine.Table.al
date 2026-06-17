#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69719 "Panel Chair Interview Line"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Interview Invitation,Candidate Shortlisting,Consolidated Interview Report';
            OptionMembers = "Interview Invitation","Candidate Shortlisting","Consolidated Interview Report";
        }
        field(2; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Interview Invitation No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                Applicant: Record Applicant;
            begin
                Applicant.Get("Candidate No.");
                "Phone No." := Applicant."Phone No.";
                "Mobile Phone No." := Applicant."Mobile Phone No.";
                Email := Applicant."E-Mail";
                "Birth Date" := Applicant."Birth Date";
                Gender := Applicant.Gender;
                "ID Number" := Applicant."ID Number";
                "Passport No." := Applicant."Passport No.";
                // "Tax Registration(PIN)":=Applicant.
                "Marital Status" := Applicant."Marital Status";
                // Religion:=Applicant.Religion;
                "Ethnic Group" := Applicant."Ethnic Group";
                Nationality := Applicant.Nationality;
                "Specialization Area" := Applicant."Specialization Area";
                "Management Experience Yrs" := Applicant."Management Experience (Years)";
                "Disability Code" := Applicant."Disability Code";
                "Disability Cert No." := Applicant."Disability Certificate No";
            end;
        }
        field(6; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Middle Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Interview Panel Outcome"; Option)
        {
            Caption = 'Final Interview Panel Outcome';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsuccessful,Successful';
            OptionMembers = " ",Unsuccessful,Successful;
        }
        field(10; "Interview Panel Score %"; Decimal)
        {
            Caption = 'Final Interview Panel Score %';
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // var
            //     CandidateInterviewLine: Record "Candidate Interview Line";
            //     AverageScore: Decimal;
            //     NoofRecords: Integer;
            // begin
            //     CandidateInterviewLine.Reset();
            //     CandidateInterviewLine.SetRange("Document No.", "Document No.");
            //     if CandidateInterviewLine.FindSet then begin
            //         repeat
            //             AverageScore := AverageScore + CandidateInterviewLine."Interview Panel Score %";
            //             NoofRecords := CandidateInterviewLine.Count();
            //         until CandidateInterviewLine.Next = 0;
            //         if AverageScore <> 0 then begin
            //             if NoofRecords <> 0 then begin
            //                 AverageScore := AverageScore / NoofRecords;
            //             end;
            //         end; 
            //     end
            // end;
        }
        field(11; "Interview Panel Remarks"; Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Unsuccesful Application Reason"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Interview Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Interview Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Interview End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Assigned Panel ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher"."Document No.";
        }
        field(17; "Interview Venue"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Room No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Candidate Attendance Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pending Confirmation,Confirmed,Confirmed with Reschedule Request,Cancelled';
            OptionMembers = "Pending Confirmation",Confirmed,"Confirmed with Reschedule Request",Cancelled;
        }
        field(20; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Candidate Shortlist Voucher"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Mobile Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; Email; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Birth Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; Gender; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Female,Male,Other';
            OptionMembers = Female,Male,Other;
        }
        field(28; "ID Number"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Passport No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Tax Registration(PIN)"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Marital Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(32; Religion; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Ethnic Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; Nationality; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; "Specialization Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Highest Academic Qualification"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37; "Academic Qualification Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(38; "Highest Academic Pointer"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "General Work Experience Yrs"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Management Experience Yrs"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Disability Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Disability Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Disability Cert No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(45; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Notified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "No Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Interview Invitation No.", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            HRSet.Get();
            HRSet.TestField("Consolidated Interview Nos");
              "Document No." := NoSeriesMgt.GetNextNo(HRSet."Consolidated Interview Nos", WorkDate(), true);
        end
    end;

    var
        HRSet: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";

    /// <summary>
    /// CalculateAvgScore.
    /// </summary>
    procedure CalculateAvgScore()
    var
        CandidateInterviewLine: Record "Candidate Interview Line";
        AverageScore: Decimal;
        NoofRecords: Integer;
        Applicant: Record Applicant;
    begin
        AverageScore := 0;
        CandidateInterviewLine.Reset();
        CandidateInterviewLine.SetRange("Document No.", Rec."Document No.");
        if CandidateInterviewLine.FindSet then begin
            repeat
                AverageScore := AverageScore + CandidateInterviewLine."Interview Panel Score %";
                NoofRecords := CandidateInterviewLine.Count();
            until CandidateInterviewLine.Next = 0;
            if AverageScore <> 0 then begin
                if NoofRecords <> 0 then begin
                    AverageScore := AverageScore / NoofRecords;
                end;
            end;
        end;
        Applicant.Get(Rec."Candidate No.");
        Rec."Phone No." := Applicant."Phone No.";
        Rec."Mobile Phone No." := Applicant."Mobile Phone No.";
        Rec.Email := Applicant."E-Mail";
        Rec."Birth Date" := Applicant."Birth Date";
        Rec.Gender := Applicant.Gender;
        Rec."ID Number" := Applicant."ID Number";
        Rec."Passport No." := Applicant."Passport No.";
        // "Tax Registration(PIN)":=Applicant.
        Rec."Marital Status" := Applicant."Marital Status";
        // Religion:=Applicant.Religion;
        Rec."Ethnic Group" := Applicant."Ethnic Group";
        Rec.Nationality := Applicant.Nationality;
        Rec."Specialization Area" := Applicant."Specialization Area";
        Rec."Management Experience Yrs" := Applicant."Management Experience (Years)";
        Rec."Disability Code" := Applicant."Disability Code";
        Rec."Disability Cert No." := Applicant."Disability Certificate No";
        Rec."Interview Panel Score %" := AverageScore;
        Rec.Modify();
    end;
}

