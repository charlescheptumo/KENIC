#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58166 "Resolution Candidates"
{
    Caption = 'Resolution Candidates';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Resolution No."; Code[20])
        {
            Caption = 'Resolution No.';
            DataClassification = CustomerContent;
            TableRelation = "Meeting Resolutions"."No.";
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "Director No."; Code[50])
        {
            Caption = 'Director No.';
            DataClassification = CustomerContent;
            TableRelation = "Board Members";

            trigger OnValidate()
            var
                BoardMember: Record "Board Members";
                FullName: Text;
            begin
                if "Director No." = '' then
                    exit;

                if BoardMember.Get("Director No.") then begin
                    FullName := BoardMember."First Name";
                    if BoardMember."Middle Name" <> '' then
                        FullName += ' ' + BoardMember."Middle Name";
                    if BoardMember."Last Name" <> '' then
                        FullName += ' ' + BoardMember."Last Name";
                    "Candidate Name" := CopyStr(DelChr(FullName, '<>', ' '), 1, MaxStrLen("Candidate Name"));
                end;
            end;
        }
        field(4; "Candidate Name"; Text[250])
        {
            Caption = 'Candidate Name';
            DataClassification = CustomerContent;
        }
        field(5; "Profile"; Text[2048])
        {
            Caption = 'Profile';
            DataClassification = CustomerContent;
        }
        field(6; "Vote Count"; Integer)
        {
            Caption = 'Vote Count';
            FieldClass = FlowField;
            CalcFormula = count("Election Ballots" where("Resolution No." = field("Resolution No."),
                                                          "Candidate Line No." = field("Line No.")));
            Editable = false;
        }
        field(7; "Elected"; Boolean)
        {
            Caption = 'Elected';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Final Votes"; Integer)
        {
            Caption = 'Final Votes';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Resolution No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        LastCandidate: Record "Resolution Candidates";
    begin
        TestVotingNotStarted();

        if "Line No." = 0 then begin
            LastCandidate.SetRange("Resolution No.", "Resolution No.");
            if LastCandidate.FindLast() then
                "Line No." := LastCandidate."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;

    trigger OnModify()
    begin
        TestVotingNotStarted();
    end;

    trigger OnDelete()
    var
        Ballot: Record "Election Ballots";
    begin
        TestVotingNotStarted();

        Ballot.SetRange("Resolution No.", "Resolution No.");
        Ballot.SetRange("Candidate Line No.", "Line No.");
        if not Ballot.IsEmpty() then
            Ballot.DeleteAll();
    end;

    local procedure TestVotingNotStarted()
    var
        Resolution: Record "Meeting Resolutions";
    begin
        if not Resolution.Get("Resolution No.") then
            exit;

        if Resolution."Resolution Type" <> Resolution."Resolution Type"::"Candidate Election" then
            Error(NotElectionErr);

        if Resolution."Voting Status" <> Resolution."Voting Status"::"Not Started" then
            Error(CandidatesLockedErr);
    end;

    var
        NotElectionErr: Label 'Candidates can only be added when the Resolution Type is Candidate Election.';
        CandidatesLockedErr: Label 'Candidates cannot be changed once voting has started.';
}
