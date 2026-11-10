#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
// Secret ballot: one row per (member, chosen candidate). No page shows this table,
// users only ever see totals per candidate (Resolution Candidates."Vote Count").
table 58167 "Election Ballots"
{
    Caption = 'Election Ballots';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Resolution No."; Code[20])
        {
            Caption = 'Resolution No.';
            DataClassification = CustomerContent;
            TableRelation = "Meeting Resolutions"."No.";
        }
        field(2; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            DataClassification = CustomerContent;
        }
        field(3; "Candidate Line No."; Integer)
        {
            Caption = 'Candidate Line No.';
            DataClassification = CustomerContent;
            TableRelation = "Resolution Candidates"."Line No." where("Resolution No." = field("Resolution No."));
        }
        field(4; "Voted At"; DateTime)
        {
            Caption = 'Voted At';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Resolution No.", "Member No.", "Candidate Line No.")
        {
            Clustered = true;
        }
        key(ByCandidate; "Resolution No.", "Candidate Line No.")
        {
        }
    }
}
