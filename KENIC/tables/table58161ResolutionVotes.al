#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58161 "Resolution Votes"
{
    Caption = 'Resolution Votes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Resolution No."; Code[20])
        {
            Caption = 'Resolution No.';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Resolutions"."No.";
            Editable = false;
        }
        field(2; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            DataClassification = ToBeClassified;
            TableRelation = "Board Members";
            Editable = false;
        }
        field(3; "Member Name"; Text[250])
        {
            Caption = 'Member Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Vote"; Option)
        {
            Caption = 'Vote';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,For,Against,Abstain';
            OptionMembers = " ",For,Against,Abstain;

            trigger OnValidate()
            var
                Resolution: Record "Meeting Resolutions";
            begin
                if "Vote" = xRec."Vote" then
                    exit;

                Resolution.Get("Resolution No.");
                if Resolution."Voting Status" <> Resolution."Voting Status"::Open then
                    Error(VotingNotOpenErr);

                if "Vote" = "Vote"::" " then
                    Error(CannotUnvoteErr);

                "Voted At" := CurrentDateTime();
            end;
        }
        field(5; "Voted At"; DateTime)
        {
            Caption = 'Voted At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Election Voted"; Boolean)
        {
            Caption = 'Ballot Cast';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "IP Address"; Text[50])
        {
            Caption = 'IP Address';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
        }
        field(11; "Browser"; Text[100])
        {
            Caption = 'Browser';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
        }
        field(12; "Operating System"; Text[100])
        {
            Caption = 'Operating System';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
        }
        field(13; "Device Type"; Text[30])
        {
            Caption = 'Device Type';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
        }
        field(14; "User Agent"; Text[500])
        {
            Caption = 'User Agent';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Resolution No.", "Member No.")
        {
            Clustered = true;
        }
    }

    var
        VotingNotOpenErr: Label 'Voting is not currently open for this resolution.';
        CannotUnvoteErr: Label 'You cannot clear a vote once cast. Choose For, Against, or Abstain to change it.';
}
