table 58145 "ESign Line"
{
    DataClassification = CustomerContent;
    Caption = 'ESign Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = "ESign Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Board Member No."; Code[50])
        {
            Caption = 'Board Member No.';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "Board Members"."Personal No";

            trigger OnValidate()
            var
                BoardMember: Record "Board Members";
            begin
                BoardMember.SetRange("Personal No", "Board Member No.");
                if BoardMember.FindFirst() then begin
                    "Board Member Name" :=
                        DelChr(StrSubstNo('%1 %2 %3',
                            BoardMember."First Name",
                            BoardMember."Middle Name",
                            BoardMember."Last Name"), '>', ' ');
                    Email := BoardMember."Company E-Mail";
                end else begin
                    "Board Member Name" := '';
                    Email := '';
                end;
            end;
        }
        field(4; "Board Member Name"; Text[100])
        {
            Caption = 'Board Member Name';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(5; Email; Text[80])
        {
            Caption = 'Email';
            DataClassification = EndUserIdentifiableInformation;
            ExtendedDatatype = EMail;
            Editable = false;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Pending,Signed,Declined;
            OptionCaption = 'Pending,Signed,Declined';
            DataClassification = CustomerContent;
            InitValue = Pending;
            Editable = false;

            trigger OnValidate()
            begin
                case Status of
                    Status::Signed,
                    Status::Declined:
                        if "Signed/Declined Date" = 0DT then
                            "Signed/Declined Date" := CurrentDateTime();

                    Status::Pending:
                        "Signed/Declined Date" := 0DT;
                end;
            end;
        }
        field(7; "Signed/Declined Date"; DateTime)
        {
            Caption = 'Signed/Declined Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Signing Order"; Integer)
        {
            Caption = 'Signing Order';
            DataClassification = CustomerContent;
            MinValue = 1;
            InitValue = 1;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        // key(SequenceKey; "Document No.", "Signing Order")
        // {

        // }
    }
}