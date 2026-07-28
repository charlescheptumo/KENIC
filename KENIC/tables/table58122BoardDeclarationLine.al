table 58122 "Board Declaration Line"
{
    Caption = 'Board Declaration Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Declaration No."; Code[20])
        {
            Caption = 'Declaration No.';
            DataClassification = CustomerContent;
            TableRelation = "Board Declaration Header"."No.";
            Editable = false;
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(3; "Interest Type"; Code[20])
        {
            Caption = 'Interest Type Code';
            DataClassification = CustomerContent;
            TableRelation = "Declaration Interest Type".Code where(Blocked = const(false));
            Editable = true;

            trigger OnValidate()
            var
                InterestTypeRec: Record "Declaration Interest Type";
            begin
                if InterestTypeRec.Get("Interest Type") then
                    "Interest Type Description" := InterestTypeRec.Description
                else
                    "Interest Type Description" := '';
            end;
        }

        field(12; "Interest Type Description"; Text[100])
        {
            Caption = 'Interest Type Description';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(4; "Organization"; Text[100])
        {
            Caption = 'Organization';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(5; "Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(6; "Percentage"; Decimal)
        {
            Caption = 'Percentage';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
            Editable = false;
        }

        field(7; "Active"; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
            InitValue = true;
            Editable = false;
        }

        field(8; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(9; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(10; "Potential Conflict"; Boolean)
        {
            Caption = 'Potential Conflict';
            DataClassification = CustomerContent;
            InitValue = false;
            Editable = false;
        }

        field(11; "Comments"; Text[256])
        {
            Caption = 'Comments';
            DataClassification = CustomerContent;
            Editable = false;
        }


    }

    keys
    {
        key(PK; "Declaration No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        Header: Record "Board Declaration Header";
    begin

        if Header.Get("Declaration No.") then
            if Header."Declaration Status" <> Header."Declaration Status"::Open then
                Error('You can only modify or delete lines when the declaration is in Open status.');
    end;
}