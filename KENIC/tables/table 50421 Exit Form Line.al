/// <summary>
/// Table Exit Form Line (ID 50421).
/// One generic line table for every repeating block: clearance sign-offs, intern ratings and weekly logs.
/// The Section field says which block a line belongs to; the card page filters on it.
/// </summary>
table 50421 "Exit Form Line"
{
    Caption = 'Exit Form Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Exit Form Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Section; Text[50])
        {
            Caption = 'Section';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Name / Criteria / Week';
        }
        field(5; "Month/Year"; Text[30])
        {
            Caption = 'Month and Year';
        }
        field(6; Score; Integer)
        {
            Caption = 'Score';
            MinValue = 0;
            MaxValue = 6;
        }
        field(7; Details; Text[250])
        {
            Caption = 'Activities Done';
        }
        field(8; "Signed By"; Text[100])
        {
            Caption = 'Signature';
        }
        field(9; "Signature Date"; Date)
        {
            Caption = 'Date';
        }
        field(10; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ExitFormLine: Record "Exit Form Line";
    begin
        if "Line No." = 0 then begin
            ExitFormLine.SetRange("Document No.", "Document No.");
            if ExitFormLine.FindLast() then
                "Line No." := ExitFormLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;
}
