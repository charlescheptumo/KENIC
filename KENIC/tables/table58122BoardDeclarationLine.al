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
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }

        field(3; "Interest Type"; Enum "Declaration Interest Type")
        {
            Caption = 'Interest Type';
            DataClassification = CustomerContent;
        }

        field(4; "Organization"; Text[100])
        {
            Caption = 'Organization';
            DataClassification = CustomerContent;
        }

        field(5; "Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(6; "Percentage"; Decimal)
        {
            Caption = 'Percentage';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }

        field(7; "Active"; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
            InitValue = true;
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
            if Header."Declaration Status" <> Header."Declaration Status"::Draft then
                Error('You can only modify or delete lines when the declaration is in Draft status.');
    end;
}